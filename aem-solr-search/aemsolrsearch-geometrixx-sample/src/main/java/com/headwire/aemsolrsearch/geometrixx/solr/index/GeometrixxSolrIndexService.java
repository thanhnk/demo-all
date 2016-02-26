/*
 * Author  : Gaston Gonzalez
 * Date    : 8/26/13
 * Version : $Id$
 */
package com.headwire.aemsolrsearch.geometrixx.solr.index;

import com.headwire.aemsolrsearch.services.SolrConfigurationService;
import org.apache.felix.scr.annotations.*;
import org.osgi.framework.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Map;

@Component(
        name = "com.headwire.aemsolrsearch.index.services.GeometrixxSolrIndexService",
        label = "AEM Solr Search - Geometrixx Solr Index Service",
        description = "A service for indexing Solr",
        immediate = true,
        metatype = true)
@Service(GeometrixxSolrIndexService.class)
@Properties({
        @Property(
                name = Constants.SERVICE_VENDOR,
                value = "headwire.com, Inc."),
        @Property(
                name = Constants.SERVICE_DESCRIPTION,
                value = "An index service for the Geometrixx Media Site")
})
/**
 * geometrixxSolrIndexService is responsible for performing index operations against Solr.
 *
 * @author <a href="mailto:gg@headwire.com">Gaston Gonzalez</a>
 */
public class GeometrixxSolrIndexService extends AbstractSolrIndexService {

    private static final Logger LOG = LoggerFactory.getLogger(GeometrixxSolrIndexService.class);
    // TODO: Make this an OSGi property
    private static final String GEOMETRIXX_MEDIA_CORE = "collection1";

    @Reference
    SolrConfigurationService solrConfigService;

    @Activate
    protected void activate(final Map<String, String> config) {
        resetService(config);
    }

    @Modified
    protected void modified(final Map<String, String> config) {
        resetService(config);
    }

    @Override
    protected String getSolrServerURI() {
        assertSolrConfigService();
        return formatSolrEndPointAndCore(solrConfigService.getSolrEndPoint(), GEOMETRIXX_MEDIA_CORE);
    }

    @Override
    protected String getSolrServerURI(String solrCore) {
        assertSolrConfigService();
        return formatSolrEndPointAndCore(solrConfigService.getSolrEndPoint(), solrCore);
    }


    private void resetService(final Map<String, String> config) {
        LOG.info("Resetting Solr index service using configuration: " + config);
        resetSolrClients();
    }
    
    private void assertSolrConfigService() throws IllegalStateException {        
        if (null == solrConfigService) {
            LOG.error("Can't get SolrConfigurationService. Check that all OSGi bundles are active");
            throw new IllegalStateException("No solr configuration service.");
        }
    }

    @Override
    public String getCoreName() {
        return GEOMETRIXX_MEDIA_CORE;
    }
}
