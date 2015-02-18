<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>


<!-- Main content div -->
<div class="container" id="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Clients</li>
</ol>
	<div class="panel panel-info">
	  <div class="panel-heading">
	    <h3 class="panel-title">Clients List</h3>
	  </div>
	  <div class="panel-body table-responsive" style="background-color: #F2FAFE;">
    	<table class="table table-striped table-condensed table-hover" id="ClientsTableResult" >
	      <thead>
	        <tr>
				<th>Name</th>
				<th>Emp. Manager</th>
				<th>Phone(Primary)</th>
				<th>Phone(Secondary)</th>
				<th>Email</th>
				<th>LOB</th>
				<th>Type</th>
				<th>Website</th>
				<th>Payment Term</th>
				<th>Employee ID</th>
	        </tr>
	      </thead>
	      <tbody id="ClientsTable">
	      </tbody>
	    </table>
	  </div>
	</div>
	
</div>

<script type="text/javascript">
$('#clientsli').addClass('active');

function fetchVendorsdata() {	
	$("#VendorsTable").empty();
    var oTable = $('#VendorsTableResult').dataTable();
    oTable.fnDestroy();
	
 	$.post('../client/getallclients',{}, function(json) {
 		//alert(json);
 		//console.log(json);        
 		var taRow = "";
 		//$("#EmployeesTable").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			taRow += "<tr id='"+val.id+"' >";
        	taRow += "<td>"+val.client_name+"</td>";
        	taRow += "<td>"+val.emp_manager+"</td>";
        	taRow += "<td>"+val.ph_num_primary+"</td>";	  
        	taRow += "<td>"+val.ph_num_secondary+"</td>";
        	taRow += "<td>"+val.email_addr+"</td>";
        	taRow += "<td>"+val.lob+"</td>";
        	taRow += "<td>"+val.client_type+"</td>";
        	taRow += "<td>"+val.website+"</td>";
        	taRow += "<td>"+val.payment_term+"</td>";
        	taRow += "<td><a onclick=\"EmpDetails('"+val.par_row_id+"');\"  style='cursor: pointer;text-decoration:none;'>"+val.par_row_id+"</a></td>";
            taRow += "</tr>";   	
            console.log(taRow);
            $("#ClientsTable").append(taRow);
            taRow = "";
 		});
 		$('#ClientsTableResult').dataTable({            
	        "sPaginationType": "bootstrap",
	        "iDisplayLength": 10
        });
 
	});
}
function EmpDetails(empid){
	//alert(empid);
	$.post('../employee/details', {"empid":empid}, function(response) {
		//alert(response);
		$('#container').html(response);
	});
}
$(document).ready(function(){
	fetchVendorsdata();
});
</script>


<jsp:include page="templates/footer.jsp"/>