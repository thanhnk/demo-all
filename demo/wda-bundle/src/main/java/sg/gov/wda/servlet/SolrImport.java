package sg.gov.wda.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.Servlet;
import javax.servlet.ServletException;

import org.apache.commons.lang3.StringUtils;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.common.SolrInputDocument;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sg.gov.wda.AJAXResponse;
import sg.gov.wda.adapters.CourseSchema;
import sg.gov.wda.util.RequestUtil;
import sg.gov.wda.util.SolrTimestamp;

@Component(name = "sg.gov.wda.servlet.SolrImport", label = "Solr Import From Excel - WDA", description = "Read data from excel file and send to solr", immediate = true, metatype = true)
@Service(Servlet.class)
@Properties({
		@Property(name = Constants.SERVICE_VENDOR, value = "WDA"),
		@Property(name = Constants.SERVICE_DESCRIPTION, value = "Read data from excel file and send to solr"),
		@Property(name = "sling.servlet.methods", value = "GET"),
		@Property(name = "sling.servlet.paths", value = "/apps/wda/solr/import") })
public class SolrImport extends SlingSafeMethodsServlet {
	private static final Logger log = LoggerFactory.getLogger(SolrImport.class);
	public static final String SOLR_SERVER = "http://localhost:8888/solr/collection1";
	private SolrClient solr;
	private String inputFile;
	private String sheetName;
	private int commitSize = 100;
	private ArrayList<SolrInputDocument> docs;

	@Override
	protected void doGet(SlingHttpServletRequest request,
			SlingHttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		AJAXResponse ajaxResponse = new AJAXResponse();

		try {
			solr = new HttpSolrClient(SOLR_SERVER);
			boolean isDelete = Boolean.valueOf(RequestUtil.getParameter(
					request, "isDelete", "true"));
			if (isDelete) {
				solr.deleteByQuery("*:*");
				solr.commit();
			}
			inputFile = RequestUtil.getParameter(request, "inputFile");
			sheetName = RequestUtil.getParameter(request, "sheetName");
			commitSize = Integer.valueOf(RequestUtil.getParameter(request,
					"commitSize", "100"));
			if (StringUtils.isEmpty(inputFile)) {
				throw new Exception("InputFile is empty");
			}
			if (StringUtils.isEmpty(sheetName)) {
				throw new Exception("SheetName is empty");
			}
			process();
			ajaxResponse.getMessage().add("Solr Indexed Successful");
		} catch (Exception e) {
			log.error("Cannot index to solr:" + e);
			ajaxResponse.getError().add(
					"Cannot index to solr. " + e.getMessage());
		}
		response.getWriter().write(ajaxResponse.toJson());
	}

	private void process() throws Exception {
		Workbook inputWorkbook = new XSSFWorkbook(new File(inputFile));
		Sheet inputSheet = inputWorkbook.getSheet(sheetName);
		inputSheet.removeRow(inputSheet.getRow(0)); // remove header line
		docs = new ArrayList<SolrInputDocument>(inputSheet.getLastRowNum());
		Iterator<Row> rows = inputSheet.iterator();
		SolrInputDocument doc = null;
		int count = 0;
		while (rows.hasNext()) {
			doc = convert(rows.next());
			index(doc);
			count++;
			if (count == commitSize) {
				commitIndex();
				count = 0;
			}
		}
		inputWorkbook.close();
	}

	private SolrInputDocument convert(Row row) {
		SolrInputDocument doc = new SolrInputDocument();

		doc.addField(CourseSchema.ID, UUID.randomUUID().toString());
		doc.addField(CourseSchema.COURSEREF, getCellStringValue(row.getCell(0)));
		doc.addField(CourseSchema.COURSETITLE,
				getCellStringValue(row.getCell(1)));
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
		doc.addField(CourseSchema.COURSECOST,
				getCellStringValue(row.getCell(12)));
		doc.addField(CourseSchema.COURSEHOURS,
				getCellStringValue(row.getCell(13)));
		doc.addField(CourseSchema.STATUS, "new");

		doc.addField(CourseSchema.LAST_MODIFIED,
				SolrTimestamp.convertToUtcAndUseNowIfNull(new Date()));
		doc.addField(CourseSchema.PUBLISH_DATE,
				SolrTimestamp.convertToUtcAndUseNowIfNull(new Date()));
		return doc;
	}

	private void commitIndex() throws Exception {
		solr.commit();
	}

	private void index(SolrInputDocument doc) throws Exception {
		solr.add(doc);
	}

	public static String getCellStringValue(Cell cell) {
		if (cell == null) {
			return "";
		}
		cell.setCellType(Cell.CELL_TYPE_STRING);
		return cell.getStringCellValue();
		// String value = "";
		// switch (cell.getCellType()) {
		// case Cell.CELL_TYPE_NUMERIC:
		// value = cell.getNumericCellValue() + "";
		// break;
		// case Cell.CELL_TYPE_STRING:
		// value = cell.getStringCellValue();
		// break;
		// }
		// return value;
	}
}
