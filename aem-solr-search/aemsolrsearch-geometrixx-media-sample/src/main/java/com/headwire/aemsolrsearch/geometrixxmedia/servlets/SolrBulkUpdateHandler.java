package com.headwire.aemsolrsearch.geometrixxmedia.servlets;

import com.day.cq.search.PredicateGroup;
import com.day.cq.search.Query;
import com.day.cq.search.QueryBuilder;
import com.day.cq.search.result.Hit;
import com.day.cq.search.result.SearchResult;
import com.headwire.aemsolrsearch.geometrixxmedia.adapters.GeometrixxMediaContentType;
import com.headwire.aemsolrsearch.geometrixxmedia.adapters.GeometrixxMediaContentTypeFactory;
import org.apache.commons.lang.StringUtils;
import org.apache.felix.scr.annotations.*;
import org.apache.sling.api.SlingHttpServletRequest;
import org.apache.sling.api.SlingHttpServletResponse;
import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.servlets.SlingSafeMethodsServlet;
import org.apache.sling.jcr.api.SlingRepository;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.jcr.RepositoryException;
import javax.jcr.Session;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * This is an example servlet for the Geometrixx Media site. It produces a Solr Update Handler JSON response for
 * for any pages that have the sling:resourceType of <code>geometrixx-media/components/page/article</code>. This
 * code is only a demonstration and should only by used in scenarios were the number of content pages is low.
 *
 * For more information on Solr update handler, see https://wiki.apache.org/solr/UpdateJSON.
 *
 * Here are some suggestions for extension.
 *
 * <ol>
 *     <li>Add an OSGi property to define multiple content paths.</li>
 *     <li>Update QueryBuilder to paginate large result sets.</li>
 * </ol>
 *
 * <em>Note: This service must be blocked by dispatcher.</em>
 *
 * @author <a href="mailto:gg@headwire.com">Gaston Gonzalez</a>
 */
@Component(
        name = "com.headwire.aemsolrsearch.geometrixxmedia.servlets.SolrBulkUpdateHandler",
        label = "AEM Solr Search - Geometrixx Media Solr Update Handler",
        description = "Serializes content to Solr's JSON update handler format",
        immediate = true,
        metatype = true)
@Service(Servlet.class)
@Properties({
    @Property(name = Constants.SERVICE_VENDOR, value = "headwire.com, Inc."),
    @Property(name = Constants.SERVICE_DESCRIPTION, value = "Serializes content to Solr's JSON update handler format"),
    @Property(name = "sling.servlet.methods", value = "GET"),
    @Property(name = "sling.servlet.paths", value = "/apps/geometrixx-media/solr/updatehandler")
})
public class SolrBulkUpdateHandler extends SlingSafeMethodsServlet {

    private static final Logger LOG = LoggerFactory.getLogger(SolrBulkUpdateHandler.class);
    public static final String REQ_PARAM_TYPE = "type"; // sling:resourceType

    @Reference
    private QueryBuilder queryBuilder;

    @Reference
    private SlingRepository repository;

    @Override
    protected void doGet(SlingHttpServletRequest request, SlingHttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        JSONArray solrDocs = new JSONArray();

        final String slingResourceType = getSlingResourceType(request);

        if (StringUtils.isEmpty(slingResourceType)) {
            response.getWriter().write(solrDocs.toJSONString());
            return;
        }

        Map<String, String> params = new HashMap<String, String>();
        params.put("path", "/content/geometrixx-media");
        params.put("type", "cq:PageContent");
        params.put("property", "sling:resourceType");
        params.put("property.value", slingResourceType);
        params.put("p.offset", "0");
        params.put("p.limit", "50");

        Session session = null;

        try {
            session = repository.loginAdministrative(null);
            Query query = queryBuilder.createQuery(PredicateGroup.create(params), session);
            SearchResult results = query.getResult();

            LOG.info("Found '{}' matches for query", results.getTotalMatches());

            for (Hit hit: results.getHits()) {

                // The query returns the jcr:content node, so we need its parent.
                Resource page = hit.getResource().getParent();
                GeometrixxMediaContentType contentType = GeometrixxMediaContentTypeFactory.getInstance(page);

                if (contentType != null) {
                    solrDocs.add(contentType.getJson());
                }
            }

        } catch (RepositoryException e) {
            LOG.error("Error getting repository", e);
        } finally {
            if (session != null && session.isLive())  {
                session.logout();
            }
        }

        response.getWriter().write(solrDocs.toJSONString());
    }

    /**
     * Obtains the sling:resourceType from the request.
     *
     * @param request
     * @return the sling:resourceType on success and an empty string otherwise.
     */
    protected String getSlingResourceType(SlingHttpServletRequest request) {

        final Map requestMap = request.getParameterMap();
        return requestMap.containsKey(REQ_PARAM_TYPE) ? request.getParameter(REQ_PARAM_TYPE) : "";
    }
}