<%@page import="org.apache.commons.lang3.StringUtils"%>
<%@page import="sg.gov.wda.CourseService"%>
<%@page import="sg.gov.wda.adapters.CoursePage"%>
<%@page import="sg.gov.wda.util.RequestUtil"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.sling.api.resource.Resource"%>
<%@page import="javax.jcr.Node"%>
<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@include file="/apps/wda/global/global.jsp"%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<cq:includeClientLib categories="cq.widgets"/>
<cq:includeClientLib categories="wda.coursemanagement"/>
<%
	String courseId = RequestUtil.getParameter(slingRequest, "id", "");
	CoursePage course = null;
	try{
		CourseService courseService = sling.getService(CourseService.class);
		course = courseService.getCourse(slingRequest);
	}catch(Exception e){
		log.error("",e);
		course = new CoursePage();
	}
%>
<div class="one-col-landing ud-page ">

	
	
	<div class="main-top">
		<div class="container">
			<div class="row course-desc">
				<div class="col-md-12">
					<h1 class="course-title" data-purpose="course-title">
					    <%= course.getCourseTitle() %>
					</h1>
					<div class="ci-d">
						<%= course.getCourseObjective() %>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="main-details mt10">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-7" data-purpose="introduction-video">
					<img alt="" src="<%=StringUtils.isEmpty(course.getCourseImageUrl())? gs_imagePath + "/course.jpg": course.getCourseImageUrl()%>">
				</div>
				<div class="col-lg-4 col-md-5">
					<div class="row fxdc right-wrap mh0-force-md">
						<div class="fxw-md fdrr-md db-force-xs">
							<div class="right-top col-md-12 col-sm-6">
	
								<div class="take-btn">
									<div class="price fxac">
										<span class="current-price" data-purpose="discount-price-text">
											
											<%= "S$" + course.getCourseCost() %>
										</span>
									</div>

									<button type="button" onclick="">Take This Course</button>  
								</div>
							</div>
	
							<div class="right-middle col-md-11 col-sm-6">
								<ul class="list">
									<li class="list-item">
										<span class="list-left">Length</span>
										<span class="list-right">
		                                    <%= course.getCourseHours() %> Hours</span>
									</li>
									<li class="list-item">
										<span class="list-left">Type</span> 
										<span class="list-right">
											<%= course.getCourseType() %>
										</span>
									</li>
									<li class="list-item">
										<span class="list-left">Languages</span>
										<span class="list-right"> 
	                                    	<%= course.getCourseLang() %>
	                                    </span>
									</li>
								</ul>
							</div>
							<div class="clearfix visible-xs-block"></div>
						</div>
						<div class="right-bottom col-md-12">
							<div class="fxw social-links ud-discover-tracker"
								data-action="add-to-wishlist-clicked" data-course-id="BEAYd1ZQ"
								data-target-selector-class="js-discover-tracker-elm">
									<i class="icon fa fa-heart icon-heart in-wishlist none"></i> 
									<i class="icon fa fa-heart-o icon-heart-empty not-in-wishlist"></i>
									<span class="in-wishlist none" data-purpose="in-wishlist">Wishlisted </span> 
									<span class="not-in-wishlist" data-purpose="not-in-wishlist">Wishlist
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="main-middle fs12-xs show-nav-on-this">
		<div class="container">
			<div class="row">
				<div class="col-md-8 pb50">
					<h3>Course Description</h3>
					<%= StringUtils.isEmpty(course.getCourseContent())? course.getCourseDetails() : course.getCourseContent() %>
				</div>
				<div class="col-md-4 hidden-sm">
					<cq:include path="right-par" resourceType="foundation/components/parsys" />
				</div>
			</div>
		</div>
	</div>

</div>

