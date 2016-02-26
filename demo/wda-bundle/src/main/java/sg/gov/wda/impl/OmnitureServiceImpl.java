package sg.gov.wda.impl;

/**
 *
 */

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.jcr.Node;
import javax.jcr.Session;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.methods.InputStreamRequestEntity;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.commons.httpclient.methods.RequestEntity;
import org.apache.commons.lang3.StringUtils;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;
import org.apache.sling.commons.json.JSONArray;
import org.apache.sling.commons.json.JSONException;
import org.apache.sling.commons.json.JSONObject;
import org.apache.sling.commons.osgi.PropertiesUtil;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sg.gov.wda.AJAXResponse;
import sg.gov.wda.OmnitureService;
import sg.gov.wda.util.DateUtil;

import com.day.cq.commons.jcr.JcrUtil;
import com.day.cq.wcm.api.Page;
import com.day.cq.wcm.api.PageManager;

import flexjson.JSONSerializer;

@Service
@Component(immediate = true, metatype = true)
@Properties({
		@Property(name = Constants.SERVICE_VENDOR, value = "WDA"),
		@Property(name = Constants.SERVICE_DESCRIPTION, value = "Omniture sAPI Service") })
public class OmnitureServiceImpl implements OmnitureService {

	private static final Logger logger = LoggerFactory
			.getLogger(OmnitureServiceImpl.class);

	private static final String USERNAME = "nguyenky:Ncsapacpartersandbox";

	private static final String PW = "94c0d0984945f8166add36c30c67c61d";

	private static final String ENDPOINT = "https://api.omniture.com/admin/1.4/rest/";

	private static final String REPORT_SUIT_ID = "ncsawda-sit";

	private static final int DAY_COUNT = 30;

	private static final int CACHE_EXPIRE = 10;

	public static final Map<String, Page> cachedList = new HashMap<String, Page>();
	private static final Object mutex = new Object();

	@Reference
	private ResourceResolverFactory resolverFactory;

	/**
	 *
	 */
	public OmnitureServiceImpl() {
	}

	public AJAXResponse retrieveRelativePages(SlingHttpServletRequest request) {

		AJAXResponse ajaxResponse = new AJAXResponse();

		try {

			String currentPagePath = request.getRequestURI();
			currentPagePath = currentPagePath.substring(0,
					currentPagePath.length() - 5);

			@SuppressWarnings("deprecation")
			ResourceResolver resourceResolver = resolverFactory
					.getAdministrativeResourceResolver(null);
			PageManager pageManager = resourceResolver
					.adaptTo(PageManager.class);

			Page currentPage = pageManager.getPage(currentPagePath);

			String[] cacheRelativePage = PropertiesUtil.toStringArray(
					currentPage.getProperties().get("cacheRelativePage"), null);
			String cacheDateString = PropertiesUtil.toString(currentPage
					.getProperties().get("cacheDate"), "");
			boolean expire = true;
			if (StringUtils.isNoneEmpty(cacheDateString)) {
				Date cacheDate = DateUtil.parse(DateUtil.TIME_STAMP,
						cacheDateString);
				expire = getDateDiff(cacheDate, new Date(), TimeUnit.MINUTES) > CACHE_EXPIRE;
			}

			String currentTitle = currentPage.getTitle();

			List<String> newDataList = new ArrayList<String>();
			if (cacheRelativePage != null && !expire) {
				newDataList = Arrays.asList(cacheRelativePage);
			} else {

				Map<String, Object> map = new HashMap<String, Object>();
				map.put("reportSuiteID", REPORT_SUIT_ID);
				map.put("date", false);

				Calendar calendar = Calendar.getInstance();
				SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
				calendar.add(Calendar.DAY_OF_MONTH, -DAY_COUNT);
				Date fiveDaysAgo = calendar.getTime();
				Date today = new Date();
				map.put("dateFrom", ft.format(fiveDaysAgo));
				map.put("dateTo", ft.format(today));

				Map<String, Object> pageViews = new HashMap<String, Object>();
				pageViews.put("id", "pageViews");

				Map<String, Object> visits = new HashMap<String, Object>();
				visits.put("id", "visits");

				map.put("metrics", new Map[] { pageViews, visits });

				Map<String, Object> elements = new HashMap<String, Object>();
				elements.put("id", "page");
				elements.put("top", "10");
				elements.put("startingWith", "1");

				elements.put("pattern", new String[][] {
						new String[] { currentTitle },
						new String[] { "::anything::" },
						new String[] { "::anything::" } });

				map.put("elements", new Map[] { elements });

				Map<String, Object> reportDescription = new HashMap<String, Object>();
				reportDescription.put("reportDescription", map);

				JSONSerializer serializer = new JSONSerializer();
				String data = serializer.deepSerialize(reportDescription);

				logger.info("request_string " + data);

				String response = callMethod("Report.Queue", data);
				logger.info("response_string " + response);

				JSONObject jsonResponse = new JSONObject(response);
				Integer reportID = (Integer) jsonResponse.get("reportID");

				logger.info("_reportID " + reportID);
				JSONObject report = null;
				while (true) {

					report = getReport(reportID);
					try {
						String error = "";
						if (StringUtils
								.isNotEmpty((String) report.get("error"))) {
							error = (String) report.get("error"); // this
																	// will
																	// throw
																	// JSONException
																	// if no
																	// more
																	// error
						}
						if (!"report_not_ready".equals(error)) {
							logger.info("error retrieving report "
									+ report.toString());
							report = null;
							break;
						}
						Thread.sleep(1000);
					} catch (JSONException e) {
						logger.error("", e);
						break;
					}

				}

				// https://sling.apache.org/apidocs/sling5/org/apache/sling/commons/json/JSONObject.html#optJSONArray(java.lang.String)

				if (report != null) {
					JSONObject reportObject = report.optJSONObject("report");

					if (reportObject != null) {
						JSONArray jsonArrayData = reportObject
								.optJSONArray("data");
						logger.info("jsonData: " + jsonArrayData);
						for (int i = 0; i < jsonArrayData.length(); i++) {
							JSONObject jsonData = jsonArrayData
									.optJSONObject(i);
							if (jsonData != null) {
								JSONArray pathArrayData = jsonData
										.optJSONArray("path");
								String path = pathArrayData.optJSONObject(1)
										.optString("url");
								path = filterPageUrl(request, path);
								if (!path.equals(currentPagePath)
										&& StringUtils.isNoneEmpty(path)) {
									newDataList.add(path);
								}

							}
						}
					} else {
						logger.info(" reportObject is null");
					}
				}

				logger.info("newDataList: " + newDataList.toString());
				if (!newDataList.isEmpty()) {
					logger.info("getting the the list of popular successful");
					synchronized (mutex) {

						final Session session = resourceResolver
								.adaptTo(Session.class);
						final Node pageContent = session.getNode(currentPage
								.getPath() + "/jcr:content");
						JcrUtil.setProperty(pageContent, "cacheRelativePage",
								newDataList.toArray());
						JcrUtil.setProperty(pageContent, "cacheDate",
								DateUtil.getDateTimestamp());
						session.save();
					}
				} else {
					logger.info("getting the the list of popular NOT successful");
				}

			}

			ajaxResponse.getInfo().addAll(
					convertUrlToPage(pageManager, newDataList));

		} catch (Exception e) {
			logger.error("retrieveMostPopularPages exception ", e);
		}

		return ajaxResponse;

	}

	private List<Page> convertUrlToPage(PageManager pageManager,
			List<String> list) {
		List<Page> result = new ArrayList<Page>(list.size());
		for (String item : list) {
			if (StringUtils.isNoneEmpty(item)) {
				Page page = pageManager.getPage(item);
				result.add(page);
			}
		}
		return result;
	}

	/**
	 *
	 * @param method
	 * @param data
	 * @return
	 * @throws Exception
	 */
	public String callMethod(String method, String data) {
		String result = "";
		// http://www.programcreek.com/java-api-examples/index.php?api=org.apache.commons.httpclient.methods.RequestEntity
		InputStream in = null;

		try {
			HttpClient httpClient = new HttpClient();
			PostMethod postMethod = new PostMethod(ENDPOINT + "?method="
					+ method);
			postMethod.addRequestHeader("X-WSSE", getHeader());

			in = new ByteArrayInputStream(data.toString().getBytes("UTF-8"));
			RequestEntity entity = new InputStreamRequestEntity(in, -1,
					"application/json");
			postMethod.setRequestEntity(entity);

			httpClient.executeMethod(postMethod);
			result = postMethod.getResponseBodyAsString();
		} catch (Exception e) {
			logger.error("", e);
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (IOException ioe) {
				logger.error("", ioe);
			}
		}

		return result;
	}

	/**
	 * http://stackoverflow.com/questions/1555262/calculating-the-difference-
	 * between-two-java-date-instances Get a diff between two dates
	 * 
	 * @param date1
	 *            the oldest date
	 * @param date2
	 *            the newest date
	 * @param timeUnit
	 *            the unit in which you want the diff
	 * @return the diff value, in the provided unit
	 */
	public long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
		long diffInMillies = date2.getTime() - date1.getTime();
		return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
	}

	private String filterPageUrl(SlingHttpServletRequest request, String url) {
		String result = url;
		if (result.endsWith(".html")) {
			result = result.substring(0, result.length() - 5);
		}
		String baseServerPath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort();
		if (result.startsWith(baseServerPath)) {
			result = result.substring(baseServerPath.length());
		} else if (result.startsWith(request.getScheme() + ":")) {
			result = result.substring(5);
		}
		return result;
	}

	/**
	 *
	 * @param reportID
	 * @return
	 */
	public JSONObject getReport(Integer reportID) {

		JSONObject jsonResponse = null;
		try {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("reportID", reportID);

			JSONSerializer serializer = new JSONSerializer();
			String data = serializer.deepSerialize(map);
			logger.info("getReport request  " + data);
			String response = callMethod("Report.Get", data);
			logger.info("getReport response  " + response);

			jsonResponse = new JSONObject(response);

			return jsonResponse;

		} catch (Exception e) {
			logger.error("getReport exception ", e);
		}

		return jsonResponse;
	}

	public String test() {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rs_type", new String[] { "standard" });
		map.put("sp", "");
		try {

			JSONSerializer serializer = new JSONSerializer();
			String response = callMethod("Report.Queue",
					serializer.serialize(map));
			logger.info("response_string " + response);
			return response;

		} catch (Exception e) {
			logger.error("test ", e);
		}
		return "";
	}

	/**
	 *
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	private String getHeader() throws UnsupportedEncodingException {
		byte[] nonceB = generateNonce();
		String nonce = base64Encode(nonceB);
		String created = generateTimestamp();
		String pw64 = getBase64Digest(nonceB, created.getBytes("UTF-8"),
				PW.getBytes("UTF-8"));
		StringBuffer header = new StringBuffer("UsernameToken Username=\"");
		header.append(USERNAME);
		header.append("\", ");
		header.append("PasswordDigest=\"");
		header.append(pw64.trim());
		header.append("\", ");
		header.append("Nonce=\"");
		header.append(nonce);
		header.append("\", ");
		header.append("Created=\"");
		header.append(created);
		header.append("\"");
		return header.toString();
	}

	/**
	 *
	 * @return
	 */
	private byte[] generateNonce() {
		String nonce = Long.toString(new Date().getTime());
		return nonce.getBytes();
	}

	/**
	 *
	 * @param bytes
	 * @return
	 */
	private String base64Encode(byte[] bytes) {
		return Base64.encodeBase64String(bytes);
	}

	/**
	 *
	 * @return
	 */
	private String generateTimestamp() {
		SimpleDateFormat dateFormatter = new SimpleDateFormat(
				"yyyy-MM-dd'T'HH:mm:ssZ");
		return dateFormatter.format(new Date());
	}

	/**
	 *
	 * @param nonce
	 * @param created
	 * @param pw
	 * @return
	 */
	private synchronized String getBase64Digest(byte[] nonce, byte[] created,
			byte[] pw) {
		try {
			MessageDigest messageDigester = MessageDigest.getInstance("SHA-1");
			messageDigester.reset();
			messageDigester.update(nonce);
			messageDigester.update(created);
			messageDigester.update(pw);
			return base64Encode(messageDigester.digest());
		} catch (java.security.NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
	}

}
