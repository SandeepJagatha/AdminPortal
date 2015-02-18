<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>


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
	$('#leadli').addClass('active');
</script>

<!-- Main content div -->
<div class="container" id="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Leads</li>
</ol>
	<div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Add Lead</h3>
      </div>
      <div class="panel-body container-fluid">
      	<button type="button" id="addleadbtn" class="btn btn-primary btn-xs">Add Lead</button><br><br/>
        <div id="addleaddiv" style="display: none;">        	
	      	<input type="hidden" id="id" name="id" value="">
	      	<form class="form-horizontal" id="addleadform" enctype="multipart/form-data">
	      	<input type="hidden" id="createdby" name="created_by" value="${tdmin.email}">
	      	<input type="hidden" id="lastupdate" name="last_updated_by" value="${tdmin.email}">
		      	<div class="row">	      	
				  <div class="col-xs-6 col-md-4">
					  <div class="form-group">
					    <label class="col-xs-4 control-label">First Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="first_name" name="first_name" placeholder="First Name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Middle Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="middle_name" name="middle_name" placeholder="Middle Name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Last Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="last_name" name="last_name" placeholder="Last Name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Email(Work)</label>
					    <div class="col-md-8">
					      <input type="email" class="form-control input-sm" id="email_work" name="email_work" placeholder="Email(Work)">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Email(Personal)</label>
					    <div class="col-md-8">
					      <input type="email" class="form-control input-sm" id="email_personal" name="email_personal" placeholder="Email(Personal)">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Phone Num.</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="home_ph_num" name="home_ph_num" placeholder="Home">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Phone Num.</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="work_ph_num" name="work_ph_num" placeholder="Work">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Phone Num.</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="cell_ph_num" name="cell_ph_num" placeholder="Cell">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Type</label>
					    <div class="col-md-8">
					    	<select class="form-control input-sm" id="ltype" name="ltype">
						    	<c:forEach items="${listvalues}" var="lv">
							    	<option value="${lv.list_value}">${lv.list_value}</option>
								</c:forEach>
								
							</select>
					    </div>
					  </div>
					  
				  </div>			  
				  <div class="col-xs-6 col-md-4">
				     <div class="form-group">
					    <label class="col-xs-4 control-label">Technology</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="technology" name="technology" placeholder="Technology"  required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Designation</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="cur_designation" name="cur_designation" placeholder="Current Designation"  required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Current Sallary</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="cur_sal" name="cur_sal" placeholder="Current Sallary" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Current Organization</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="cur_org" name="cur_org" placeholder="Current Organization" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Current Status</label>
					    <div class="col-md-8">
					    	<select class="form-control input-sm" id="cur_status" name="cur_status">
							  <c:forEach items="${curstatus}" var="lv">
							    	<option value="${lv.list_value}">${lv.list_value}</option>
								</c:forEach>
							</select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Current Employee Type</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="cur_emp_type" name="cur_emp_type" placeholder="Current Employee Type" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Expected Sallary</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="expected_sal" name="expected_sal" placeholder="Expected Sallary" required>
					    </div>
					  </div>			  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Gender</label>
					    <div class="col-md-8">
					    	<select class="form-control input-sm" id="gender" name="gender">
							  <option value="Male">Male</option>
							  <option value="Female">Female</option>
							</select>
					    </div>
					  </div>	
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Marital Status</label>
					    <div class="col-md-8">
					    	<select class="form-control input-sm" id="marital_status" name="marital_status">
							  <option value="Single">Single</option>
							  <option value="Married">Married</option>
							</select>
					    </div>
					  </div>	
				  </div>
				  <div class="col-xs-6 col-md-4">				  
					  	  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Applied For</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="applied_for" name="applied_for" placeholder="Applied For" required>
					    </div>
					  </div>							  	  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Assign To</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="assign_to" name="assign_to" placeholder="assign_to" required>
					    </div>
					  </div>			  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Experience</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="exp" name="exp" placeholder="Experience" required>
					    </div>
					  </div>			  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Channel</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="channel" name="channel" placeholder="Channel" required>
					    </div>
					  </div>	  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Channel Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="c_name" name="c_name" placeholder="Channel name" required>
					    </div>
					  </div>  
					  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Location  constraint</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="loc_constraint" name="loc_constraint" placeholder="Location constraint" >
					    </div>
					  </div>  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Location State</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="loc_state" name="loc_state" placeholder="Location State" >
					    </div>
					  </div>  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Location City</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="loc_city" name="loc_city" placeholder="Location City" >
					    </div>
					  </div>  
					 <!--  <div class="form-group">
					    <label class="col-xs-4 control-label">Resume</label>
					    <div class="col-md-8">
					     	<input type="file" id="resume" name="resume">
					     	<input id="fileupload" type="file" name="files[]" data-url="../controller/upload" multiple> 
						    <div id="dropzone">Drop files here</div>
						 
						    <div id="progress">
						        <div style="width: 0%;"></div>
						    </div>
    						<p class="help-block">Example block-level help text here.</p>
					    </div>
					  </div> -->
				  </div>
				</div>
				<div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10">
				       <button  type="submit" class="btn btn-success btn-xs" id="btn-submit">	Submit	</button>
				       <button  type="button" class="btn btn-success btn-xs" id="btn-update" style="display:none;">	Update	</button>
					   <button type="button" class="btn btn-danger btn-xs btn-cnl">	Cancel	</button>
				    </div>
				</div>				
	      	</form>
		</div>
<!-- 		<table id="uploaded-files">
	        <tr>
	            <th>File Name</th>
	            <th>File Size</th>
	            <th>File Type</th>
	            <th>Download</th>
	        </tr>
	    </table> -->
		<hr>
         <table class="table table-striped table-condensed" id="LeadsTableResult" >
		      <thead>
		        <tr>
					<th>first Name&nbsp;</th>
					<th>first Name</th>
					<th>last Name</th>
					<th>Type</th>
					<th>Status</th>
					<th>Edit</th>
					<c:choose><c:when test="${tdmin.is_admin =='1'}"><th>Delete</th></c:when> <c:otherwise></c:otherwise></c:choose>
		        </tr>
		      </thead>
		      <tbody id="LeadsTable">
		      </tbody>
		    </table>

      </div>
   </div>

</div>
   
   
<script type="text/javascript">

function load(){
	$('.popoverOption').popover({ trigger: "hover" },10);
}

function DeleteLead(id) {
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('delete', {"id":id}, function(response) {
				bootbox.alert(response);
				$("#LeadsTable").empty();
			    var oTable = $('#LeadsTableResult').dataTable();
			    oTable.fnDestroy();
				fetchLeaddata();
			}); 
		}
		load();
	}); 
}

function fillData(lid, fname, mname, lname, emailwork, emailper, homeph, workph, cellph, technology, ltype, cur_designation, cur_sal, cur_org, cur_status, cur_emp_type, expected_sal, gender, createdby, lupdatedby,marital_status,applied_for,
		assign_to,exp,channel,c_name,loc_constraint,loc_state,loc_city)
{
	$('#addleaddiv').show();
	$('#btn-submit').hide();
	$('#btn-update').show();
	
	$("#id").val(lid);
    
    $("#createdby").val(createdby);
    $("#lastupdate").val(lupdatedby);
    $("#first_name").val(fname);
    $("#middle_name").val(mname);
    $("#last_name").val(lname);    
    
    $("#email_work").val(emailwork);
    $("#email_personal").val(emailper);
    $("#home_ph_num").val(homeph);
    $("#work_ph_num").val(workph);    
    $("#cell_ph_num").val(cellph);
    $("#technology").val(technology);
    $("#ltype").val(ltype);
    $("#cur_designation").val(cur_designation);    
    $("#cur_sal").val(cur_sal);
    $("#cur_org").val(cur_org);
    $("#cur_status").val(cur_status);        
    $("#cur_emp_type").val(cur_emp_type);
    $("#expected_sal").val(expected_sal);
    $("#gender").val(gender);
    $("#marital_status").val(marital_status);    
    $("#applied_for").val(applied_for);
    $("#assign_to").val(assign_to);
    $("#exp").val(exp);    
    $("#channel").val(channel);
    $("#c_name").val(c_name);    
    $("#loc_constraint").val(loc_constraint);
    $("#loc_state").val(loc_state);
    $("#loc_city").val(loc_city);   
   	$("html, body").animate({ scrollTop: 0 }, "slow");
}

function fetchLeaddata() {
	
	$("#LeadsTable").empty();
    var oTable = $('#LeadsTableResult').dataTable();
    oTable.fnDestroy();
	
 	$.post('../lead/fetch', function(json) {
 		//alert(json);
 		//console.log(json);        
 		var taRow = "";
 		//$("#LeadsTable").html("");
 		$.each(json, function(i, val) {
 			//var dateString = val.created.format("dd-mm-yyyy")
 			//console.log(dateString); 			
 			//var date = new Date(parseInt(val.created.substr(13)));
 			//var date = new Date(+(val.created.match(/\d+/i))); 
 			taRow += "<tr id='"+val.lid+"' >";
 			taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
        	taRow += "<div><dl><dt>Created on:</dt><dd>"+new Date(val.created).toUTCString().substr(0, 25)+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
        	taRow += "<dt>Last updated on:</dt><dd>"+new Date(val.last_updated).toUTCString().substr(0, 25)+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
    		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
    	
        	taRow += "<td>"+val.first_name+"</td>";
        	taRow += "<td><a onclick=\"LeadDetails('"+val.lid+"');\"  style='cursor: pointer;'>"+val.last_name+"</a></td>";
        	taRow += "<td>"+val.ltype+"</td>";
        	taRow += "<td>"+val.cur_status+"</td>";
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('"+val.lid+"','"+val.first_name+"','"+val.middle_name+"','"+val.last_name+"', \
			 '"+val.email_work+"','"+val.email_personal+"','"+val.home_ph_num+"', \
			 '"+val.work_ph_num+"','"+val.cell_ph_num+"','"+val.technology+"','"+val.ltype+"','"+val.cur_designation+"', \
			 '"+val.cur_sal+"','"+val.cur_org+"','"+val.cur_status+"','"+val.cur_emp_type+"','"+val.expected_sal+"', \
			 '"+val.gender+"','"+val.created_by+"','"+val.last_updated_by+"','"+val.marital_status+"','"+val.applied_for+"','"+val.assign_to+"','"+val.exp+"','"+val.channel+"','"+val.c_name+"','"+val.loc_constraint+"',\
			 '"+val.loc_state+"','"+val.loc_city+"');\">Edit</button></td>";
        	taRow += "<c:choose><c:when test='${tdmin.is_admin==\"1\"}'><td><button class='btn btn-danger btn-xs' onClick=\"DeleteLead('"+val.lid+"');\">Delete</button></td></c:when><c:otherwise></c:otherwise></c:choose>";
            taRow += "</tr>";   	
            console.log(taRow);
            $("#LeadsTableResult").append(taRow);
            taRow = "";
 		});
 		$('#LeadsTableResult').dataTable({            
	        "sPaginationType": "bootstrap",
	        "iDisplayLength": 10
        });
 		load();
 
	});
}

function LeadDetails(leadid){
	//alert(empid);
	$.post('details', {"lid":leadid}, function(response) {
		//alert(response);
		$('#container').html(response);
	});
}

$(document).ready(function(){
	$('.popoverOption').popover({ trigger: "hover" },10);
	fetchLeaddata();
	//LeadDetails(empid);
	$('#addleadbtn').click(function(){
		$('#addleadform')[0].reset();
		$('#addleaddiv').show();
		$('#btn-update').hide();
		$('#btn-submit').show();
	});
	$('.btn-cnl').click(function(){
		$('#addleaddiv').hide();
	});
	
	$('#addleadform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();	    
	    alert(values);
	    console.log(values);
		$.post('add', values, function(response) {
			bootbox.alert(response);
			$('#addleadform')[0].reset();
			$("#LeadsTable").empty();
		    var oTable = $('#LeadsTableResult').dataTable();
		    oTable.fnDestroy();
			fetchLeaddata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	
	$('#btn-update').click(function(e) {
		var values = $('#addleadform').serialize();
	    values += "&lid=" + encodeURIComponent($('#id').val());		
	    //alert(values);
		$.post('update', values , function(response) {
			bootbox.alert(response);
			$('#addleadform')[0].reset();
			$("#LeadsTable").empty();
		    var oTable = $('#LeadsTableResult').dataTable();
		    oTable.fnDestroy();
			fetchLeaddata();
		});		
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
});	



</script>
   
   
   
   
<jsp:include page="templates/footer.jsp"/>


