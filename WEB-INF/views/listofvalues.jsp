<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>

<!-- Main content div -->
<div class="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Settings</li>
</ol>
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title"><strong>Settings</strong></h3>
	</div>
	<div class="panel-body">
		
		<div class="well text-left col-md-12" id="div-reg" style="padding-bottom: 0px;">
			<legend> List Of Values Settings</legend>			
			<span class="help-block">Change <strong>email template</strong> and change email setting to send students <strong>email notifications</strong> on confirmation.</span><br>
			<input type="hidden" id="id" value="">
			<form class="form-horizontal" id="addlistform">
	      	<input type="hidden" id="createdby" name="created_by" value="${tdmin.email}">
	      	<input type="hidden" id="lastupdate" name="last_updated_by" value="${tdmin.email}">
				 <div class="col-xs-6 col-md-4">
					  <div class="form-group">
					    <label class="col-xs-4 control-label">List Type</label>
					    <div class="col-md-8">
					      <select class="form-control input-sm" id="list_type" name="list_type" required>
							  <option value="LEAD_TYPE">LEAD_TYPE</option>
							  <option value="ADDRESS_TYPE">ADDRESS_TYPE</option>
							  <option value="LEAD_CUR_STATUS">LEAD_CUR_STATUS</option>
							  <option value="ACTIVITY_TYPE">ACTIVITY_TYPE</option>
							  <option value="ACTIVITY_STATUS">ACTIVITY_STATUS</option>
							</select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">List Value</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="list_value" name="list_value" placeholder="List Value" required>
					    </div>
					  </div>
				</div>
				 <div class="col-xs-6 col-md-4">
					  <div class="form-group">
					    <label class="col-xs-4 control-label">List Sequence</label>
					    <div class="col-md-8">
					      <input type="number" class="form-control input-sm" id="list_seq" name="list_seq" placeholder="List Sequence" required>
					    </div>
					  </div>					  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Active Flag</label>
					    <div class="col-md-8">
						  <input type="checkbox" name="active_flag" id="active_flag" value="0">
					    </div>
					  </div>
				</div>
				 <div class="col-xs-6 col-md-4">
					  <div class="form-group">
					    <label class="col-xs-4 control-label">List Sub-Value</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control input-sm" id="list_subvalue" name="list_subvalue" placeholder="List Sub-Value">
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
         <table class="table table-striped table-condensed" id="ListTableResult" >
		      <thead>
		        <tr>
		        	<th>&nbsp;</th>
					<th>List Type</th>
					<th>List Value</th>
					<th>List Sequence</th>
					<th>List Sub-value</th>
					<th>Active</th>
					<th>Edit</th>
					<c:choose><c:when test="${tdmin.is_admin =='1'}"><th>Delete</th></c:when> <c:otherwise></c:otherwise></c:choose>
		        </tr>
		      </thead>
		      <tbody id="ListTable">
		      </tbody>
		    </table>
	</div>
</div>
<script type="text/javascript">
function fetchdata() {
	
	$("#ListTable").empty();
    var oTable = $('#ListTableResult').dataTable();
    oTable.fnDestroy();
	
 	$.post('../settings/fetch', function(json) {
 		var taRow = "";
 		$.each(json, function(i, val) {
 			taRow += "<tr id='"+val.id+"' >";
 			taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
	        	taRow += "<div><dl><dt>Created on:</dt><dd>"+val.created+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	        	taRow += "<dt>Last updated on:</dt><dd>"+val.last_updated+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
	    		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
        	taRow += "<td>"+val.list_type+"</td>";
        	taRow += "<td>"+val.list_value+"</td>";
        	taRow += "<td>"+val.list_seq+"</td>";
        	taRow += "<td>"+val.list_subvalue+"</td>";	
        	if(val.active_flag==1){
        		taRow += "<td>Yes</td>";
        	}else{
        		taRow += "<td>No</td>";
        	}
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('"+val.id+"','"+val.list_type+"','"+val.list_value+"','"+val.list_seq+"', \
        			 '"+val.list_subvalue+"','"+val.active_flag+"');\">Edit</button></td>";
        	taRow += "<c:choose><c:when test='${tdmin.is_admin==\"1\"}'><td><button class='btn btn-danger btn-xs' onClick=\"DeleteList('"+val.id+"');\">Delete</button></td></c:when><c:otherwise></c:otherwise></c:choose>";
            taRow += "</tr>";   
            $("#ListTableResult").append(taRow);
            taRow = "";
 		});
 		$('#ListTableResult').dataTable({            
	        "sPaginationType": "bootstrap",
	        "iDisplayLength": 10
        });
 		load()
	});
}

function fillData(id, ltype, lvalue, lseq, lsubvalue, activeflag)
{
	$('#btn-submit').hide();
    $("#btn-update").show();
    
    admin_user_pk = id;
    $("#id").val(id);
    $("#list_type").prop('disabled', true);
    $("#list_type").val(ltype);
    $("#list_value").val(lvalue);
    $("#list_seq").val(lseq);
    $("#list_subvalue").val(lsubvalue);
    if(activeflag==1)
    {
    	$("#active_flag").prop('checked', true); 
    	$('#active_flag').val('1');
    }
    else
    {
    	$("#active_flag").prop('checked', false); 
    	$('#active_flag').val('0');
    }                 

	$("html, body").animate({ scrollTop: 0 }, "slow");
}
function DeleteList(id) {
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('delete', {"id":id}, function(response) {
				bootbox.alert(response);
				$('#btn-submit').show();
			    $("#btn-update").hide();
				$('#addlistform')[0].reset();
				$("#ListTable").empty();
			    var oTable = $('#ListTableResult').dataTable();
			    oTable.fnDestroy();
				fetchdata();
			}); 
	 		load()
		}
	}); 
}
function load(){
	$('.popoverOption').popover({ trigger: "hover" },10);
}

$(document).ready(function(){
	$('#adminli').addClass('active');
	fetchdata();
	$('.popoverOption').popover({ trigger: "hover" },10);
	$('#active_flag').change(function(){
		if($(this).is(':checked')){
	          $(this).val('1');
	     }else{
	          $(this).val('0');
	     }
	 });

	$('.btn-cnl').click(function(){
	    $("#list_type").prop('disabled', false);
		$('#btn-submit').show();
	    $("#btn-update").hide();
		$('#addlistform')[0].reset();
	});
	$('#addlistform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();
	    var active_checked = $("#active_flag").is(':checked');
	    if(!active_checked)
        {
	    	active_flag = 0;
        	values += "&active_flag=" + encodeURIComponent(active_flag);
        }
	    //alert(values);
		$.post('add', values, function(response) {
			bootbox.alert(response);
			if(response=="Added ListOfValues successfully"){
				$('#addlistform')[0].reset();
				$("#ListTable").empty();
			    var oTable = $('#ListTableResult').dataTable();
			    oTable.fnDestroy();
				fetchdata();
			}
		});
 		load()
		e.preventDefault(); // prevent actual form submit and page reload
	});

	$('#btn-update').click(function(e) {
		 var values = $('#addlistform').serialize();
	     var active_checked = $("#active_flag").is(':checked');
	     if(!active_checked){
	    	 active_flag = 0;
        	values += "&active_flag=" + encodeURIComponent(active_flag);
         }
	     values += "&id=" + encodeURIComponent($('#id').val());
		alert(values); 
		$.post('update', values , function(response) {
			alert(response);
			if(response=="Updated List successfully"){
			    $("#list_type").prop('disabled', false);
				$('#btn-submit').show();
			    $("#btn-update").hide();
				$('#addlistform')[0].reset();
				$("#ListTable").empty();
			    var oTable = $('#ListTableResult').dataTable();
			    oTable.fnDestroy();
				fetchdata();
			}
		});		
		e.preventDefault(); // prevent actual form submit and page reload
	});
});
</script>
</div>
<jsp:include page="templates/footer.jsp"/>