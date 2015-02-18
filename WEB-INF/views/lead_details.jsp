<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<style>
.dl-horizontal dt {
float: left;
width: 116px;
overflow: hidden;
clear: left;
text-align: right;
text-overflow: ellipsis;
white-space: nowrap;
}
.dl-horizontal dd {
margin-left: 121px;
word-wrap: break-word;
}
.well {
padding-bottom: 0px;
}
</style>
<script type="text/javascript">
	$(function () {
        $('.timePicker').datetimepicker({
            weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 1,
			minView: 0,
			maxView: 1,
			forceParse: 0,
			showMeridian: 1
        });
    });
		
	$(function () {
		$('.datePicker').datetimepicker({
			weekStart: 1,
			todayBtn:  1,
			autoclose: 1,
			todayHighlight: 1,
			startView: 2,
			minView: 2,
			forceParse: 0
			
		});
	});
</script>
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li><a href="../lead/leads">Leads</a></li>
  <li class="active">${lead.first_name}  ${lead.last_name} Details</li>
</ol>
<div class="row">
	<div class="col-md-3">
		<div class="well well-sm">
			<h5><strong>Lead Details(ID:<span class="text-danger">${lead.lid}</span>)</strong></h5>
			<dl class="dl-horizontal">
			  <dt>First Name:</dt><dd>${lead.first_name}</dd>
			  <dt>Middle Name:</dt><dd>${lead.middle_name}</dd>
			  <dt>Last Name:</dt><dd>${lead.last_name}</dd>
			  
			  <dt>Gender:</dt><dd>${lead.gender}</dd>
			  <dt>Marital Status:</dt><dd>${lead.marital_status}</dd>
			  <dt>Technology:</dt><dd>${lead.technology}</dd>
			  <dt>Type:</dt><dd>${lead.ltype}</dd>
			  
			  <dt>Expected Salary:</dt><dd>${lead.expected_sal}</dd>
			  <dt>Applied For:</dt><dd>${lead.applied_for}</dd>
			  <dt>Assign To:</dt><dd>${lead.assign_to}</dd>
			  <dt>Experience:</dt><dd>${lead.exp}</dd>
			  <dt>Channel:</dt><dd>${lead.channel}</dd>
			  <dt>Channel Name:</dt><dd>${lead.c_name}</dd>

			  <dt class="text-uppercase text-primary">Current</dt><dd></dd>
			  <dt>Designation:</dt><dd>${lead.cur_designation}</dd>
			  <dt>Salary:</dt><dd>${lead.cur_sal}</dd>
			  <dt>Organization:</dt><dd>${lead.cur_org}</dd>
			  <dt>Status:</dt><dd>${lead.cur_status}</dd>
			  <dt>Employment Type:</dt><dd>${lead.cur_emp_type}</dd>	

			  <dt class="text-uppercase text-primary">Email</dt><dd></dd>
			  <dt>Work:</dt><dd>${lead.email_work}</dd>			  
			  <dt>Personal:</dt><dd>${lead.email_personal}</dd>
			  
			  <dt class="text-uppercase text-primary">Phone</dt><dd></dd>			  
			  <dt>Home:</dt><dd>${lead.home_ph_num}</dd>
			  <dt>Work:</dt><dd>${lead.work_ph_num}</dd>
			  <dt>Cell:</dt><dd>${lead.cell_ph_num}</dd>
			  
			  <dt class="text-uppercase text-primary">Location</dt><dd></dd>				  
			  <dt>Constraint:</dt><dd>${lead.loc_constraint}</dd>
			  <dt>State:</dt><dd>${lead.loc_state}</dd>
			  <dt>City:</dt><dd>${lead.loc_city}</dd>
			</dl>
		</div>
	</div>
	<div class="col-md-9" style="padding-left: 0px;">
		<div class="panel panel-info">
	      <div class="panel-heading">
	        <h3 class="panel-title">Activities</h3>
	      </div>
	      <div class="panel-body container-fluid">
	      	<button type="button" id="addactivitybtn" class="btn btn-primary btn-xs">Add</button>
	        <div id="addactivitydiv" style="display: none;">        	<br><br/>
		      	<input type="hidden" id="aid" name="id" value="">
		      	<form class="form-horizontal" id="addactivityform" enctype="multipart/form-data">
			        <input type="hidden" id="leadID" name="lead_id" value="${lead.lid}">
			      	<input type="hidden" id="created_by" name="created_by" value="${email}">
			      	<input type="hidden" id="last_updated_by" name="last_updated_by" value="${email}">
			      	<div class="row">	      	
					  <div class="col-xs-6 col-md-4">					  
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Type</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						    	<select class="form-control input-sm" id="activity_type" name="activity_type">
							    	<c:forEach items="${listvalues}" var="lv">
								    	<option value="${lv.list_value}">${lv.list_value}</option>
									</c:forEach>									
								</select>
						    </div>
						  </div>		
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Sub type</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <input type="text" class="form-control input-sm" id="activity_subtype" name="activity_subtype" placeholder="Sub type">
						    </div>
						  </div>
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Details</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <textarea class="form-control input-sm" rows="3" id="activity_details" name="activity_details" placeholder="Details"></textarea>
						    </div>
						  </div>				  
					  </div>			  
					  <div class="col-xs-6 col-md-4">
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Start Date</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <div class="input-group date datePicker" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
								<input class="form-control input-sm" size="16" id="start_date" name="start_date" type="text" placeholder="yyyy-mm-dd" value="" required>
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							  </div>
						    </div>
						  </div>					  
						  <div class="form-group">
						    <label class="col-xs-4 control-label">End Date</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <div class="input-group date datePicker" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
								<input class="form-control input-sm" size="16" id="end_date" name="end_date" type="text" placeholder="yyyy-mm-dd" value="">
								<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
							  </div>
						    </div>
						  </div>		
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Status</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						    	<select class="form-control input-sm" id="status" name="status">
						    		<c:forEach items="${activitystatus}" var="lv">
								    	<option value="${lv.list_value}">${lv.list_value}</option>
									</c:forEach>
								</select>
						    </div>
						  </div>	
					  </div>
					  <div class="col-xs-6 col-md-4">							  	  
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Priority</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <input type="text" class="form-control input-sm" id="priority" name="priority" placeholder="Priority" >
						    </div>
						  </div>  
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Assign To</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <input type="text" class="form-control input-sm" id="assign_to" name="assign_to" placeholder="Assign To" >
						    </div>
						  </div>  
						  <div class="form-group">
						    <label class="col-xs-4 control-label">Comments</label>
						    <div class="col-md-8" style="padding-left: 0px;">
						      <textarea class="form-control input-sm" rows="3" id="comments" name="comments" placeholder="comments"></textarea>
						    </div>
						  </div>  
					  </div>
					</div>
					<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					       <button  type="submit" class="btn btn-success btn-xs" id="btn-submit">	Submit	</button>
					       <button  type="button" class="btn btn-success btn-xs" id="btn-actupdate" style="display:none;">	Update	</button>
						   <button type="button" class="btn btn-danger btn-xs btn-cnl">	Cancel	</button>
					    </div>
					</div>				
		      	</form>
			</div>			
			<hr>
			
			
			<div id="activitiesdiv">
				<%-- <c:forEach items="${lactivities}" var="a">
					<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					   	<c:choose>
						  <c:when test="${a.status=='Open'}">
					 		 <div class="panel panel-success">
						  </c:when>
						  <c:when test="${a.status=='Pending'}">
					  		<div class="panel panel-warning">
						  </c:when>
						  <c:otherwise>
					  		<div class="panel panel-default">
						  </c:otherwise>
						</c:choose>
					    <div class="panel-heading" role="tab" id="headingOne">
					      <h6 class="panel-title">
					        <a data-toggle="collapse" data-parent="#accordion" href="#${a.aid}" aria-expanded="true" aria-controls="collapseOne" style="text-decoration: none;">
					          ${a.activity_type}
					        </a>
					        <span style="float:right">
					        	<small><a class='popoverOption' style="text-decoration: none;" href='#' data-content='<div><dl>
								  <dt>Created on:</dt><dd>${a.created}</dd>
								  <dt>Created by:</dt><dd>${a.created_by}</dd>
								  <dt>Last updated on:</dt><dd>${a.last_updated}</dd>
								  <dt>Last updated by:</dt><dd>${a.last_updated_by}</dd>
								</dl></div>' rel='popover' data-placement='top' data-html="true" data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></small>
						        <button class="btn btn-warning btn-xs" onclick="fillActivityData('${a.aid}','${a.activity_type}','${a.activity_subtype}',
						      	'${a.activity_details}','${a.start_date}','${a.end_date}','${a.priority}','${a.assign_to}','${a.comments}','${a.status}');">
								  <i class="icon-pencil"></i></button>
						      	<button class="btn btn-danger btn-xs" onclick="DeleteActivity('${a.aid}');">
								  <i class="icon-remove"></i></button>
					        </span>
					      </h6>
					    </div>
					    <div id="${a.aid}" class="panel-collapse collapse out" role="tabpanel" aria-labelledby="headingOne">
					      <div class="panel-body">
					      	<button type="button" id="addnotesbtn" class="btn btn-primary btn-xs">Add Notes</button>
					      	<button type="button" id="addattachmentbtn" class="btn btn-primary btn-xs">Add Attachment</button><br><br>
					      	<div class="row">
					      		<div class="col-md-4">				      			
							       <dl class="dl-horizontal">
									  <dt>Type:</dt><dd>${a.activity_type}</dd>
									  <dt>Sub-type:</dt><dd>${a.activity_subtype}</dd>
									  <dt>Details:</dt><dd>${a.activity_details}</dd>
									</dl>
					      		</div>
					      		<div class="col-md-4">		      			
							       <dl class="dl-horizontal">
									  <dt>Start Date:</dt><dd>${a.start_date}</dd>
									  	<c:choose>
									      <c:when test="${a.end_date=='1970-01-01'}">
									  	 	<dt>End Date:</dt><dd></dd>	
									      </c:when>
									      <c:otherwise>
									      	<dt>End Date:</dt><dd>${a.end_date}</dd>
									      </c:otherwise>
									    </c:choose>
									  <dt>Priority:</dt><dd>${a.priority}</dd>
									</dl>					      		
					      		</div>
					      		<div class="col-md-4">		      			
							       <dl class="dl-horizontal">
									  <dt>Assign To:</dt><dd>${a.assign_to}</dd>
									  <dt>Comments:</dt><dd>${a.comments}</dd>
									  <dt>Status:</dt><dd>${a.status}</dd>
									</dl>					      		
					      		</div>
					      	</div>
					      	
					      </div>
					    </div>
					  </div>
					 </div>
				 </c:forEach> --%>
			</div>
			
	        <%--  <table class="table table-striped table-condensed" id="ActivityTableResult" >
			      <thead>
			        <tr>
						<th>Type</th>
						<th>Sub type</th>
						<th>Details</th>
						<th>Start Date</th>
						<th>End Date</th>
						<th>Priority</th>
						<th>Assign To</th>
						<th>Comments</th>
						<th>Status</th>
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
							<td><c:out value="${a.end_date}"/></td>
							<td><c:out value="${a.priority}"/></td>
							<td><c:out value="${a.assign_to}"/></td>
							<td><c:out value="${a.comments}"/></td>
							<td><c:out value="${a.status}"/></td>
							<td><button class="btn btn-danger btn-xs" onclick="DeleteEmp(${a.aid});">Delete</button></td>
						</tr>
					</c:forEach>
			      </tbody>
			    </table> --%>
	
	      </div>
	   </div>
	</div>
</div>
<script type="text/javascript">

function load(){
	$('.popoverOption').popover({ trigger: "hover" },10);
}

function ShowActivityDetails(aid){
	//$('#'+aid).collapse('show');
	//alert(aid);
	$('.adetailsbtn').show();
	$.post('../activity/details',{aid:aid}, function(response) {
		$('.adetails').html("");
		$('#adetailsbtn'+aid).hide();
		$('#panelb'+aid).html(response);
	});
	$('#'+aid).on('hidden.bs.collapse', function () {
		$('#panelb'+aid).html("");
		$('.adetailsbtn').show();
		  
	})
}

function fetchactivitiesdata() {
	leadID = $('#leadID').val();
 	$.post('../activity/fetch',{leadID:leadID}, function(json) {
 		var div = "";
 		$("#activitiesdiv").html("");
 		$.each(json, function(i, val) {
 			div += "<div class='panel-group' id='accordion' role='tablist' aria-multiselectable='true'>";
 			if(val.status=='Open'){
 				div += "<div class='panel panel-success'>";
 			}else if(val.status=='Pending'){
 				div += "<div class='panel panel-warning'>";
 			}else{
 				div += "<div class='panel panel-default'>";
 			} 
 			div += "<div class='panel-heading' role='tab' id='headingOne'>"+
					      "<h6 class='panel-title'>"+
					        "<a data-toggle='collapse' data-parent='#accordion' href='#"+val.aid+"' aria-expanded='true' aria-controls='collapseOne' style='text-decoration: none;' >"+
					          ""+val.activity_type+""+
					        "</a>"+
					        "<span style='float:right'>"+
					        	"<small><a class='popoverOption' style='text-decoration: none;' href='#' data-content='<div><dl>"+
								  "<dt>Created on:</dt><dd>"+new Date(val.created).toUTCString().substr(0, 25)+"</dd>"+
								  "<dt>Created by:</dt><dd>"+val.created_by+"</dd>"+
								  "<dt>Last updated on:</dt><dd>"+new Date(val.last_updated).toUTCString().substr(0, 25)+"</dd>"+
								  "<dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd>"+
								"</dl></div>' rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></small>&nbsp;"+
						        "<button class='btn btn-warning btn-xs' onclick=\"fillActivityData('"+val.aid+"','"+val.activity_type+"','"+val.activity_subtype+"',"+
						      	"'"+val.activity_details+"','"+val.start_date+"','"+val.end_date+"','"+val.priority+"','"+val.assign_to+"','"+val.comments+"','"+val.status+"');\">"+
								  "<i class='icon-pencil'></i></button>&nbsp;"+
						      	"<button class='btn btn-danger btn-xs' onclick=\"DeleteActivity('"+val.aid+"');\" >"+
								  "<i class='icon-remove'></i></button>"+
					        "</span>"+
					      "</h6>"+
					    "</div>"+
					    "<div id='"+val.aid+"' class='panel-collapse collapse out' role='tabpanel' aria-labelledby='headingOne'>"+
					      "<div class='panel-body' >";
					      
 			div +=		      "<div class='row'>"+
					      		"<div class='col-md-4'>"+				      			
							       "<dl class='dl-horizontal'>"+
									  "<dt>Type:</dt><dd>"+val.activity_type+"</dd>"+
									  "<dt>Sub-type:</dt><dd>"+val.activity_subtype+"</dd>"+
									  "<dt>Details:</dt><dd>"+val.activity_details+"</dd>"+
									"</dl>"+
					      		"</div>"+
					      		"<div class='col-md-4'>"+		      			
							       "<dl class='dl-horizontal'>"+
									  "<dt>Start Date:</dt><dd>"+val.start_date+"</dd>";
									  if(val.end_date=='1970-01-01'){
							 				div += "<dt>End Date:</dt><dd></dd>";
							 			}else{
							 				div += "<dt>End Date:</dt><dd>"+val.end_date+"</dd>";
							 			}			 
									  div += "<dt>Priority:</dt><dd>"+val.priority+"</dd>"+
									"</dl>"+					      		
					      		"</div>"+
					      		"<div class='col-md-4'>"+		      			
							       "<dl class='dl-horizontal'>"+
									  "<dt>Assign To:</dt><dd>"+val.assign_to+"</dd>"+
									  "<dt>Comments:</dt><dd>"+val.comments+"</dd>"+
									  "<dt>Status:</dt><dd>"+val.status+"</dd>"+
									"</dl>"+
					      		"</div>"+
					      	"</div><hr style='margin-top: 0px;margin-bottom: 7px;'><button class='btn btn-primary btn-xs adetailsbtn' onclick=\"ShowActivityDetails('"+val.aid+"');\" id='adetailsbtn"+val.aid+"'> Details</button>";
					      
					      
	 	   div += 			"<div id='panelb"+val.aid+"' class='adetails'>";
	 	   
	 	   
	 	  /*  div += "<button type='button' id='' class='btn btn-primary btn-xs addnotesbtn'>Add Notes</button>&nbsp;"+
					      	"<button type='button' id='addattachmentbtn' class='btn btn-primary btn-xs'>Add Attachment</button><br><br>";
				 */	      	
					      	
		   /* div += "<div class='addnotesdiv' style='display:none;'>   "+    
				      	"<input type='hidden' id='aid' name='id' value=''>"+
				      	"<form class='form-horizontal' id='addactivityform' enctype='multipart/form-data'>"+
					        "<input type='hidden' id='notesaid' name='activity_id' value='${lead.lid}'>"+
					      	"<input type='hidden' id='created_by' name='created_by' value='${email}'>"+
					      	"<input type='hidden' id='last_updated_by' name='last_updated_by' value='${email}'>"+
					      	"<div class='row'>"+	      	
							  "<div class='col-xs-6 col-md-4'>"+					  
								  "<div class='form-group'>"+
								    "<label class='col-xs-4 control-label'>Type</label>"+
								    "<div class='col-md-8' style='padding-left: 0px;'>"+						    
								      "<input type='text' class='form-control input-sm' id='note_type' name='note_type' placeholder='Note Type' >"+
								    "</div>"+
								  "</div>"+			  
							  "</div>"+			  
							  "<div class='col-xs-6 col-md-4'>"+
								  "<div class='form-group'>"+
								    "<label class='col-xs-4 control-label'>Details</label>"+
								    "<div class='col-md-8' style='padding-left: 0px;'>"+
								      "<textarea class='form-control input-sm' rows='3' id='note_details' name='note_details' placeholder='Note Details'>"+"</textarea>"+
								    "</div>"+
								  "</div>"+  
							  "</div>"+
							  "<div class='col-xs-6 col-md-4'>"+
							"</div>"+
							"</div>"+
							"<div class='form-group'>"+
							    "<div class='col-sm-offset-2 col-sm-10'>"+
							       "<button  type='submit' class='btn btn-success btn-xs' id='btn-submit'>	Submit</button>&nbsp;"+
							       "<button  type='button' class='btn btn-success btn-xs' id='btn-actnupdate' style='display:none;'> Update</button>&nbsp;"+
								   "<button type='button' id='nbtn-cnl' class='btn btn-danger btn-xs'> Cancel</button>"+
							    "</div>"+
							"</div>"+				
				      	"</form>"+
					"</div>";	 */			      	
					      	
			div +=	      "</div></div>"+
					    "</div>"+
					  "</div></div>";
            $("#activitiesdiv").append(div);
            div = "";
 		});
 		load(); 
 		laodafterajaxcall()
	});
 	
}


function fillActivityData(aid, atype, asubtype, details, sdate, edate, priority, assignto, comments, status){
	$('#addactivitydiv').show();
	$('#btn-submit').hide();
	$('#btn-actupdate').show();
	
	$("#aid").val(aid);
    
    $("#activity_type").val(atype);
    $("#activity_subtype").val(asubtype);
    $("#activity_details").val(details);
    $("#start_date").val(sdate);
    if(edate=="1970-01-01"){
        $("#end_date").val("");
    }
    else{
        $("#end_date").val(edate);    	
    }
    $("#priority").val(priority);
    
    $("#assign_to").val(assignto);
    $("#comments").val(comments);
    $("#status").val(status);
    
	$("html, body").animate({ scrollTop: 1 }, "slow");
	
}

function DeleteActivity(aid){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			//alert(aid);
			$.post('../activity/delete',{aid:aid}, function(response){
				bootbox.alert(response);
				fetchactivitiesdata();
				$('#addactivityform')[0].reset();
				$('#btn-actupdate').hide();
				$('#btn-submit').show();
			}); 
		}
	}); 
}

function laodafterajaxcall(){
	
	$('.addnotesbtn').click(function(){
		$('.addnotesdiv').show();
	});
	$('#nbtn-cnl').click(function(){
		$('.addnotesdiv').hide();
	});
}
$(document).ready(function(){
	fetchactivitiesdata()
	
	$('.popoverOption').popover({ trigger: "hover" },10);
	
	$('#addactivitybtn').click(function(){
		$('#addactivityform')[0].reset();
		$('#addactivitydiv').show();
		$('#btn-actupdate').hide();
		$('#btn-submit').show();
	});
	$('.btn-cnl').click(function(){
		$('#addactivitydiv').hide();
	});
	

	$('#btn-actupdate').click(function(e) {
		var values = $('#addactivityform').serializeArray();		 
		var index;
		    values.push({
		        name: "aid",
		        value: $('#aid').val()
		    });
		for (index = 0; index < values.length; ++index) {
			console.log('inside');
		    if (values[index].name == "end_date") {
		    	if(values[index].value==""){
			    	console.log('inside inside');
			        values[index].value = "1970-01-01";
		    	}
		    	console.log(values[index].value);
		        break;
		    }
		}
		values = jQuery.param(values);
		//alert(values); 
		$.post('../activity/update', values , function(response) {
			bootbox.alert(response);
			$('#addactivityform')[0].reset();
			$('#addactivitydiv').fadeOut("slow");
			fetchactivitiesdata()
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#addactivityform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var index;
		var values = $(this).serializeArray();
	    //alert(values);
		for (index = 0; index < values.length; ++index) {
		    if (values[index].name == "end_date") {
		    	if(values[index].value==""){
			        values[index].value = "1970-01-01";
		    	}
		        break;
		    }
		}
		values = jQuery.param(values);
	    //alert(values);	    
		$.post('../activity/add', values, function(response) {
			bootbox.alert(response);
			$('#addactivityform')[0].reset();
			$('#btn-actupdate').hide();
			$('#btn-submit').show();
			fetchactivitiesdata()
			/* $("#EmployeesTable").empty();
		    var oTable = $('#EmployeesTableResult').dataTable();
		    oTable.fnDestroy();
			fetchEmpdata(); */
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
});
</script>