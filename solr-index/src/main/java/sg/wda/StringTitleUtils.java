package sg.wda;

import org.apache.commons.lang.StringUtils;

public final class StringTitleUtils {
	public static String maxWords(String str, int max) {
		String[] splits = str.split(" ", max);
		return StringUtils.join(splits, " ");
	}

	public static String clean(String str) {
		return str.replace(".", " ").replace(":", " ").replace("\"", " ");
	}
}
