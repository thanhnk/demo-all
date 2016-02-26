<%@page import="sg.gov.wda.CourseService"%>
<%@page import="sg.gov.wda.AJAXResponse"%>
<%@include file="/apps/wda/global/global.jsp"%><%
%><%@page session="false"%>
<%
response.setHeader("Content-Type", "application/json");
AJAXResponse ajaxResponse = new AJAXResponse();			   
try{
	CourseService courseService = sling.getService(CourseService.class);
	ajaxResponse = courseService.solrIndex(slingRequest);
	if (ajaxResponse.getError().size() == 0){
		ajaxResponse = courseService.approveCourse(slingRequest);
	}
}catch(Exception e){
	log.error("",e);
	ajaxResponse.getError().add("Unkonwn error occured. Please try again later.");
}finally{
	response.getWriter().write(ajaxResponse.toJson());
}	
%>