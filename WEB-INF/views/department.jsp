<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%-- <link rel="stylesheet" href="<c:url value="/resources/assets/css/ace.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/assets/font/font-awesome.min.css" />" /> --%>

<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li><a href="../org/view">Organization</a></li>
  <li><a  onclick="Org(${division.org_id});" style='cursor: pointer;'> Division</a></li>
  <li class="active">${division.name} Division Details</li>
</ol>

<div class="panel panel-success">
	<div class="panel-heading"> ${division.name} Details  <a href="#" id="example" rel="popover" tabindex="0" data-placement="bottom" style="float:right;" class="popoverOption"  data-content="
				<div>
					<dl>
					  <dt>Created on:</dt><dd>${division.created}</dd>
					  <dt>Created by:</dt><dd>${division.created_by}</dd>
					  <dt>Last updated on:</dt><dd>${division.last_updated}</dd>
					  <dt>Last updated by:</dt><dd>${division.last_updated_by}</dd>
					</dl>
				</div>"
			data-html="true" data-original-title="Created/Updated Details"><i class='icon-info-sign'></i></a></div>
	<div class="panel-body">
		
		<div class="row">
			<div class="col-xs-4">
				<dl class="dl-horizontal">
					<dt>Division Name:</dt><dd>${division.name}</dd>
				</dl>
			</div>
			<div class="col-xs-4">
				<dl class="dl-horizontal">		
					<dt>Description:</dt><dd>${division.description}</dd>	
				</dl>		
			</div>
			<div class="col-xs-4">
				<dl class="dl-horizontal">		
					<dt>Organization:</dt><dd>${org.name}</dd>	
				</dl>		
			</div>
			
			
		</div>
			
		<hr>
		<div id="department" class="tab-pane active"> 
			<div style="padding:5px;">
				<button class="btn btn-xs btn-primary" type="button" id="addDeptBtn">Add</button>
				<div id="divadddepartment" style="display:none;">
					<input type="hidden" id="departmentid" name="departmentid" value="">
			      	<form class="form-horizontal" id="departmentform">
					<input type="hidden" id="divid" name="div_id" value="${division.id}">
			      	<input type="hidden" id="createdby" name="created_by" value="${email}">
			      	<input type="hidden" id="lastupdate" name="last_updated_by" value="${email}">
				      	<div class="row">	      	
						  <div class="col-xs-6">
							  <div class="form-group">
							    <label class="col-xs-4 control-label">Department Name</label>
							    <div class="col-md-8">
							      <input type="text" class="form-control input-sm" id="name" name="name" placeholder="Department Name" maxlength="100"  required>
							    </div>
							  </div>
							  
						  </div>		
						  <div class="col-xs-6">
						  <div class="form-group">
							    <label class="col-xs-4 control-label">Description</label>
							    <div class="col-md-8">
							      <input type="text" class="form-control input-sm" id="description" name="description" maxlength="100" placeholder="Description" >
							    </div>
							  </div>
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
				<hr>
		         <table class="table table-striped">
				      <thead>
				        <tr>
							<th>&nbsp;</th>
							<th>Name</th>
							<th>Description</th>
							<th>Edit</th>
							<th>Delete</th>
				        </tr>
				      </thead>
				      <tbody id="departmentTable">
				          	 <c:forEach items="${departments}" var="department">
								<tr id="${department.id}" >
									<td><a class='popoverOption' style="text-decoration: none;" href='#' data-content='<div><dl>
										  <dt>Created on:</dt><dd>${department.created}</dd>
										  <dt>Created by:</dt><dd>${department.created_by}</dd>
										  <dt>Last updated on:</dt><dd>${department.last_updated}</dd>
										  <dt>Last updated by:</dt><dd>${department.last_updated_by}</dd>
										</dl></div>' rel='popover' data-placement='top' data-html="true" data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>
									<td><a onclick="DepartmentDetails(${department.id});"  style='cursor: pointer;'><c:out value="${department.name}"/></a></td>
									<td><c:out value="${department.description}"/></td>
									<td><button class="btn btn-warning btn-xs" onclick="fillData('${department.id}','${department.name}','${department.description}','${department.div_id}','${department.created_by}');"><i class="icon-edit-sign"></i></button></td>
									<td><button class="btn btn-danger btn-xs" onclick="DeleteDepartment(${department.id});"><i class="icon-remove-sign"></i></button></td>										
								</tr>
							</c:forEach> 
				      </tbody>
				    </table>
			</div>
		
		</div>
		
	</div>
</div>

<script type="text/javascript">
function Org(oid){
	$.post('details', {"oid":oid}, function(response) {
		//alert(response);
		$('#container').html(response);
	});
}


function DepartmentDetails(did){
	//window.location.replace("../tdmin/index");
	$.post('../department/details', {"did":did}, function(response) {		
		//alert(response);
		$('#container').html(response);
	}); 
}

function fetchdepartmentdata() {
	did = $('#divid').val();
 	$.post('../department/fetch',{did:did}, function(json) {
 		//console.log(json);        
 		var taRow = "";
 		$("#departmentTable").html("");
 		$.each(json, function(i, val) {
 			//console.log(val.id);
 			taRow += "<tr id="+val.id+">";
        	taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
	        	taRow += "<div><dl><dt>Created on:</dt><dd>"+val.created+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	        	taRow += "<dt>Last updated on:</dt><dd>"+val.last_updated+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
        		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
        	taRow += "<td><a onclick=\"DepartmentDetails('"+val.id+"');\"  style='cursor: pointer;'>"+val.name+"</td>";
        	taRow += "<td>"+val.description+"</td>";
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('"+val.id+"','"+val.name+"','"+val.description+"','"+val.div_id+"', '"+val.created_by+"');\"><i class='icon-edit-sign'></i></button></td>";
        	taRow += "<td><button class='btn btn-danger btn-xs' onClick=\"DeleteDepartment('"+val.id+"');\"><i class='icon-remove-sign'></i></button></td>";
            taRow += "</tr>";   		
           // console.log(taRow);
            $("#departmentTable").append(taRow);
            taRow = "";
 		});
 		load()
	});
}

function DeleteDepartment(did){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('../department/delete',{did:did}, function(response){	
				bootbox.alert(response);
				$('#departmentform')[0].reset();
				$('#divadddepartment').hide();
				fetchdepartmentdata();
			});
		}

		load()
	}); 
}

function fillData(id, name, desc, divid, createdby){
	$('#divadddepartment').show();
	$('#btn-submit').hide();
	$('#btn-update').show();
	
	$("#departmentid").val(id);
    $('#divid').val(divid);
    $("#createdby").val(createdby);
    $("#name").val(name);
    $("#description").val(desc);

	$("html, body").animate({ scrollTop: 1000 }, "slow");
	
}

function load(){
	$('.popoverOption').popover({ trigger: "hover" },10);
	
	$(".flip").hover(function(){
	  $(this).find(".card").toggleClass("flipped");
	  return false;
	});
}


$(document).ready(function(){

	$('#addDeptBtn').click(function(){
		//$('#addadrform')[0].reset();	
		$('#departmentform')[0].reset();
		$('#divadddepartment').fadeIn("slow");
		$('#btn-update').hide("slow");
		$('#btn-submit').show("slow");
	});
	$('.btn-cnl').click(function(){
		$('#divadddepartment').fadeOut("slow");
	});
	
	
	
	$('#departmentform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();	   
	    //alert(values);	    
		$.post('../department/add', values, function(response) {
			bootbox.alert(response);
			$('#departmentform')[0].reset();
			$('#divadddepartment').fadeOut("slow");
			fetchdepartmentdata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	
	$('#btn-update').click(function(e) {
		var values = $('#departmentform').serialize();		 
	    values += "&id=" + encodeURIComponent($('#departmentid').val());	
		//alert(values); 
		$.post('../department/update', values , function(response) {
			bootbox.alert(response);
			$('#departmentform')[0].reset();
			$('#divadddepartment').fadeOut("slow");
			fetchdepartmentdata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$(function () {
	  $('[data-toggle="popover"]').popover()
	});
	
	$(function(){
	    // pop up .popover-test
	    $('.popover-test').popover();    	        
	    // pop up #example1, #example2, #example3 with same content
	    $('[rel=popover]').popover({ 
	        html : true, 
	        content: function() {
	          return $('#popover_content_wrapper').html();
	        }
	    });

	});
	
	
	$('.popoverOption').popover({ trigger: "hover" },10);
	
	$(".flip").hover(function(){
	  $(this).find(".card").toggleClass("flipped");
	  return false;
	});
	
});

</script>
