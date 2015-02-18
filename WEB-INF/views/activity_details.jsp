<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
		<button type='button' id='' class='btn btn-primary btn-xs addnotesbtn'>Add Notes</button>&nbsp;
		<button type='button' id='addattachmentbtn' class='btn btn-primary btn-xs'>Add Attachment</button><br><br>
					      	 
					      	
	    <div class='addnotesdiv' style='display:none;'>      
	      	<input type='hidden' id='noteid' name='id' value=''>
	      	<form class='form-horizontal' id='addnotesform' enctype='multipart/form-data'>
		        <input type='hidden' id='activity_id' name='activity_id' value='${activity.aid}'>
		      	<input type='hidden' id='created_by' name='created_by' value='${email}'>
		      	<input type='hidden' id='last_updated_by' name='last_updated_by' value='${email}'>
		      	<div class='row'>	      	
				  <div class='col-xs-6 col-md-4'>					  
					  <div class='form-group'>
					    <label class='col-xs-4 control-label'>Type</label>
					    <div class='col-md-8' style='padding-left: 0px;'>						    
					      <input type='text' class='form-control input-sm' id='note_type' name='note_type' placeholder='Note Type' >
					    </div>
					  </div>			  
				  </div>			  
				  <div class='col-xs-6 col-md-4'>
					  <div class='form-group'>
					    <label class='col-xs-4 control-label'>Details</label>
					    <div class='col-md-8' style='padding-left: 0px;'>
					      <textarea class='form-control input-sm' rows='3' id='note_details' name='note_details' placeholder='Note Details'></textarea>
					    </div>
					  </div>  
				  </div>
				  <div class='col-xs-6 col-md-4'>
				</div>
				</div>
				<div class='form-group'>
				    <div class='col-sm-offset-2 col-sm-10'>
				       <button  type='submit' class='btn btn-success btn-xs' id='btn-notesubmit'>	Submit</button>&nbsp;
				       <button  type='button' class='btn btn-success btn-xs' id='btn-actnupdate' style='display:none;'> Update</button>&nbsp;
					   <button type='button' id='nbtn-cnl' class='btn btn-danger btn-xs nbtn-cnl' > Cancel</button>
				    </div>
				</div>				
	      	</form>
		</div>	
		
		<div class='addattachmentsdiv' style='display:none;'>      
	      	<input type='hidden' id='aid' name='id' value=''>
	      	<form class='form-horizontal' id='addattachmentform' enctype='multipart/form-data'>
		        <input type='hidden' id='act_id' name='activity_id' value='${activity.aid}'>
		      	<input type='hidden' id='created_by' name='created_by' value='${email}'>
		      	<input type='hidden' id='last_updated_by' name='last_updated_by' value='${email}'>
		      	<div class='row'>	      	
				  <div class='col-xs-6 col-md-4'>					  
					  <div class='form-group'>
					    <label class='col-xs-4 control-label'>Type</label>
					    <div class='col-md-8' style='padding-left: 0px;'>						    
					      <input type='text' class='form-control input-sm' id='attachement_details' name='attachement_details' placeholder='Attachment Details' >
					    </div>
					  </div>			  
				  </div>			  
				  <div class='col-xs-6 col-md-4'>
					  <div class='form-group'>
					    <label class='col-xs-4 control-label'>Details</label>
					    <div class='col-md-8' style='padding-left: 0px;'>
					      <textarea class='form-control input-sm' rows='3' id='note_details' name='note_details' placeholder='Note Details'></textarea>
					    </div>
					  </div>  
				  </div>
				  <div class='col-xs-6 col-md-4'>				  
					  <div class='form-group'>
					    <label class='col-xs-4 control-label'>Attachment</label>
					    <div class='col-md-8' style='padding-left: 0px;'>
					        <!-- <input type="file" id="resume" name="resume"> -->
					     	<input id="fileupload" type="file" name="files[]" data-url="../controller/upload" multiple> 
						    <div id="dropzone">Drop files here</div>
						 
						    <div id="progress">
						        <div style="width: 0%;"></div>
						    </div>
    						<p class="help-block">Example block-level help text here.</p>
					    </div>
					  </div> 
				  </div>
				</div>
				<div class='form-group'>
				    <div class='col-sm-offset-2 col-sm-10'>
				       <button  type='submit' class='btn btn-success btn-xs' id='btn-submit'>	Submit</button>&nbsp;
				       <button  type='button' class='btn btn-success btn-xs' id='btn-actaupdate' style='display:none;'> Update</button>&nbsp;
					   <button type='button' id='abtn-cnl' class='btn btn-danger btn-xs abtn-cnl' > Cancel</button>
				    </div>
				</div>				
	      	</form>
		</div>	
		<hr style="margin:0px;">
		<div> 
			<h5><strong>Notes:</strong></h5>
			<table class="table table-striped table-condensed" id="NotesTableResult" >
		      <thead>
		        <tr>
					<th>&nbsp;</th>
					<th>Type</th>
					<th>Details</th>
					<th>Edit</th>
					<th>Delete</th>
		        </tr>
		      </thead>
		      <tbody id="NotesTable">
		      	<%-- <c:forEach items="${notes}" var="note">
		      		<tr id="${note.id}" >
						<td><c:out value="${note.note_type}"/></td>
						<td><c:out value="${note.note_details}"/></td>
						<td><button class="btn btn-warning btn-xs" >Edit</button></td>
						<td><button class="btn btn-danger btn-xs" onclick="DeleteEmp(${note.id});">Delete</button></td>
					</tr>
				</c:forEach> --%>
		      </tbody>
		    </table>
		    
			<h5><strong>Attachments:</strong></h5>
		    <table class="table table-striped table-condensed" id="ActivityTableResult" >
		      <thead>
		        <tr>
					<th>&nbsp;</th>
					<th>Type</th>
					<th>Details</th>
					<th>Attachment</th>
					<th>Edit</th>
					<th>Delete</th>
		        </tr>
		      </thead>
		      <tbody id="ActivityTable">
		      	<c:forEach items="${lactivities}" var="a">
		      		<tr id="${a.aid}" >
						<td><c:out value="${a.activity_type}"/></td>
						<td><c:out value="${a.activity_subtype}"/></td>
						<td><c:out value="${a.activity_details}"/></td>
						<td><c:out value="${a.start_date}"/></td>
						<td><button class="btn btn-danger btn-xs" onclick="DeleteEmp(${a.aid});">Delete</button></td>
					</tr>
				</c:forEach>
		      </tbody>
		    </table>
		</div>
<script type="text/javascript">

function fetchNotesdata() {
	aid = $('#activity_id').val();
 	$.post('../note/fetch',{aid:aid}, function(json) {
 		var taRow = "";
 		$("#NotesTable").html("");
 		$.each(json, function(i, val) {
 			taRow += "<tr id="+val.id+">";
        	taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
	        	taRow += "<div><dl><dt>Created on:</dt><dd>"+new Date(val.created).toUTCString().substr(0, 25)+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	        	taRow += "<dt>Last updated on:</dt><dd>"+new Date(val.last_updated).toUTCString().substr(0, 25)+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
        		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
        	taRow += "<td>"+val.note_type+"</td>";
        	taRow += "<td>"+val.note_details+"</td>";
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillNotesData('"+val.id+"','"+val.note_type+"','"+val.note_details+"','"+val.created_by+"','"+val.activity_id+"');\"><i class='icon-edit-sign'></i></button></td>";
        	taRow += "<td><button class='btn btn-danger btn-xs' onClick=\"DeleteNote('"+val.id+"');\"><i class='icon-remove-sign'></i></button></td>";
            taRow += "</tr>";   	
            $("#NotesTable").append(taRow);
            taRow = "";
 		});
 		load(); 
	});
}

function DeleteNote(id){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			//alert(aid);
			$.post('../note/delete',{id:id}, function(response){
				bootbox.alert(response);
				fetchNotesdata();
				$('#addnotesform')[0].reset();
				$('#btn-notesubmit').show();
				$('#btn-actnupdate').hide();
			}); 
		}
	}); 
}

function fillNotesData(id, note_type, note_details, created_by, activity_id){
	$('.addnotesdiv').show();
	$('#btn-notesubmit').hide();
	$('#btn-actnupdate').show();
	
	$("#noteid").val(id);
    
    $("#note_type").val(note_type);
    $("#note_details").val(note_details);
    $("#created_by").val(created_by);
    $("#activity_id").val(activity_id);
	$("html, body").animate({ scrollTop: 1 }, "slow");
}

$('.addnotesbtn').click(function(){
	$('.addnotesdiv').show();
	$('.addattachmentsdiv').hide();
	$('#addnotesform')[0].reset();
	$('#btn-notesubmit').show();
	$('#btn-actnupdate').hide();
});
$('#nbtn-cnl').click(function(){
	$('.addnotesdiv').hide();
});
$('#addattachmentbtn').click(function(){
	$('.addattachmentsdiv').show();
	$('.addnotesdiv').hide();
});
$('#abtn-cnl').click(function(){
	$('.addattachmentsdiv').hide();
});
$(document).ready(function(){
	fetchNotesdata();
	$('#addnotesform').submit(function(e) {
		var values = $(this).serializeArray();
		values = jQuery.param(values);
	    alert(values);	    
		$.post('../note/add', values, function(response) {
			bootbox.alert(response);
			fetchNotesdata();
			/* $('#addactivityform')[0].reset();
			$('#btn-actupdate').hide();
			$('#btn-submit').show();
			fetchactivitiesdata() */
			
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
});
</script>      	