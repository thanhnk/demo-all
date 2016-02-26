package sg.gov.wda.impl;

import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.jcr.Node;
import javax.jcr.RepositoryException;
import javax.jcr.Session;

import org.apache.commons.lang3.StringUtils;
import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Reference;
import org.apache.felix.scr.annotations.Service;
import org.apache.jackrabbit.commons.JcrUtils;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.resource.LoginException;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ResourceResolver;
import org.apache.sling.api.resource.ResourceResolverFactory;
import org.apache.sling.jcr.api.SlingRepository;
import org.apache.sling.jcr.resource.JcrResourceUtil;
import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.UpdateResponse;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sg.gov.wda.AJAXResponse;
import sg.gov.wda.CourseService;
import sg.gov.wda.adapters.CourseContentType;
import sg.gov.wda.adapters.CourseContentTypeFactory;
import sg.gov.wda.adapters.CoursePage;
import sg.gov.wda.adapters.CourseSchema;
import sg.gov.wda.util.RequestUtil;

import com.day.cq.commons.jcr.JcrConstants;
import com.day.cq.search.PredicateGroup;
import com.day.cq.search.Query;
import com.day.cq.search.QueryBuilder;
import com.day.cq.search.result.Hit;
import com.day.cq.search.result.SearchResult;
import com.day.cq.wcm.api.NameConstants;

@Service
@Component(immediate = true, metatype = true)
@Properties({
		@Property(name = Constants.SERVICE_VENDOR, value = "WDA"),
		@Property(name = Constants.SERVICE_DESCRIPTION, value = "Course Service") })
public class CourseServiceImpl implements CourseService {

	protected final Logger log = LoggerFactory.getLogger(this.getClass());

	// Inject a Sling ResourceResolverFactory
	@Reference
	private ResourceResolverFactory resolverFactory;

	@Reference
	private SlingRepository repository;

	@Reference
	private QueryBuilder queryBuilder;

	private Session session;

	public AJAXResponse solrIndex(SlingHttpServletRequest request) {
		AJAXResponse ajaxResponse = new AJAXResponse();
		try {
			SolrClient solr = new HttpSolrClient(SOLR_SERVER);
			String courseId = RequestUtil.getParameter(request, "id", "");
			ResourceResolver resourceResolver = resolverFactory
					.getAdministrativeResourceResolver(null);

			Resource resource = resourceResolver.getResource(COURSE_BASE_PATH
					+ "/" + courseId);
			CourseContentType contentType = CourseContentTypeFactory
					.getInstance(resource);
			if (contentType != null) {
				UpdateResponse response = solr.add(contentType.getSolrDoc());
				solr.commit();
			}

			ajaxResponse.getMessage().add("Solr Indexed Successful");
		} catch (Exception e) {
			log.error("Cannot index to solr:" + e);
			ajaxResponse.getError().add("Cannot index to solr.");
		}
		return ajaxResponse;
	}

	public AJAXResponse createCourse(SlingHttpServletRequest request) {
		AJAXResponse ajaxResponse = new AJAXResponse();
		try {
			ResourceResolver resourceResolver = resolverFactory
					.getAdministrativeResourceResolver(null);
			session = resourceResolver.adaptTo(Session.class);
			// Create a node that represents the root node
			validatePath(COURSE_BASE_PATH);
			Node root = session.getNode(COURSE_BASE_PATH);
			String courseId = UUID.randomUUID().toString();
			Node course = JcrUtils.getOrAddNode(root, courseId,
					JcrConstants.NT_UNSTRUCTURED);
			JcrResourceUtil.setProperty(course, NameConstants.PN_CREATED,
					new Date());
			JcrResourceUtil.setProperty(course, NameConstants.PN_CREATED_BY,
					request.getUserPrincipal().getName());
			JcrResourceUtil.setProperty(course, NameConstants.PN_LAST_MOD,
					new Date());
			JcrResourceUtil.setProperty(course, NameConstants.PN_LAST_MOD_BY,
					request.getUserPrincipal().getName());

			JcrResourceUtil.setProperty(course, "status", "new");
			if (course != null) {
				writeCourseInfo(request, course);
			}
			session.save();
			session.logout();

			ajaxResponse.getMessage().add("Successful");

		} catch (Exception e) {
			ajaxResponse.getError().add("Server Error. Cannot create course.");
			log.error("" + e);
		}

		return ajaxResponse;
	}

	public AJAXResponse approveCourse(SlingHttpServletRequest request) {
		AJAXResponse ajaxResponse = new AJAXResponse();
		try {
			String courseId = RequestUtil.getParameter(request, "id", "");
			Session session = repository.loginAdministrative(null);
			Node course = session.getNode(COURSE_BASE_PATH + "/" + courseId);
			JcrResourceUtil
					.setProperty(course, CourseSchema.STATUS, "approved");
			session.save();
			session.logout();
			ajaxResponse.getMessage().add("Approved Success");
		} catch (Exception e) {
			ajaxResponse.getError().add("Server Error. Cannot approve course.");
		}

		return ajaxResponse;
	}

	public AJAXResponse updateCourse(SlingHttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	public AJAXResponse deleteCourse(SlingHttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	public CoursePage getCourse(SlingHttpServletRequest request) {
		try {
			String courseId = RequestUtil.getParameter(request, "id", "");
			ResourceResolver resourceResolver = resolverFactory
					.getAdministrativeResourceResolver(null);

			Resource resource = resourceResolver.getResource(COURSE_BASE_PATH
					+ "/" + courseId);
			CourseContentType contentType = CourseContentTypeFactory
					.getInstance(resource);
			if (contentType != null) {
				return (CoursePage) contentType;
			}
		} catch (LoginException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// TODO Auto-generated method stub
		return null;
	}

	public AJAXResponse getJsonCourse(SlingHttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

	public AJAXResponse queryCourse(SlingHttpServletRequest request) {

		AJAXResponse ajaxResponse = new AJAXResponse();

		Map<String, String> params = new HashMap<String, String>();
		params.put("path", COURSE_BASE_PATH);
		params.put("type", JcrConstants.NT_UNSTRUCTURED);
		params.put("p.offset", "0");
		params.put("p.limit", "50");

		String searchStatus = RequestUtil.getParameter(request, "searchStatus",
				"");
		if (StringUtils.isNoneEmpty(searchStatus)) {
			params.put("property", CourseSchema.STATUS);
			params.put("property.value", searchStatus);
		}
		String searchReference = RequestUtil.getParameter(request,
				"searchReference", "");
		if (StringUtils.isNoneEmpty(searchReference)) {
			params.put("property", CourseSchema.COURSEREF);
			params.put("property.value", searchReference);
		}
		String searchTitle = RequestUtil.getParameter(request, "searchTitle",
				"");
		if (StringUtils.isNoneEmpty(searchTitle)) {
			params.put("property", CourseSchema.COURSETITLE);
			params.put("property.operation", "like");
			params.put("property.value", "%" + searchTitle + "%");
		}

		Session session = null;
		try {
			session = repository.loginAdministrative(null);
			Query query = queryBuilder.createQuery(
					PredicateGroup.create(params), session);
			SearchResult results = query.getResult();

			log.info("Found '{}' matches for query", results.getTotalMatches());

			for (Hit hit : results.getHits()) {

				// The query returns the jcr:content node, so we need its
				// parent.
				Resource course = hit.getResource();
				CourseContentType contentType = CourseContentTypeFactory
						.getInstance(course);

				if (contentType != null) {
					ajaxResponse.getInfo().add(contentType.getJson());
				}
			}
		} catch (RepositoryException e) {
			ajaxResponse.getError().add("Error getting repository");
			log.error("Error getting repository", e);
		} finally {
			if (session != null && session.isLive()) {
				session.logout();
			}
		}

		return ajaxResponse;
	}

	private void writeCourseInfo(SlingHttpServletRequest request, Node course)
			throws RepositoryException {
		Enumeration<String> params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String param = params.nextElement();
			if (param.startsWith("course")) {
				String value = RequestUtil.getParameter(request, param);
				JcrResourceUtil.setProperty(course, param, value);
			}
		}
	}

	private void validatePath(String path) throws Exception {
		ResourceResolver resourceResolver = resolverFactory
				.getAdministrativeResourceResolver(null);
		Session session = resourceResolver.adaptTo(Session.class);
		Node root = session.getRootNode();
		Node parent = root;
		String[] folders = path.split("/");
		for (String item : folders) {
			if (StringUtils.isNoneBlank(item)) {
				if (!parent.hasNode(item)) {
					// Create node
					parent = parent.addNode(item, "sling:OrderedFolder");
				} else {
					parent = parent.getNode(item);
				}
			}
		}
		session.save();
	}

}
