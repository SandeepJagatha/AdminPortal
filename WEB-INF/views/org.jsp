<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<jsp:include page="templates/header.jsp"/>

<!-- Main content div -->
<div class="container" id="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Organization</li>
</ol>
<div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Organization</h3>
      </div>
      <div class="panel-body">
         <button type="button" id="addorgbtn" class="btn btn-primary btn-xs">Add</button><br><br/>
         <div id="addorgdiv" style="display: none;">
         <input type="hidden" id="oid" value="">
			<form:form class="form-horizontal" id="addorgform" role="form">
			<input type="hidden" id="createdby" name="created_by" value="${email}">
		    <input type="hidden" id="lastupdate" name="last_updated_by" value="${email}"> 
			<div class="row">	      	
			  <div class="col-xs-6">
				<div class="form-group">
					<label class="col-sm-5 control-label">Organization Name</label>
					<div class="col-sm-7">
						<input type="text" name="name" class="form-control input-sm" id="name" placeholder="organization name" required>
						<%-- <form:input path="firstname" id="firstname" /> --%>
					</div>
				</div>
			   </div>	
			  <div class="col-xs-6">
				<div class="form-group">
					<label class="col-sm-5 control-label"  style="padding:0px">Description</label>
					<div class="col-sm-7">
						<input type="text" class="form-control input-sm" name="description" id="description" placeholder="Description">
					</div>
				</div>
			  </div>
			 </div>
			 <div class="form-group">
			    <div class="col-sm-offset-3 col-sm-5">
			       <button  type="submit" class="btn btn-success btn-xs" id="btn-submit">	Submit	</button>	
					<button  type="button" class="btn btn-success btn-xs" id="btn-update" style="display:none;"> Update	</button>
					<button type="button" class="btn btn-danger btn-xs btn-cnl">	Cancel	</button>
			    </div>
			</div>	
			</form:form>
		</div>
		
         <hr>
         <table class="table table-striped">
		      <thead>
		        <tr>
					<th>Name</th>
					<th>Description</th>
					<th>Edit</th>
					<th>Delete</th>
		        </tr>
		      </thead>
		      <tbody id="UsersTable">
		          	<c:forEach items="${orgs}" var="org">
						<tr id="${org.id}" >
							<td><a onclick="Org(${org.id});"  style='cursor: pointer;'><c:out value="${org.name}"/></a></td>
							<td><c:out value="${org.description}"/></td>
							<td><button class="btn btn-warning btn-xs" onclick="fillData('${org.id}','${org.name}','${org.description}');">Edit</button></td>
							<td><button class="btn btn-danger btn-xs" onclick="DeleteOrg(${org.id});">Delete</button></td>
						</tr>
					</c:forEach>
		      </tbody>
		    </table>
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

function DeleteOrg(oid) {
	bootbox.confirm("Are you sure, you want to delete?", function(result) {
		if(result==true){
			//console.log(tid);
		 	$.post('delete', {"oid":oid}, function(response) {
				alert(response);
				fetchOrgdata();
				$('#addorgdiv').hide();
			}); 
		}
	}); 
	
}

function fillData(id, name, desc)
{
	$('#addorgdiv').show();
	$('#btn-submit').hide();
	$('#btn-update').show();
    
    admin_user_pk = id;
    $("#oid").val(id);
    $("#name").val(name);
    $("#description").val(desc);
	$("html, body").animate({ scrollTop: 0 }, "slow");
}

function fetchOrgdata() {
 	$.get('fetch', function(json) {
 		//alert(json);
 		//console.log(json);
 		
 		var taRow = "";
 		$("#UsersTable").html("");
 		$.each(json, function(i, val) {
 			//console.log(val.id);
 			taRow += "<tr id='"+val.id+"' >";
        	taRow += "<td><a onclick=\"Org('"+val.id+"');\"  style='cursor: pointer;'>"+val.name+"</a></td>";
        	taRow += "<td>"+val.description+"</td>";
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('"+val.id+"','"+val.name+"','"+val.description+"');\">Edit</button></td>";
        	taRow += "<td><button class='btn btn-danger btn-xs' onClick=\"DeleteOrg('"+val.id+"');\">Delete</button></td>";
            taRow += "</tr>";   	
            //console.log(taRow);
            $("#UsersTable").append(taRow);
            taRow = "";
 		});
	});
}

$(document).ready(function(){
	
	$('#addorgbtn').click(function(){
		$('#btn-submit').show();
		$('#btn-update').hide();
		$('#addorgdiv').show();
	});
	$('.btn-cnl').click(function(){
		$('#addorgdiv').hide();
	});
	
	
	$('#addorgform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		 var values = $(this).serialize();
		$.post('add', values, function(response) {
			bootbox.alert(response);
			$('#addorgform')[0].reset();
			fetchOrgdata();
			$('#addorgdiv').hide();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	
	$('#btn-update').click(function(e) {
		 var values = $('#addorgform').serialize();
	     var oid = $("#oid").val();
        values += "&id=" + encodeURIComponent(oid);
         
		//alert(values); 
		$.post('update', values , function(response) {
			bootbox.alert(response);
			$('#addorgform')[0].reset();
			fetchOrgdata();
			$('#addorgdiv').hide();
		});		
		e.preventDefault(); // prevent actual form submit and page reload
	});
});	



</script>



<jsp:include page="templates/footer.jsp"/>