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

  Breadcrumb component

  Draws the breadcrumb

--%>
<%@include file="/libs/foundation/global.jsp"%><%
%><%@include file="/apps/wda/global/global.jsp"%>
<%@ page import= "java.util.*" %>
<%

    // get starting point of trail
    long level = currentStyle.get("absParent", 2L);
    long endLevel = currentStyle.get("relParent", 1L);
    String delimStr = currentStyle.get("delim", "&nbsp;&gt;&nbsp;");
    String trailStr = currentStyle.get("trail", "");
    int currentLevel = currentPage.getDepth();
    String delim = "";
    Map<String, String> titleMap = new LinkedHashMap <String, String>(); 
   
    while (level < currentLevel - endLevel) {
    	
        Page trail = currentPage.getAbsoluteParent((int) level);
        		
        if (trail == null) {
            break;
        }
        String title = trail.getNavigationTitle();
        if (title == null || title.equals("")) {
            title = trail.getNavigationTitle();
        }
        if (title == null || title.equals("")) {
            title = trail.getTitle();
        }
        if (title == null || title.equals("")) {
            title = trail.getName();
        }

        if(!title.equals("")) {
        	titleMap.put(title, trail.getPath()+".html");
        }
        	        
        delim = delimStr;
        level++;
    }

%>
<div ng-include="'https://www.udemy.com/staticx/udemy/js/ng/apps/channel-dashboard/channel-header.tpl.html'"><div class="channel-head" style="">
	    <div class="container" ng-show="channelPage.bannerUrl == ''">
	      <channel-breadcrumb parent-channel="channelPage.parentChannel" channel-title="channelPage
	      .title" ng-style="">
	     <a href="/content/wda.html"> 
	     <i class="icon-home"></i>
	     </a>
		<%
			int counter = 0;
		
			if(titleMap.size() > 0) {
				
				for(String t: titleMap.keySet()) {
					%> <a href="<%= titleMap.get(t) %>"><span> / <%=t %></span></a> <%
				}
			}
		%>
		
		</channel-breadcrumb>
		    <div><cq:include path="title" resourceType="wda/components/general/title"/> </div>
	    </div>
	</div>
</div>
	