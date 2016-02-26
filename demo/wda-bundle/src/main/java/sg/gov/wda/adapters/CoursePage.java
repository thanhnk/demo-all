package sg.gov.wda.adapters;

import java.util.Date;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.apache.solr.common.SolrInputDocument;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sg.gov.wda.util.SolrTimestamp;

import com.day.cq.wcm.api.NameConstants;

public class CoursePage extends CourseContentType {

	private static final Logger log = LoggerFactory.getLogger(CoursePage.class);

	private String id;

	private String courseRef;
	private String courseTitle;
	private String courseType;
	private String courseArea;
	private String courseObjective;
	private String courseContent;
	private String courseLang;
	private String courseUrl;
	private String courseCost;
	private String courseHours;
	private String courseDetails;
	private String courseImageUrl;

	private Date publishDate;
	private Date lastUpdate;

	private String status;

	public CoursePage() {

	}

	public CoursePage(String id) {
		this.id = id;
	}

	public static CoursePage adaptFromResource(Resource resource) {

		final String id = resource.getName();
		final ValueMap valueMap = resource.adaptTo(ValueMap.class);
		final String courseRef = valueMap.get("courseRef", "");
		final String courseTitle = valueMap.get("courseTitle", "");
		final String courseType = valueMap.get("courseType", "");
		final String courseArea = valueMap.get("courseArea", "");
		final String courseObjective = valueMap.get("courseObjective", "");
		final String courseContent = valueMap.get("courseContent", "");
		final String courseLang = valueMap.get("courseLang", "");
		final String courseUrl = valueMap.get("courseUrl", "");
		final String courseCost = valueMap.get("courseCost", "");
		final String courseHours = valueMap.get("courseHours", "");
		final String status = valueMap.get("status", "");

		final String courseDetails = valueMap.get("courseDetails", "");
		final String courseImageUrl = valueMap.get("courseImageUrl", "");

		final Date lastUpdate = valueMap.get(NameConstants.PN_LAST_MOD,
				Date.class);

		CoursePage article = new CoursePage(id).withCourseRef(courseRef)
				.withCourseArea(courseArea).withCourseContent(courseContent)
				.withCourseCost(courseCost).withCourseHours(courseHours)
				.withCourseLang(courseLang)
				.withCourseObjective(courseObjective).withCourseRef(courseRef)
				.withCourseTitle(courseTitle).withCourseType(courseType)
				.withCourseUrl(courseUrl).withLastUpdate(lastUpdate)
				.withStatus(status).withCourseDetails(courseDetails)
				.withCourseImageUrl(courseImageUrl);

		return article;
	}

	@Override
	public JSONObject getJson() {
		JSONObject json = new JSONObject();
		json.put(CourseSchema.ID, getId());
		json.put(CourseSchema.COURSEREF, getCourseRef());
		json.put(CourseSchema.COURSETITLE, getCourseTitle());

		json.put(CourseSchema.COURSETYPE, getCourseType());
		json.put(CourseSchema.COURSEAREA, getCourseArea());
		json.put(CourseSchema.COURSEOBJECTIVE, getCourseObjective());
		json.put(CourseSchema.COURSECONTENT, getCourseContent());
		json.put(CourseSchema.COURSELANG, getCourseLang());
		json.put(CourseSchema.COURSEURL, getCourseUrl());
		json.put(CourseSchema.COURSECOST, getCourseCost());
		json.put(CourseSchema.COURSEHOURS, getCourseHours());
		json.put(CourseSchema.STATUS, getStatus());
		json.put(CourseSchema.COURSEDETAILS, getCourseDetails());

		json.put(CourseSchema.LAST_MODIFIED,
				SolrTimestamp.convertToUtcAndUseNowIfNull(getLastUpdate()));
		json.put(CourseSchema.PUBLISH_DATE,
				SolrTimestamp.convertToUtcAndUseNowIfNull(getPublishDate()));

		return json;
	}

	@Override
	public SolrInputDocument getSolrDoc() {
		SolrInputDocument doc = new SolrInputDocument();

		doc.addField(CourseSchema.ID, getId());
		doc.addField(CourseSchema.COURSEREF, getCourseRef());
		doc.addField(CourseSchema.COURSETITLE, getCourseTitle());
		doc.addField(CourseSchema.COURSETYPE, getCourseType());
		doc.addField(CourseSchema.COURSEAREA, getCourseArea());
		doc.addField(CourseSchema.COURSEOBJECTIVE, getCourseObjective());
		doc.addField(CourseSchema.COURSECONTENT, getCourseContent());
		doc.addField(CourseSchema.COURSELANG, getCourseLang());
		doc.addField(CourseSchema.COURSEURL, getCourseUrl());
		doc.addField(CourseSchema.COURSECOST, getCourseCost());
		doc.addField(CourseSchema.COURSEHOURS, getCourseHours());
		doc.addField(CourseSchema.STATUS, getStatus());
		doc.addField(CourseSchema.COURSEDETAILS, getCourseDetails());

		doc.addField(CourseSchema.LAST_MODIFIED,
				SolrTimestamp.convertToUtcAndUseNowIfNull(getLastUpdate()));
		doc.addField(CourseSchema.PUBLISH_DATE,
				SolrTimestamp.convertToUtcAndUseNowIfNull(getPublishDate()));

		return doc;
	}

	public CoursePage withCourseDetails(String courseDetails) {
		this.courseDetails = courseDetails;
		return this;
	}

	public CoursePage withCourseImageUrl(String courseImageUrl) {
		this.courseImageUrl = courseImageUrl;
		return this;
	}

	public CoursePage withStatus(String status) {
		this.status = status;
		return this;
	}

	public CoursePage withCourseRef(String courseRef) {
		this.courseRef = courseRef;
		return this;
	}

	public CoursePage withCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
		return this;
	}

	public CoursePage withCourseType(String courseType) {
		this.courseType = courseType;
		return this;
	}

	public CoursePage withCourseArea(String courseArea) {
		this.courseArea = courseArea;
		return this;
	}

	public CoursePage withCourseObjective(String courseObjective) {
		this.courseObjective = courseObjective;
		return this;
	}

	public CoursePage withCourseContent(String courseContent) {
		this.courseContent = courseContent;
		return this;
	}

	public CoursePage withCourseLang(String courseLang) {
		this.courseLang = courseLang;
		return this;
	}

	public CoursePage withCourseUrl(String courseUrl) {
		this.courseUrl = courseUrl;
		return this;
	}

	public CoursePage withCourseCost(String courseCost) {
		this.courseCost = courseCost;
		return this;
	}

	public CoursePage withCourseHours(String courseHours) {
		this.courseHours = courseHours;
		return this;
	}

	public CoursePage withPublishDate(Date publishDate) {
		this.publishDate = publishDate;
		return this;
	}

	public CoursePage withLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
		return this;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCourseRef() {
		return courseRef;
	}

	public void setCourseRef(String courseRef) {
		this.courseRef = courseRef;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public String getCourseArea() {
		return courseArea;
	}

	public void setCourseArea(String courseArea) {
		this.courseArea = courseArea;
	}

	public String getCourseObjective() {
		return courseObjective;
	}

	public void setCourseObjective(String courseObjective) {
		this.courseObjective = courseObjective;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public String getCourseLang() {
		return courseLang;
	}

	public void setCourseLang(String courseLang) {
		this.courseLang = courseLang;
	}

	public String getCourseUrl() {
		return courseUrl;
	}

	public void setCourseUrl(String courseUrl) {
		this.courseUrl = courseUrl;
	}

	public String getCourseCost() {
		return courseCost;
	}

	public void setCourseCost(String courseCost) {
		this.courseCost = courseCost;
	}

	public String getCourseHours() {
		return courseHours;
	}

	public void setCourseHours(String courseHours) {
		this.courseHours = courseHours;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCourseDetails() {
		return courseDetails;
	}

	public void setCourseDetails(String courseDetails) {
		this.courseDetails = courseDetails;
	}

	public String getCourseImageUrl() {
		return courseImageUrl;
	}

	public void setCourseImageUrl(String courseImageUrl) {
		this.courseImageUrl = courseImageUrl;
	}

}
