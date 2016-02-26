<%@page import="org.apache.jackrabbit.api.security.user.Group"%>
<%@page import="org.apache.jackrabbit.api.security.user.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.adobe.granite.security.user.UserProperties"%>
<%@page import="com.day.cq.wcm.api.WCMMode"%>
<%@page import="com.day.cq.personalization.UserPropertiesUtil"%>
<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false"%>
<%
	/* Common Paths*/
	String baseImagePath = "/etc/clientlibs/edx/main/images"; //TODO: remove this later on, replaced by gs_imagePath
	String baseEtcPath = "/etc/clientlibs/edx";
	final boolean isAnonymous = UserPropertiesUtil.isAnonymous(slingRequest);
	final boolean isDisabled = WCMMode.DISABLED.equals(WCMMode.fromRequest(request));
	
	/* Miscellaneous */
    WCMMode _mode = WCMMode.fromRequest(request);
    boolean gb_public = _mode == WCMMode.DISABLED;
    boolean gb_preview = _mode == WCMMode.PREVIEW;
    boolean gb_edit = _mode == WCMMode.EDIT;
    
    String homePageUrl = "/content/edx/en/home.html";
    
    User currentUser = resourceResolver.adaptTo(User.class); 

%>
