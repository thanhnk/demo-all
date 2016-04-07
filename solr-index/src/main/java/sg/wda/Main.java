package sg.wda;

import java.io.File;
import java.text.ParseException;
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

	// public static final String SOLR_SERVER =
	// "http://localhost:8888/solr/collection1";
	public static final String SOLR_SERVER = "http://localhost:8983/solr/techproducts";
	private static SolrClient solr;
	private static String inputFile = "D:/DataStag1ASFC.xlsx";
	private static String sheetName = "courses_sample_extract_20160317";
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
			process();
			// log.info("Continue import sheet 2");
			// sheetName = "default2";
			// process();
		} catch (Exception e) {
			e.printStackTrace();
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
		try {
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
			commitIndex();
		} catch (Exception e) {
			e.printStackTrace();
			log.warning("Exception at row: " + count);
		}
		inputWorkbook.close();
	}

	private static SolrInputDocument convert(Row row) throws ParseException {
		SolrInputDocument doc = new SolrInputDocument();

		String Course_Ref_No = getCellStringValue(row.getCell(1));
		if (StringUtils.isEmpty(Course_Ref_No)) {
			return null;
		}
		doc.addField("Course_Ref_No", Course_Ref_No);
		doc.addField(CourseSchema.ID, Course_Ref_No);

		// StringUtils.abbreviate(str, maxWidth)
		String Course_Title = getCellStringValue(row.getCell(4));
		Course_Title = StringTitleUtils.clean(Course_Title);
		doc.addField("Course_Title", Course_Title);

		String Course_Objective = getCellStringValue(row.getCell(5));
		doc.addField("Course_Objective", Course_Objective);

		String Course_Content = getCellStringValue(row.getCell(6));
		doc.addField("Course_Content", Course_Content);

		String Organisation_Name = "";
		doc.addField("Organisation_Name", Organisation_Name);

		String TP_ALIAS = getCellStringValue(row.getCell(44));
		doc.addField("TP_ALIAS", TP_ALIAS);

		String Area_of_Training = getCellStringValue(row.getCell(17));
		doc.addField("Area_of_Training",
				CodeUtil.getAreaOfTrainingFromCode(Area_of_Training));

		String Mode_of_Training = getCellStringValue(row.getCell(25));
		{
			String[] items = CodeUtil.getModeOfTraining(Mode_of_Training);
			for (String item : items) {
				doc.addField("Mode_of_Training", item);
			}
		}

		String Medium_of_Instruction = getCellStringValue(row.getCell(26));
		{
			String[] items = CodeUtil
					.getMediumOfInstruction(Medium_of_Instruction);
			for (String item : items) {
				doc.addField("Medium_of_Instruction", item);
			}
		}

		String Tol_Cost_of_Trn_Per_Trainee = getCellStringValue(row.getCell(15));
		if (StringUtils.isNoneEmpty(Tol_Cost_of_Trn_Per_Trainee)) {
			doc.addField("Tol_Cost_of_Trn_Per_Trainee",
					Float.valueOf(Tol_Cost_of_Trn_Per_Trainee));
		}

		String Total_Training_Duration_Hrs = getCellStringValue(row.getCell(13));
		if (StringUtils.isNoneEmpty(Total_Training_Duration_Hrs)) {
			doc.addField("Total_Training_Duration_Hrs",
					Float.valueOf(Total_Training_Duration_Hrs));
		}

		String Len_of_Course_Duration = getCellStringValue(row.getCell(14));
		if (StringUtils.isNoneEmpty(Len_of_Course_Duration)) {
			doc.addField("Len_of_Course_Duration",
					Integer.valueOf(Len_of_Course_Duration));
		}

		String Edu_of_Tar_Aud = getCellStringValue(row.getCell(20));
		{
			String[] items = CodeUtil.getEduOfTarAud(Edu_of_Tar_Aud);
			for (String item : items) {
				doc.addField("Edu_of_Tar_Aud", item);
			}
		}

		String Job_Level = getCellStringValue(row.getCell(21));
		{
			String[] items = CodeUtil.getJobLevel(Job_Level);
			for (String item : items) {
				doc.addField("Job_Level", item);
			}
		}

		String Course_Supp_Period_Frm_1 = getCellStringValue(row.getCell(47));
		doc.addField("Course_Supp_Period_Frm_1", SolrTimestamp
				.convertToUtc(DateUtil.parse("yyyyMMdd",
						Course_Supp_Period_Frm_1)));

		String Course_Supp_Period_To_1 = getCellStringValue(row.getCell(48));
		doc.addField("Course_Supp_Period_To_1", SolrTimestamp
				.convertToUtc(DateUtil.parse("yyyyMMdd",
						Course_Supp_Period_To_1)));
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

	public static Double getCellDoubleValue(Cell cell) {
		if (cell == null) {
			return 0D;
		}
		return cell.getNumericCellValue();
	}

}
