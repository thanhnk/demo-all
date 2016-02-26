<%@page session="false"%><%--
  Copyright 1997-2009 Day Management AG
  Barfuesserplatz 6, 4001 Basel, Switzerland
  All Rights Reserved.

  This software is the confidential and proprietary information of
  Day Management AG, ("Confidential Information"). You shall not
  disclose such Confidential Information and shall use it only in
  accordance with the terms of the license agreement you entered into
  with Day.

  ==============================================================================

  Default body script.

  Draws the HTML body with the page content.

  ==============================================================================

--%><%@include file="/libs/foundation/global.jsp" %>
<%@include file="/apps/wda/global/global.jsp" %>
<head>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
<cq:include path="clientcontext" resourceType="cq/personalization/components/clientcontext"/>
<%if (!isAnonymous){%>
<cq:include script="sidebar.jsp"/>
<%} %>
<cq:include script="header.jsp"/>
<cq:include script="menu.jsp"/>
<cq:include script="content.jsp"/>
<cq:include script="footer.jsp"/>
<cq:include script="modal.jsp"/>

<cq:include path="cloudservices" resourceType="cq/cloudserviceconfigs/components/servicecomponents"/>
</body>
