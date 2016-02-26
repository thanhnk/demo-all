package SolrUpdateHandler;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;

import org.apache.felix.scr.annotations.Component;
import org.apache.felix.scr.annotations.Properties;
import org.apache.felix.scr.annotations.Property;
import org.apache.felix.scr.annotations.Service;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import sg.gov.wda.adapters.CourseContentType;
import sg.gov.wda.adapters.CourseContentTypeFactory;

import com.day.cq.commons.jcr.JcrConstants;
import com.day.cq.dam.api.DamConstants;
import com.day.cq.wcm.api.NameConstants;

@Component(immediate = true, metatype = true)
@Service(Servlet.class)
@Properties({
		@Property(name = Constants.SERVICE_VENDOR, value = "headwire.com, Inc."),
		@Property(name = Constants.SERVICE_DESCRIPTION, value = "Renders content using the Solr JSON update handler format "),
		@Property(name = "sling.servlet.methods", value = "GET"),
		@Property(name = "sling.servlet.resourceTypes", value = {
				NameConstants.NT_PAGE, DamConstants.NT_DAM_ASSET,
				JcrConstants.NT_UNSTRUCTURED }),
		@Property(name = "sling.servlet.selectors", value = "wda"),
		@Property(name = "sling.servlet.extensions", value = "json") })
public class SolrUpdateHandler extends SlingSafeMethodsServlet {

	private static final Logger LOG = LoggerFactory
			.getLogger(SolrUpdateHandler.class);

	@Override
	protected void doGet(SlingHttpServletRequest request,
			SlingHttpServletResponse response) throws ServletException,
			IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");

		CourseContentType contentType = CourseContentTypeFactory
				.getInstance(request.getResource());
		if (null == contentType) {
			contentType = CourseContentType.NULL;
		}

		response.getWriter().write(contentType.getJson().toJSONString());
	}
}