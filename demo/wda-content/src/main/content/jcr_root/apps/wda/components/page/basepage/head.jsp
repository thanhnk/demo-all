<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp" %><%
%><%@ page import="com.day.cq.commons.Doctype" %><%
    String xs = Doctype.isXHTML(request) ? "/" : "";
    String favIcon = currentDesign.getPath() + "/favicon.ico";
    if (resourceResolver.getResource(favIcon) == null) {
        favIcon = null;
    }
%><head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"<%=xs%>>
    <meta name="keywords" content="<%= xssAPI.encodeForHTMLAttr(WCMUtils.getKeywords(currentPage, false)) %>"<%=xs%>>
    <meta name="description" content="<%= xssAPI.encodeForHTMLAttr(properties.get("jcr:description", "")) %>"<%=xs%>>
    <cq:include script="headlibs.jsp"/>
    <% if (favIcon != null) { %>
    <link rel="icon" type="image/vnd.microsoft.icon" href="<%= xssAPI.getValidHref(favIcon) %>"<%=xs%>>
    <link rel="shortcut icon" type="image/vnd.microsoft.icon" href="<%= xssAPI.getValidHref(favIcon) %>"<%=xs%>>
    <% } %>
    <title><%= currentPage.getTitle() == null ? xssAPI.encodeForHTML(currentPage.getName()) : xssAPI.encodeForHTML(currentPage.getTitle()) %></title>
</head>
