package sg.gov.wda.adapters;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sg.gov.wda.CourseService;

public class CourseContentTypeFactory {
	private static final Logger LOG = LoggerFactory
			.getLogger(CourseContentTypeFactory.class);

	public static final String SLING_RESOURCE_TYPE_COURSE_PAGE = "wda/components/page/course";

	public static CourseContentType getInstance(Resource resource) {

		if (null == resource) {
			LOG.error("Can't adapt a null resource");
			return null;
		}

		CourseContentType contentType = null;
		if (resource.getPath().startsWith(CourseService.COURSE_BASE_PATH)) {
			contentType = resource.adaptTo(CoursePage.class);
		} else {
			LOG.warn("Unsupported sling:resourceType detected.'");
		}

		return contentType;
	}

	public static String getSlingResourceType(Resource resource) {

		if (null == resource) {
			return null;
		}

		final ValueMap valueMap = resource.adaptTo(ValueMap.class);
		return valueMap.get("jcr:content/sling:resourceType", String.class);
	}
}
