<%@page import="com.day.cq.wcm.api.Page"%>
<%@page import="sg.gov.wda.AJAXResponse"%>
<%@page import="sg.gov.wda.OmnitureService"%>
<%@page import="info.geometrixx.commons.util.GeoHelper"%>
<%@include file="/apps/wda/global/global.jsp" %>
<%@page session="false" %>
<%
OmnitureService omService = sling.getService(OmnitureService.class);
AJAXResponse relativeViews = omService.retrieveRelativePages(slingRequest);
if (relativeViews.getInfo().size()> 0){
%>
<div class="section-header aem-GridColumn">
    <h3><span>People view this page also view</span></h3>
</div>
<div class="popular-articles">
	<% for (Object obj : relativeViews.getInfo()){ 
		Page item = (Page)obj;
		final String pagePath = request.getContextPath() + item.getPath();
		 final String alt = item.getProperties().get("jcr:description", "");
		 final String extension = GeoHelper.getPageImageExtension(item);
	%>
		<div class="popular-articles clearfix">
    		<article>
    			<div class="article-summary-image">
    				<a href="<%= xssAPI.getValidHref(pagePath + ".html") %>">
    					<div data-picture data-alt='<%= xssAPI.encodeForHTMLAttr(alt) %>'>
    						<div data-src='<%= xssAPI.encodeForHTMLAttr(pagePath + ".image.127.127.medium." + extension) %>' data-media="(min-width: 1px)"></div>
		                    <%-- Mobile --%>
		                    <div data-src='<%= xssAPI.encodeForHTMLAttr(pagePath + ".image.620.290.high." + extension) %>' data-media="(min-width: 481px)"></div>
		                    <%-- Tablet --%>
		                    <div data-src='<%= xssAPI.encodeForHTMLAttr(pagePath + ".image.770.360.high." + extension) %>' data-media="(min-width: 1025px)"></div>
		                    <%-- Tablet --%>
		                    <%-- Fallback content for non-JS browsers. Same img src as the initial, unqualified source element. --%>
		                    <noscript>
		                        <img src='<%= xssAPI.encodeForHTMLAttr(pagePath + ".image.127.127.medium." + extension) %>' alt='<%= xssAPI.encodeForHTMLAttr(alt) %>'>
		                    </noscript>
    					</div>
    				</a>
    			</div>
    			<div class="article-summary-description">
		            <h4><%= xssAPI.encodeForHTML(GeoHelper.getTitle(item)) %>
		            </h4>
		        </div>
    		</article>
   		</div>
	<%} %>
</div>
<% } else { %>
	<h3>No Relative Page</h3>
<% } %>