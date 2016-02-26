
<%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  List component sub-script

  Draws a list item as a news headline.
                                               r
  request attributes:
  - {com.day.cq.wcm.foundation.List} list The list
  - {com.day.cq.wcm.api.Page} listitem The list item as a page

--%><%@page import="org.apache.sling.api.resource.Resource"%>
<%
%><%@ page session="false"
           import="java.text.DateFormat,
                   java.util.Date,
                   com.day.cq.wcm.api.Page,
                   org.apache.commons.lang3.StringEscapeUtils"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@include file="/apps/wda/global/global.jsp"%><%

    Page listItem = (Page)request.getAttribute("listitem");
    String title = listItem.getTitle() != null ? listItem.getTitle() : listItem.getName();
    ValueMap vMap = listItem.getProperties(); 

    // retrieve node of JCR
    Resource myResource = listItem.getContentResource("image-par/image");
    
    Node imgNode = null;
    String fileName = "/content/dam/wda/img_not_found.png";
    
    if(myResource != null) {
    	imgNode = myResource.adaptTo(Node.class);
    	
    	if(imgNode != null) 
        	fileName = imgNode.getProperty("fileReference").getString();
    }
%>
<!-- boolean hasImage = false; -->
<!--     try { -->
<!--         hasImage = listItem.getContentResource().adaptTo(Node.class).hasNode("image") || -->
<!--                 listItem.getProperties().get("fileReference", "").length() > 0; -->
<!--     } catch (RepositoryException re) { -->
<!--     } -->
<!--     if (hasImage) { 
listItem.getPath() }-->

<a href="<%= listItem.getPath() + ".html" %>" >
<li class="course-box small ">
	<span>
		<img alt="The Complete Web Developer Course - Build 14 Websites"
		src= <%=fileName %> height="100%" width="100%">
	</span>
	<span class="box-second-row"> 
		<span class="title ellipsis-2lines h34"> <%= title %> </span> 
		<span class="dib title ins-title ellipsis-2lines h34"
			style="display: block"> 
			<% String instructor = vMap.get("instructor", "N.A"); %>
			<%= instructor %> 
			<!-- name, career, position -->
		</span> 
		<span class="reviews-row db p5-10 fxw"> 
			<span class="s-rating smaller static maroon"> 
				<span ng-style="{width: (course.avg_rating * 20) + '%'}"
					style="width: 75%;"> 
				</span>
			</span> 
			<span translate="">
				<span class="">(999)</span> 
			</span>			
		</span> 
		<span class="price-wrap fxac mh36"> 
				<% double oldPrice = vMap.get("oldPrice", 1.0);
					double discount = vMap.get("discount", 1.0);
					double discountedPrice = oldPrice * (100 - discount) / 100;
				%> 
			<span class="promotion-badge fs13-force-xs lh18-force-xs"> 
				<%="S$" + Math.round(Math.ceil(discountedPrice))%>
			</span>
			<span class="price skin-color"> <%="S$" + Math.round(Math.ceil(oldPrice)) + " " %> </span>
		</span>
	</span>
</li>
</a>