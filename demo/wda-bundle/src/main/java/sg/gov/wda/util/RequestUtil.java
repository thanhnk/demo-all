package sg.gov.wda.util;

import org.apache.sling.api.SlingHttpServletRequest;

public class RequestUtil {
	public static String getParameter(SlingHttpServletRequest request,
			String name) {
		String param = request.getParameter(name);
		if (param != null) {
			return param.trim();
		} else {
			return null;
		}
	}

	public static String getParameter(SlingHttpServletRequest request,
			String name, String defaultValue) {
		String param = request.getParameter(name);
		if (param != null) {
			return param.trim();
		} else {
			return defaultValue;
		}
	}
}
