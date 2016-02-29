<%@page session="false"%>
<%@include file="/libs/foundation/global.jsp"%>
<%@include file="/apps/wda/global/global.jsp"%>

<div class="modal fade" id="addNewModal" tabindex="-1" role="dialog" aria-labelledby="courseModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="courseModalLabel">New Course</h4>
      </div>
      <form id="courseAddForm" data-toggle="validator" >
      <input type="hidden" id="id" name="id">
      <div class="modal-body">
          <div class="form-group">
            <label for="courseRef" class="control-label">Course Reference Number:</label>
            <input type="text" class="form-control" id="courseRef" name="courseRef" required>
          </div>
          <div class="form-group">
            <label for="courseTitle" class="control-label">Course Title:</label>
            <input type="text" class="form-control" id="courseTitle" name="courseTitle" required>
          </div>
          <div class="form-group">
            <label for="courseType" class="control-label">Course Type:</label>
            <select id="courseType" class="form-control" name="courseType">
            	<option value=""></option>
            	<option value="NSRSAC">NSRSAC</option>
            	<option value="WSQ">WSQ</option>
            </select>
          </div>
          <div class="form-group">
            <label for="courseArea" class="control-label">Area of Training:</label>
            <input type="text" class="form-control" id="courseArea" name="courseArea">
          </div>
          <div class="form-group">
            <label for="courseObjective" class="control-label">Course Objectives:</label>
            <input type="text" class="form-control" id="courseObjective" name="courseObjective">
          </div>
          <div class="form-group">
            <label for="courseContent" class="control-label">Course Content:</label>
            <textarea class="form-control" id="courseContent" name="courseContent" required></textarea>
          </div>
          <div class="form-group">
            <label for="courseImageUrl" class="control-label">Image URL:</label>
            <input type="text" class="form-control" id="courseImageUrl" name="courseImageUrl">
          </div>
          <div class="form-group">
            <label for="courseLang" class="control-label">Course Language:</label>
            <select id="courseLang" class="form-control" name="courseLang">
            	<option value=""></option>
            	<option value="Chinese">Chinese</option>
            	<option value="English">English</option>
            	<option value="Malay">Malay</option>
            </select>
          </div>
          <div class="form-group">
            <label for="courseUrl" class="control-label">Course URL:</label>
            <input type="text" class="form-control" id="courseUrl" name="courseUrl">
          </div>
          <div class="form-group">
            <label for="courseCost" class="control-label">Total Cost per Trainee:</label>
            <input type="text" class="form-control" id="courseCost" name="courseCost">
          </div>
          <div class="form-group">
            <label for="courseHours" class="control-label">Duration in Hours:</label>
            <input type="text" class="form-control" id="courseHours" name="courseHours">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btnCreateCourse">Create</button>
      </div>
      </form>
    </div>
  </div>
</div>
<script>
	$(function(){
		$('#courseAddForm').validator().on('submit', function (e) {
		  if (e.isDefaultPrevented()) {
			  // Invalid data
		  } else {
			  var datastring = $("#courseAddForm").serialize();
				console.log(datastring);
				var aj = $.ajax({
					url: "<%=resource.getPath()%>.add",
					type: "POST",
					data: datastring,
					dataType: "json"
				});
				
				aj.always(function(jqXHR){
					$("#courseAddForm")[0].reset();
					$("#addNewModal").modal("hide");
					console.log(jqXHR);
					if(jqXHR.hasOwnProperty("error") && jqXHR.error.length > 0){
						showError(jqXHR.error[0]);
					}
					if(jqXHR.hasOwnProperty("message") && jqXHR.message.length > 0){
						console.log(jqXHR.message[0]);
						showSuccess(jqXHR.message[0]);
		                return;
					}
				});
				
			  e.preventDefault();
			  return false;
		  }
		});	
		
		$('#btnCreateCourse').click(function(){
			$('#courseAddForm').submit();
		});
	});
</script>
