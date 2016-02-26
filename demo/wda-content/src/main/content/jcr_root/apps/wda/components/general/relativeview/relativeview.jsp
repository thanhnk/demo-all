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

  Title component.

  Draws a title either store on the resource or from the page

--%><%@include file="/libs/foundation/global.jsp"%><%
%><%@ page import="java.util.Iterator,
        org.apache.commons.lang3.StringEscapeUtils,
        com.day.cq.commons.Doctype,
        com.day.cq.commons.DiffInfo,
        com.day.cq.commons.DiffService,
        org.apache.sling.api.resource.Resource,
        org.apache.sling.api.resource.ResourceUtil" %><%

    // first calculate the correct title - look for our sources if not set in paragraph
    String title = properties.get(NameConstants.PN_TITLE, String.class);
    if (title == null || title.equals("")) {
        title = resourcePage.getPageTitle();
    }
    if (title == null || title.equals("")) {
        title = resourcePage.getTitle();
    }
    if (title == null || title.equals("")) {
        title = resourcePage.getName();
    }


        %><h3><%= title %></h3><%


%>

<div class="also-viewed-container">
		<ul class="also-viewed">
			<li class="also-viewed-item">
				<div class="row">
					<div class="col-md-6 pr0">
						<a href="/job-ready-web-developer/"> <img
							alt="The Complete Web Developer Bootcamp - Beginner to Expert"
							src="https://udemy-images.udemy.com/course/200_H/390866_7f55_3.jpg">
						</a>
					</div>
					<div class="col-md-6 mt5-xs">
						<div>
							<a ng-href="/job-ready-web-developer/"
								class="also-viewed-course-title"
								href="/job-ready-web-developer/"> The Complete Web Developer
								Bootcamp - Beginner to Expert </a>
						</div>
						<div>
							<span class="price smaller"> S$35 </span>
						</div>
						<div>
							<span class="s-rating smaller maroon static mt5"> <span
								ng-style="{width: course.avg_rating * 20 + '%'}"
								style="width: 92.2292%;"></span>
							</span>
						</div>
					</div>
				</div>
			</li>
			<!-- end ngRepeat: course in recommendedCourses -->
			<li class="also-viewed-item"
				in-view="$inview&amp;&amp;markAsSeen(course)"
				ng-repeat="course in recommendedCourses">
				<div class="row">
					<div class="col-md-6 pr0">
						<a ng-href="/the-web-developer-bootcamp/"
							href="/the-web-developer-bootcamp/"> <img
							ng-src="https://udemy-images.udemy.com/course/200_H/625204_436a_2.jpg"
							alt="The Web Developer Bootcamp"
							src="https://udemy-images.udemy.com/course/200_H/625204_436a_2.jpg">
						</a>
					</div>
					<div class="col-md-6 mt5-xs">
						<div>
							<a ng-href="/the-web-developer-bootcamp/"
								class="also-viewed-course-title"
								href="/the-web-developer-bootcamp/"> The Web Developer
								Bootcamp </a>
						</div>
						<div>
							<span class="price smaller"> S$35 </span>
						</div>
						<div>
							<span class="s-rating smaller maroon static mt5"> <span
								ng-style="{width: course.avg_rating * 20 + '%'}"
								style="width: 98.913%;"></span>
							</span>
						</div>
					</div>
				</div>
			</li>
			<!-- end ngRepeat: course in recommendedCourses -->
			<li class="also-viewed-item"
				in-view="$inview&amp;&amp;markAsSeen(course)"
				ng-repeat="course in recommendedCourses">
				<div class="row">
					<div class="col-md-6 pr0">
						<a
							ng-href="/design-and-develop-a-killer-website-with-html5-and-css3/"
							href="/design-and-develop-a-killer-website-with-html5-and-css3/">
							<img
							ng-src="https://udemy-images.udemy.com/course/200_H/437398_46c3_7.jpg"
							alt="Build Responsive Real World Websites with HTML5 and CSS3"
							src="https://udemy-images.udemy.com/course/200_H/437398_46c3_7.jpg">
						</a>
					</div>
					<div class="col-md-6 mt5-xs">
						<div>
							<a
								ng-href="/design-and-develop-a-killer-website-with-html5-and-css3/"
								class="also-viewed-course-title"
								href="/design-and-develop-a-killer-website-with-html5-and-css3/">
								Build Responsive Real World Websites with HTML5 and CSS3 </a>
						</div>
						<div>
							<span class="price smaller"> S$35 </span>
						</div>
						<div>
							<span class="s-rating smaller maroon static mt5"> <span
								ng-style="{width: course.avg_rating * 20 + '%'}"
								style="width: 97.8086%;"></span>
							</span>
						</div>
					</div>
				</div>
			</li>
			<!-- end ngRepeat: course in recommendedCourses -->
		</ul>
	</div>