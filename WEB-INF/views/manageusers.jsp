<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>

<!-- Main content div -->
<div class="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Admin Users</li>
</ol>
	<div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Manage Users</h3>
      </div>
      <div class="panel-body">
         <button type="button" id="adduserbtn" class="btn btn-primary btn-xs">Add</button><br><br/>
         <div id="adduserdiv" style="display: none;">
			<form:form class="form-inline" id="addtadminform" role="form">
			<%-- <form:form id="newUserForm"> --%>
				<div class="form-group">
					<label class="col-sm-4 control-label">First Name</label>
					<div class="col-sm-8">
						<input type="text" name="firstname" class="form-control" id="firstname" placeholder="first name" required>
						<%-- <form:input path="firstname" id="firstname" /> --%>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">Last Name</label>
					<div class="col-sm-8">
						<input type="text" name="lastname" class="form-control" id="lastname" placeholder="last name" required>
						<%-- <form:input path="lastname" id="lastname" class="form-control"  placeholder="last name"/> --%>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">Email</label>
					<div class="col-sm-8">
						<input type="email" name="email" id="email" class="form-control"  placeholder="Email" required>
						<%-- <form:input type="email" path="email" id="email" class="form-control"  placeholder="Email" /> --%>
					</div>
				</div><br/><br/>
				<div class="form-group">
					<label class="col-sm-4 control-label">Password</label>
					<div class="col-sm-8">
						<input type="password" class="form-control" id="password" placeholder="Password" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label" style="padding:0px;">Confirm Password</label>
					<div class="col-sm-7">
						<input type="password" class="form-control" name="password" id="inputPasswordc" placeholder="Confirm Password" required>						
						 <%-- <form:input type="password" class="form-control" id="password" path="password" placeholder="Password" /> --%> 
						<p id="pCheckPasswordMatch"></p>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label"  style="padding:0px">Phone number</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="cell_ph_num" id="ph_num" placeholder="(000) 000-0000">
						<%-- <form:input type="text" class="form-control" path="cell_ph_num" id="ph_num" placeholder="(000) 000-0000"/> --%>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-7 control-label">Admin</label>
					<div class="col-sm-4">
						 <input type="checkbox" name="is_admin" id="is_admin" value="0">
						 <%-- <form:input type="checkbox" path="is_admin" id="is_admin"/> --%>
					</div>
				</div><br/><br/>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">
						<button  type="submit" class="btn btn-success btn-xs" id="btn-submit">	Submit	</button>		
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-7">
						<button type="button" class="btn btn-danger btn-xs btn-cnl">	Cancel	</button>
					</div>
				</div>
			</form:form>
		</div>
		
		<div id="updateuserdiv" style="display: none;">			
			<form class="form-inline" id="updatetadminform" role="form">
				<input type="hidden" name="id" id="eid">
				<div class="form-group">
					<label class="col-sm-4 control-label">First Name</label>
					<div class="col-sm-8">
						<input type="text" name="firstname" class="form-control" id="ufirstname" placeholder="first name" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">Last Name</label>
					<div class="col-sm-8">
						<input type="text" name="lastname" class="form-control" id="ulastname" placeholder="last name" required>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-4 control-label">Email</label>
					<div class="col-sm-8">
						<input type="email" name="email" id="uemail" class="form-control"  placeholder="Email" required>
					</div>
				</div><br/><br/>
				<div class="form-group">
					<label class="col-sm-4 control-label"  style="padding:0px">Phone number</label>
					<div class="col-sm-7">
						<input type="text" class="form-control" name="cell_ph_num" id="uph_num" placeholder="(000) 000-0000">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-7 control-label">Admin</label>
					<div class="col-sm-4">
						 <input type="checkbox" name="is_admin" id="uis_admin"> 
					</div>
				</div><br/><br/>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-8">	
						<button type="submit" class="btn btn-success btn-xs">Update </button>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-7">
						<button type="button" class="btn btn-danger btn-xs btn-cnl">Cancel</button>
					</div>
				</div>
			</form>
			
			

         </div>
         <hr>
         <table class="table table-striped">
		      <thead>
		        <tr>
					<th>firstname</th>
					<th>lastname</th>
		          	<th>email</th>
					<th>Admin</th>
					<th>Phone Number</th>
					<th>Edit</th>
					<th>Delete</th>
		        </tr>
		      </thead>
		      <tbody id="UsersTable">
		          	<c:forEach items="${tdmins}" var="tdmin">
						<tr id="${tdmin.id}" >
							<td><c:out value="${tdmin.firstname}"/></td>
							<td><c:out value="${tdmin.lastname}"/></td>
							<td><c:out value="${tdmin.email}"/></td>
							<td>
								<c:choose>
						            <c:when test="${tdmin.is_admin=='1'}">
						                Yes
						            </c:when>
						            <c:otherwise>
						                No
						            </c:otherwise>
						        </c:choose>
							</td>							
							<td><c:out value="${tdmin.cell_ph_num}"/></td>
							<td><button class="btn btn-warning btn-xs" onclick="fillData('${tdmin.id}','${tdmin.firstname}','${tdmin.lastname}','${tdmin.email}','${tdmin.cell_ph_num}','${tdmin.is_admin}');">Edit</button></td>
							<td><button class="btn btn-danger btn-xs" onclick="DeleteUser(${tdmin.id});">Delete</button></td>
						</tr>
					</c:forEach>
		      </tbody>
		    </table>
      </div>
    </div>

</div>



<script type="text/javascript">
$('#adminli').addClass('active');

function checkPasswordMatch() {
    var password = $("#password").val();
    var confirmPassword = $("#inputPasswordc").val();

    if (password != confirmPassword)
        $("#pCheckPasswordMatch").html("Passwords do not match!");
    else
        $("#pCheckPasswordMatch").html("Passwords match.");
}

function DeleteUser(tid) {
	bootbox.confirm("Are you sure, you want to delete?", function(result) {
		if(result==true){
			//console.log(tid);
		 	$.post('delete', {"tid":tid}, function(response) {
				alert(response);
				fetchUserdata();
			}); 
		}
	}); 
	
}

function fillData(id, fname, lname, email, phnum, admin_flag)
{
	$('#adduserdiv').hide();
    $("#updateuserdiv").show();
    
    admin_user_pk = id;
    $("#eid").val(id);
    $("#ufirstname").val(fname);
    $("#ulastname").val(lname);
    $("#uemail").val(email);
    $("#uph_num").val(phnum);
    if(admin_flag==1)
    {
    	$("#uis_admin").prop('checked', true); 
    	$('#uis_admin').val('1');
    }
    else
    {
    	$("#uis_admin").prop('checked', false); 
    	$('#uis_admin').val('0');
    }                 

	$("html, body").animate({ scrollTop: 0 }, "slow");
}

/* function EditUser(tid) {
	console.log(tid);
 	$.post('edit', {"tid":tid}, function(response) {
		alert(response);
	});
} */

function fetchUserdata() {
 	$.get('fetch', function(json) {
 		//alert(json);
 		console.log(json);
        /* var json = $.parseJSON(response);
 		console.log(json);  */
        
 		var taRow = "";
 		$("#UsersTable").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			taRow += "<tr id='"+val.id+"' >";
        	taRow += "<td>"+val.firstname+"</td>";
        	taRow += "<td>"+val.lastname+"</td>";
        	taRow += "<td>"+val.email+"</td>";
        	if(val.is_admin=='1'){
        		taRow += "<td>Yes</td>";
        	}
        	else{
        		taRow += "<td>No</td>";
        	}
        	taRow += "<td>"+val.cell_ph_num+"</td>";
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('"+val.id+"','"+val.firstname+"','"+val.lastname+"','"+val.email+"','"+val.cell_ph_num+"','"+val.is_admin+"');\">Edit</button></td>";
        	taRow += "<td><button class='btn btn-danger btn-xs' onClick=\"DeleteUser('"+val.id+"');\">Delete</button></td>";
            taRow += "</tr>";   	
            console.log(taRow);
            $("#UsersTable").append(taRow);
            taRow = "";
 		});
	});
}

$(document).ready(function(){
	$('#adminli').addClass('active');
	$("#inputPasswordc").keyup(checkPasswordMatch);
	
	$('#adduserbtn').click(function(){
		$('#adduserdiv').show();
		$("#updateuserdiv").hide();
	});
	$('.btn-cnl').click(function(){
		$('#adduserdiv').hide();
		$('#updateuserdiv').hide();
	});
	
	$('#is_admin').change(function(){
		if($(this).is(':checked')){
	          $(this).val('1');
	     }else{
	          $(this).val('0');
	     }
		//alert($(this).val());
	 });
	$('#uis_admin').change(function(){
		if($(this).is(':checked')){
			 $(this).val('1');
	     }else{
	          $(this).val('0');
	     }
		//alert($(this).val());
	 });
	
	$('#addtadminform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		 var values = $(this).serialize();
	     var admin_checked = $("#is_admin").is(':checked');
	     if(!admin_checked)
        {
        	is_admin = 0;
        	values += "&is_admin=" + encodeURIComponent(is_admin);
        }
		$.post('add', values, function(response) {
			alert(response);
			$('#addtadminform')[0].reset();
			fetchUserdata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	
	$('#updatetadminform').submit(function(e) {
		 var values = $(this).serialize();
	     var admin_checked = $("#uis_admin").is(':checked');
	     if(!admin_checked){
        	is_admin = 0;
        	values += "&is_admin=" + encodeURIComponent(is_admin);
         }
		//alert(values); 
		$.post('update', values , function(response) {
			alert(response);
			$('#addtadminform')[0].reset();
			fetchUserdata();
		});		
		e.preventDefault(); // prevent actual form submit and page reload
	});
});	



</script>


<jsp:include page="templates/footer.jsp"/>