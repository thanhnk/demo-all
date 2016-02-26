<%@page session="false"%><%--
  Copyright 1997-2008 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Top Navigation component

  Draws the top navigation

--%><%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="java.util.Iterator,
		java.util.ArrayList,
		java.util.List,
        com.day.text.Text,
        com.day.cq.wcm.api.PageFilter,
        com.day.cq.wcm.api.Page,
        com.day.cq.commons.Doctype" %><%

    // get starting point of navigation
    long absParent = currentStyle.get("absParent", 2L);
    String navstart = Text.getAbsoluteParent(currentPage.getPath(), (int) absParent);

    //if not deep enough take current node
    if (navstart.equals("")) navstart=currentPage.getPath();

    Resource rootRes = slingRequest.getResourceResolver().getResource(navstart);
    Page rootPage = rootRes == null ? null : rootRes.adaptTo(Page.class);
    
    String xs = Doctype.isXHTML(request) ? "/" : "";
    if (rootPage != null) {
        Iterator<Page> children = currentPage.listChildren(new PageFilter(request));
        List<Page> cache = new ArrayList<Page>();
        boolean hasGrandchild = true;
        
        while(children.hasNext()) {
        	Page child = children.next();
        	Iterator<Page> grandchildren = child.listChildren(new PageFilter(request));
        	
        	// grandchildren of current page
        	if(!grandchildren.hasNext()) {
        		hasGrandchild = false;
        	}
        	cache.add(child);
        }
        
        if(hasGrandchild) {
        	for(Page child: cache) {
            	%><a href="<%= xssAPI.getValidHref(child.getPath()) %>.html">
                <li>
<!--      				<span class="chan-icon"><span class="ud_web-development"></span> -->
<!--      				</span>  -->
     				<span class="cat-title subcat-title"><%= child.getTitle() %></span> 
     			</li></a><%
            }
        }
        else {
        	if(cache != null) {
        		Page parent = cache.get(0).getParent();
        		Page grandparent = parent.getParent();
        		children = grandparent.listChildren(new PageFilter(request));		
        		
        		while (children.hasNext()) {
        			Page child = children.next();
                	%><a href="<%= xssAPI.getValidHref(child.getPath()) %>.html">
                    <li>
<!--          				<span class="chan-icon"><span class="ud_web-development"></span> -->
<!--          				</span>  -->
         				<span class="cat-title subcat-title"><%= child.getTitle() %></span> 
         			</li></a><%
                }
        	}
        }
    }
%>

