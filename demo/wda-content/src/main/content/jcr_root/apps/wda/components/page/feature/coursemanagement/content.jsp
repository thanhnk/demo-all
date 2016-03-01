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
	String loginedUser = request.getUserPrincipal().getName();

%>
<div class="contentSection">
	<div class="container">
		<div class="contentHolder">
			<div class="mainContent">
				<h3>Course Management</h3>
				<h4>Filter by</h4>
				<div id="searchFormDiv">
					<form id="searchForm">
                        <div class="row">
                            <div class="form-group col-xs-2">
								<label for="status">Status</label> 
                                <select
									class="form-control" name="searchStatus" id="searchStatus">
									<option value="">Any</option>
									<option value="new">New</option>
									<option value="approved">Approved</option>
								</select>
							</div>
							<div class="form-group col-xs-2 ">
								<label for="searchReference">Reference Number</label> 
                                <input type="text" class="form-control" id="searchReference"
										name="searchReference" placeholder="Search for..."> <span
										class="input-group-btn">
                                </span>
							</div>
                            <div class="form-group col-xs-4 ">
								<label for="searchTitle">Title</label> 
                                <input type="text" class="form-control" id="searchTitle"
										name="searchTitle" placeholder="Search for..."> <span
										class="input-group-btn">
                                </span>
							</div>
							
							<div class="form-group col-xs-2 ">
                                <label for="status">&nbsp;</label> 
                                <div class="input-group">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" id="searchBtn">Search</button>
                                    </span>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button" id="addNew">Add New</button>
                                    </span>
                                </div>
                            </div>
                        </div>
					</form>
					<div class="table-responsive">
						<table class="table-striped table" id="tableListing">
							<thead>
								<tr id="tableHeader">
									<th>Reference Number</th>
									<th>Title</th>
									<th>Type</th>
									<th>Area of Training</th>
									<th>Objectives</th>
									<th>Content</th>
									<th>Language</th>
									<!-- <th>Url</th> -->
									<th>Cost</th>
									<th>Hours</th>
									<th style="width: 110px">&nbsp;</th>
								</tr>
							</thead>
							<tbody id="tableBody">
							</tbody>
							<!-- <tr class="hide" id="noResultHead">
								<td colspan="3">No results found</td>
							</tr>
							<tr class="" id="loadingResultHead">
								<td colspan="7">Loading please wait...</td>
							</tr> -->
						</table>
						<p id="listInfo">Total of 0 items.</p>
					</div>
				</div>
			</div>
			<!-- end <div class="mainContent"> -->
		</div>
		<!--  end <div class="contentHolder"> -->
	</div>
	<!-- end <div class="container"> -->
</div>
<cq:include script="/apps/wda/components/page/feature/coursemanagement/addnew.jsp"/>
<script>
	var loginedUser = '<%=loginedUser%>';
	$(function(){
		loadCourses();
		
		$('#searchBtn').click(function(){
			loadCourses();
		});
		
		$('#addNew').click(function(){
			$("#addNewModal").modal("show");
		});
		
		$('#addNewModal').on('hidden.bs.modal', function (e) {
			loadCourses();
		})
	});
	
	function loadCourses(){
		var datastring = $("#searchForm").serialize();
		var aj = $.ajax({
			url: "<%=resource.getPath()%>.load",
			type: "POST",
			data: datastring,
			dataType: "json"
		});
		
		aj.always(function(jqXHR){
			if(jqXHR.hasOwnProperty("error") && jqXHR.error.length > 0){
				showError(jqXHR.error[0]);
			}
			if(jqXHR.hasOwnProperty("info") && jqXHR.info.length > 0){
				console.log(jqXHR.info);
				var table = $('#tableBody');
				table.html('');
				$('#listInfo').html('Total of ' + jqXHR.info.length + ' items.');
				for (var i = 0; i < jqXHR.info.length; i++){
					addCourseRow(table, jqXHR.info[i]);
				}
			}
		});
	}
	
	function addCourseRow(table, row){
		var html = '<tr id="' + row.id + '">';
		html += '<td><a target="_blank" href="/content/wda/en/course-view.html?id=' + row.id + '">' + row.courseRef + '</a></td>';
		html += '<td>' + row.courseTitle + '</td>';
		html += '<td>' + row.courseType + '</td>';
		html += '<td>' + row.courseArea + '</td>';
		
		var courseObjective = row.courseObjective;
		if (courseObjective.length > 80){
			courseObjective = courseObjective.substring(0, 80) + ' ...';
		}
		html += '<td>' + courseObjective + '</td>';
		
		var courseContent = row.courseContent;
		if (courseContent.length > 80){
			courseContent = courseContent.substring(0, 80) + ' ...';
		}
		html += '<td>' + courseContent + '</td>';
		html += '<td>' + row.courseLang + '</td>';
		//html += '<td>' + row.courseUrl + '</td>';
		html += '<td>' + row.courseCost + '</td>';
		html += '<td>' + row.courseHours + '</td>';
		html += '<td course="' + row.id + '">';
		var updateLink = '<a href="#" onclick="updateCourse(\'' + row.id + '\')">Edit</a>';
		html += updateLink;
		if (row.status == 'new' && loginedUser == 'admin'){
			var approveLink = '<a href="#" onclick="approveCourse(\'' + row.id + '\')">Approve</a>';
			html += '&nbsp;|&nbsp;' + approveLink
		}
		html += '</td>'
		html += '</tr>';
		
		table.append(html);
	}
	function updateCourse(id){
		alert('updated:' + id);
	}
	function approveCourse(id){
		var aj = $.ajax({
			url: "<%=resource.getPath()%>.approve",
			type: "POST",
			data: {'id':id},
			dataType: "json"
		});
		
		aj.always(function(jqXHR){
			if(jqXHR.hasOwnProperty("error") && jqXHR.error.length > 0){
				showError(jqXHR.error[0]);
			}
			if(jqXHR.hasOwnProperty("message") && jqXHR.message.length > 0){
				showSuccess(jqXHR.message[0]);
				console.log(jqXHR.message);
				var table = $('#tableBody');
				table.find('td[course="' + id + '"]').html('<a href="#" onclick="updateCourse(\'' + id + '\')">Edit</a>');
			}
		});
	}
</script>
