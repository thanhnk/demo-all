package sg.wda;

import java.io.File;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Logger;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.common.SolrInputDocument;

import sg.gov.wda.adapters.CourseSchema;
import sg.gov.wda.util.SolrTimestamp;

public class Main {

	private static Logger log = Logger.getLogger(Main.class.getName());

	public static final String SOLR_SERVER = "http://localhost:8888/solr/collection1";
	private static SolrClient solr;
	private static String inputFile = "D:/CseData2.xlsx";
	private static String sheetName = "default1";
	private static int commitSize = 1000;
	private static boolean isDelete = true;

	public static void main(String[] args) {

		try {
			solr = new HttpSolrClient(SOLR_SERVER);
			if (isDelete) {
				solr.deleteByQuery("*:*");
				solr.commit();
			}

			if (StringUtils.isEmpty(inputFile)) {
				throw new Exception("InputFile is empty");
			}
			if (StringUtils.isEmpty(sheetName)) {
				throw new Exception("SheetName is empty");
			}
			log.info("Continue import sheet 2");
			process();
			sheetName = "default2";
			process();
		} catch (Exception e) {
			log.warning("" + e);
		}
	}

	private static void process() throws Exception {
		Workbook inputWorkbook = new XSSFWorkbook(new File(inputFile));
		Sheet inputSheet = inputWorkbook.getSheet(sheetName);
		inputSheet.removeRow(inputSheet.getRow(0)); // remove header line
		Iterator<Row> rows = inputSheet.iterator();
		SolrInputDocument doc = null;
		int count = 0;
		int commitNum = 0;
		while (rows.hasNext()) {
			doc = convert(rows.next());
			if (doc != null) {
				index(doc);
				count++;
				if (count == commitSize) {
					commitNum++;
					commitIndex();
					count = 0;
					log.info("Committed : " + commitNum * commitSize);
					solr.close();
					solr = new HttpSolrClient(SOLR_SERVER);
					// break;
				}
			}
		}
		inputWorkbook.close();
	}

	private static SolrInputDocument convert(Row row) {
		SolrInputDocument doc = new SolrInputDocument();

		String courseRef = getCellStringValue(row.getCell(0));
		if (StringUtils.isEmpty(courseRef)) {
			return null;
		}
		doc.addField(CourseSchema.COURSEREF, courseRef);

		doc.addField(CourseSchema.ID, courseRef);

		// StringUtils.abbreviate(str, maxWidth)
		String courseTitle = getCellStringValue(row.getCell(1));
		courseTitle = StringTitleUtils.clean(courseTitle);
		// courseTitle = StringTitleUtils.maxWords(courseTitle, 10);
		doc.addField(CourseSchema.COURSETITLE, courseTitle);
		doc.addField(CourseSchema.COURSETYPE,
				getCellStringValue(row.getCell(2)));
		doc.addField(CourseSchema.COURSEAREA,
				getCellStringValue(row.getCell(3)));
		doc.addField(CourseSchema.COURSEOBJECTIVE,
				getCellStringValue(row.getCell(4)));
		doc.addField(CourseSchema.COURSECONTENT,
				getCellStringValue(row.getCell(5)));
		doc.addField(CourseSchema.COURSELANG,
				getCellStringValue(row.getCell(7)));
		doc.addField(CourseSchema.COURSEURL, "");
		String courseCost = null;
		String courseHours = null;
		try {
			courseCost = getCellStringValue(row.getCell(12));
			if (StringUtils.isNoneEmpty(courseCost)) {
				doc.addField(CourseSchema.COURSECOST,
						Integer.valueOf(courseCost));
			}
			courseHours = getCellStringValue(row.getCell(13));
			if (StringUtils.isNoneEmpty(courseHours)) {
				doc.addField(CourseSchema.COURSEHOURS,
						Float.valueOf(courseHours));
			}
		} catch (NumberFormatException e) {
			log.warning("NumberFormatException - row : " + row.getRowNum()
					+ " - courseCost: " + courseCost + " - courseHours: "
					+ courseHours);
		}
		doc.addField(CourseSchema.STATUS, "new");

		doc.addField(CourseSchema.LAST_MODIFIED,
				SolrTimestamp.convertToUtcAndUseNowIfNull(new Date()));
		doc.addField(CourseSchema.PUBLISH_DATE,
				SolrTimestamp.convertToUtcAndUseNowIfNull(new Date()));
		return doc;
	}

	private static void commitIndex() throws Exception {
		solr.commit();

	}

	private static void index(SolrInputDocument doc) throws Exception {
		solr.add(doc);
	}

	public static String getCellStringValue(Cell cell) {
		if (cell == null) {
			return "";
		}
		cell.setCellType(Cell.CELL_TYPE_STRING);
		return cell.getStringCellValue();

	}

}
