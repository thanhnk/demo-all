package sg.gov.wda;

import org.apache.sling.api.SlingHttpServletRequest;

import sg.gov.wda.adapters.CoursePage;

public interface CourseService {
	public static String COURSE_NODE_TYPE = "";
	public static final String COURSE_BASE_PATH = "/etc/wda/courses";
	public static final String SOLR_SERVER = "http://localhost:8888/solr/collection1";

	public AJAXResponse createCourse(SlingHttpServletRequest request);

	public AJAXResponse approveCourse(SlingHttpServletRequest request);

	public AJAXResponse updateCourse(SlingHttpServletRequest request);

	public AJAXResponse deleteCourse(SlingHttpServletRequest request);

	public AJAXResponse getJsonCourse(SlingHttpServletRequest request);

	public CoursePage getCourse(SlingHttpServletRequest request);

	public AJAXResponse queryCourse(SlingHttpServletRequest request);

	public AJAXResponse solrIndex(SlingHttpServletRequest request);
}
