<%--
  Copyright 1997-2010 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Includes the scripts and css to be included in the head tag

  ==============================================================================

--%><%@ page session="false" %><%
%><%@include file="/libs/foundation/global.jsp" %><%
%>
<cq:include script="/libs/wcm/core/components/init/init.jsp"/>
<cq:include script="/libs/foundation/components/page/stats.jsp"/>
<cq:include script="/libs/cq/cloudserviceconfigs/components/servicelibs/servicelibs.jsp"/>
<cq:include script="/libs/wcm/core/browsermap/browsermap.jsp" />
<!-- Adobe Edge Web Fonts in use by Geo-media -->

<cq:includeClientLib categories="cq.foundation-main"/>
<% currentDesign.writeCssIncludes(pageContext); %>
<cq:includeClientLib categories="wda.main"/>
<cq:includeClientLib categories="wda.customize"/>