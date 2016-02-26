
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
    Node imgNode = myResource.adaptTo(Node.class);
    
    String fileName = "FILE";
	fileName = imgNode.getProperty("fileName").getString();
    
//     Resource myResource = resourceResolver.getResource("/content/course/mycourse/jcr:content/image-par/image");
//     Node node = myResource.adaptTo(Node.class);
// 		String fileName = node.getProperty("jcr:title").getString();
	 
	
//     String description = listItem.getDescription() != null ? listItem.getDescription() : "";
//     Date defaultDate = new Date();
//     Date date = listItem.getProperties().get("date", listItem.getProperties().get("cq:lastModified", defaultDate));
    
//      // add component path
//     String componentPath = "/apps/wda/components/general/list";
//     // retrieve resources
//     Resource myResource = resourceResolver.getResource(componentPath);

    
//     if (!Resource.RESOURCE_TYPE_NON_EXISTING.equals(myResource.getResourceType())) {
//         Node node = myResource.adaptTo(Node.class);
//         instructor = node.getProperty("jcr:title").getString();
        
//     } 
    
    %>
    
<div class="tab-content"  float:left;>
	<div class="container" >
		<div class="rc fx pt0-force-md">
			<div class="course-box small promotion">
				
<!-- 					<span -->
<!-- 					class="course-thumb pos-r dib"> <span class="lec-info fxdc"> -->
<!-- 						<span class="row-one" translate="">  -->
<!-- 							<span class="">236 lectures</span> -->
<!-- 						</span>  -->
<!-- 						<span class="row-two" translate="">  -->
<!-- 							span class="">28 hours video</span> -->
<!-- 						</span> -->
<!-- 					</span>  -->
					
				<img alt="The Complete Web Developer Course - Build 14 Websites"
						src="https://udemy-images.udemy.com/course/480x270/185774_cb62_3.jpg">
						
				<span class="box-second-row"> 
				<span class="title ellipsis-2lines h34"> 
					<%= title %>
					<%= fileName %>
<%-- 					<%= properties.get("jcr:title", "default title") %> ANS: DEF--%>
<%-- 					<%= vMap.size() %> --%>
					
				</span> 
				<span class="dib title ins-title ellipsis-2lines h34"
					style="display: block"> 
					
					<% String instructor = vMap.get("instructor", "N.A"); %>
					<%= instructor %>
					<!-- name, career, position -->
				</span> 
				<span class="reviews-row db p5-10 fxw"> 
					<span class="s-rating smaller static maroon"> 
						<span ng-style="{width: (course.avg_rating * 20) + '%'}"
							style="width: 75%;"> </span>
					</span> 
					<span translate=""><span class="">(999)</span>
					</span>
				</span> 
				<span class="price-wrap fxac mh36">
					<span class="price skin-color">
						<%
							double oldPrice = vMap.get("oldPrice", 1.0);
							double discount = vMap.get("discount", 1.0);
							
							double discountedPrice = oldPrice * (100 - discount) / 100;
						 %> 
						<%="S$" + Math.round(Math.ceil(discountedPrice))%>
					</span>
					<span class="promotion-badge fs13-force-xs lh18-force-xs">
						<strike><%="S$" + Math.round(Math.ceil(oldPrice))%></strike>
					</span>
				</span>
				</span>
			</div>
		</div>
		<div><%= myResource.toString() %></div>
	</div>
</div>


<!-- <img id="courseImg" src="compman.gif" alt="hi"> -->
<!-- 				<button onclick="myFunction()">Try it</button> -->
				
<!-- 				<script> -->
<!-- // 				function myFunction() { -->
<!-- // 				var fileName = "aab"; -->
<!-- // 				    document.getElementById("courseImg").src = "aa.gif"; -->
<!-- // 				document.getElementById("courseImg").alt= fileName; -->
<!-- // 				} -->
<!-- 				</script> -->