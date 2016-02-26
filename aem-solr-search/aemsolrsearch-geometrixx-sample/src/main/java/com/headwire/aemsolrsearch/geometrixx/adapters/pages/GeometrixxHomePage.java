package com.headwire.aemsolrsearch.geometrixx.adapters.pages;

import com.day.cq.tagging.Tag;
import com.day.cq.tagging.TagManager;
import com.day.cq.wcm.api.NameConstants;
import com.headwire.aemsolrsearch.geometrixx.adapters.GeometrixxContentType;
import com.headwire.aemsolrsearch.geometrixx.config.ComponentDataConfig;
import com.headwire.aemsolrsearch.geometrixx.solr.SolrTimestamp;
import com.headwire.aemsolrsearch.geometrixx.util.SolrIndexingUtil;

import org.apache.sling.api.resource.Resource;
import org.apache.sling.api.resource.ValueMap;
import org.apache.solr.common.SolrInputDocument;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static com.headwire.aemsolrsearch.geometrixx.solr.GeometrixxSchema.*;

import java.util.Arrays;
import java.util.Date;
import java.util.Map;

/**
 * Data model representing a Geometrixx Home page.
 *
 * @author <a href="mailto:gg@headwire.com">Gaston Gonzalez</a>
 */
public class GeometrixxHomePage extends GeometrixxContentType {

    private static final Logger LOG = LoggerFactory.getLogger(GeometrixxHomePage.class);

    private String description;
    private String id;
    private String title;
    private String url;
    private String slingResourceType;
    private Date lastUpdate;
    private String body;

    public GeometrixxHomePage(String id) {
        this.id = id;
    }

    public static GeometrixxHomePage adaptFromResource(Resource resource) {

        final String id = resource.getPath();
        final Resource jcrResource = resource.getChild("jcr:content");
        final ValueMap valueMap = jcrResource.adaptTo(ValueMap.class);
        final String title = valueMap.get("jcr:title", "");
        final String description = valueMap.get("jcr:description", "");
        final String slingResourceType = valueMap.get("sling:resourceType", "");
        Map<String, ComponentDataConfig> componentDataConfigMap = SolrIndexingUtil.getComponentDataConfigs();
        Map<String, String> mainParsysProps = SolrIndexingUtil.extractDataFromParsys(jcrResource, "par", componentDataConfigMap);
        final String bodyText = mainParsysProps.containsKey("bodyText") ? mainParsysProps.get("bodyText") : "";

        final Date lastUpdate = valueMap.get(NameConstants.PN_PAGE_LAST_MOD, Date.class);

        final TagManager tagManager = resource.getResourceResolver().adaptTo(TagManager.class);
        final Tag[] tags = tagManager.getTags(jcrResource);

        GeometrixxHomePage article = new GeometrixxHomePage(id)
                .withTitle(title)
                .withDescription(description)
                .withUrl(resource.getPath() + ".html")
                .withLastUpdate(lastUpdate)
                .withSlingResourceType(slingResourceType)
        		.withBody(bodyText);

        return article;
    }

    public GeometrixxHomePage withDescription(String description) {
        this.description = description;
        return this;
    }

    public GeometrixxHomePage withLastUpdate(Date lastUpdate) {
        this.lastUpdate = lastUpdate;
        return this;
    }

    public GeometrixxHomePage withSlingResourceType(String slingResourceType) {
        this.slingResourceType = slingResourceType;
        return this;
    }

    public GeometrixxHomePage withTitle(String title) {
        this.title = title;
        return this;
    }

    public GeometrixxHomePage withUrl(String url) {
        this.url = url;
        return this;
    }
    
    public GeometrixxHomePage withBody(String body) {
    	this.body = body;
    	return this;
    }

    public String getDescription() {
        return description;
    }

    public String getId() {
        return id;
    }

    public Date getLastUpdate() {
        return lastUpdate;
    }

    public String getTitle() {
        return title;
    }

    public String getSlingResourceType() {
        return slingResourceType;
    }

    public String getUrl() {
        return url;
    }
    
    public String getBody() {
    	return body;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("GeometrixxPage{");
        sb.append(", description='").append(description).append('\'');
        sb.append(", id='").append(id).append('\'');
        sb.append(", title='").append(title).append('\'');
        sb.append(", url='").append(url).append('\'');
        sb.append(", slingResourceType='").append(slingResourceType).append('\'');
        sb.append(", lastUpdate=").append(lastUpdate);
        sb.append(", body=").append(body);
        sb.append('}');
        return sb.toString();
    }

    @Override
    public JSONObject getJson() {
        JSONObject json = new JSONObject();
        json.put(ID, getId());
        json.put(TITLE, getTitle());
        json.put(DESCRIPTION, getDescription());
        json.put(LAST_MODIFIED, SolrTimestamp.convertToUtcAndUseNowIfNull(getLastUpdate()));
        json.put(SLING_RESOUCE_TYPE, getSlingResourceType());
        json.put(URL, getUrl());
        json.put(BODY, getBody());

        return json;
    }

    @Override
    public SolrInputDocument getSolrDoc() {

        SolrInputDocument doc = new SolrInputDocument();

        doc.addField(ID, getId());
        doc.addField(TITLE, getTitle());
        doc.addField(DESCRIPTION, getDescription());
        doc.addField(LAST_MODIFIED, SolrTimestamp.convertToUtcAndUseNowIfNull(getLastUpdate()));
        doc.addField(SLING_RESOUCE_TYPE, getSlingResourceType());
        doc.addField(URL, getUrl());
        doc.addField(BODY, getBody());

        return doc;
    }
}
