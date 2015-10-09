<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>

		<%-- <link rel="stylesheet" href="<c:url value="/resources/assets/css/ace.min.css" />" /> --%>


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
	$('#empli').addClass('active');
</script>


<!-- Main content div -->
<div class="container" id="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Employees</li>
</ol>
	<div class="panel panel-info">
      <div class="panel-heading">
        <h3 class="panel-title">Add Employee</h3>
      </div>
      <div class="panel-body container-fluid">
      	<button type="button" id="addempbtn" class="btn btn-primary btn-xs">Add Employee</button><br><br/>
        <div id="addempdiv" style="display: none;">        	
	      	<input type="hidden" id="id" name="id" value="">
	      	<form class="form-horizontal" id="addempform">
	      	<input type="hidden" id="createdby" name="created_by" value="${tdmin.email}">
	      	<input type="hidden" id="lastupdate" name="last_updated_by" value="${tdmin.email}">
		      	<div class="row">	      	
				  <div class="col-xs-6 col-md-4">
					  <div class="form-group">
					    <label class="col-xs-4 control-label">First Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="fname" name="first_name" placeholder="First Name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Middle Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="mname" name="middle_name" placeholder="Middle Name">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Last Name</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="lname" name="last_name" placeholder="Last Name" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Job Title</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="jobt" name="job_title" placeholder="Job Title" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Email(Work)</label>
					    <div class="col-md-8">
					      <input type="email" class="form-control" id="emailw" name="email_work" placeholder="Email(Work)">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Email(Personal)</label>
					    <div class="col-md-8">
					      <input type="email" class="form-control" id="emailp" name="email_personal" placeholder="Email(Personal)">
					    </div>
					  </div>
				  </div>			  
				  <div class="col-xs-6 col-md-4">
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Phone Num.</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="phhome" name="home_ph_num" placeholder="Home">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Phone Num.</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="workph" name="work_ph_num" placeholder="Work">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Phone Num.</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="cellph" name="cell_ph_num" placeholder="Cell">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">SSN</label>
					    <div class="col-md-8">
					      <input type="number" class="form-control" id="ssn" name="SSN" placeholder="SSN" max="999999999" required>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Date of Birth</label>
					    <div class="col-md-8">
					      <div class="input-group date datePicker" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" id="dob" type="text" placeholder="yyyy-mm-dd" name="DOB" value="" required>
							<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						  </div>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Date of Joining</label>
					    <div class="col-md-8">
					      <div class="input-group date datePicker" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" id="dateofjoin" type="text" placeholder="yyyy-mm-dd" name="date_of_joining" value="" required>
							<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						  </div>
					    </div>
					  </div>
				  </div>
				  <div class="col-xs-6 col-md-4">
				  	 <div class="form-group">
					    <label class="col-xs-4 control-label">Date of Ending</label>
					    <div class="col-md-8">
					      <div class="input-group date datePicker" data-date-format="yyyy-mm-dd" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
							<input class="form-control" size="16" id="dateofend" type="text" placeholder="yyyy-mm-dd" name="date_of_ending" value="">
							<span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
							<span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
						  </div>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Country of Birth</label>
					    <div class="col-md-8">
					      <input type="text" class="form-control" id="cob" name="country_of_birth" placeholder="Country of Birth" required>
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Status</label>
					    <div class="col-md-8">
					    	<select class="form-control" id="status" name="emp_status">
							  <option value="H1B">H1B</option>
							  <option value="EAD">EAD</option>
							  <option value="OPT">OPT</option>
							  <option value="GC">GC</option>
							  <option value="Citizen">Citizen</option>
							  <option value="F1">F1</option>
							  <option value="H4">H4</option>
							  <option value="L2">L2</option>
							  <option value="TN">TN</option>
							</select>
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Active</label>
					    <div class="col-md-8" style="margin-top: 6px;">
					      <input type="checkbox" name="active_flag" id="active_flag" value="0">
					    </div>
					  </div>
					  <div class="form-group">
					    <label class="col-xs-4 control-label">Terminated</label>
					    <div class="col-md-8" style="margin-top: 6px;">
					      <input type="checkbox" name="terminated_flag" id="terminated_flag" value="0">
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
		<div class="dataTables_wrapper">
         <table class="table table-striped table-condensed" id="EmployeesTableResult" >
		      <thead>
		        <tr>
					<th>first Name</th>
					<th>last Name</th>
					<th>Job Title</th>
					<th>Status</th>
					<th>Employee ID</th>
					<th>Active</th>
					<th>Edit</th>
					<c:choose><c:when test="${tdmin.is_admin =='1'}"><th>Delete</th></c:when> <c:otherwise></c:otherwise></c:choose>
		        </tr>
		      </thead>
		      <tbody id="EmployeesTable">
		          	 <%-- <c:forEach items="${employees}" var="employee">
						<tr id="${employee.id}" >
							<td><c:out value="${employee.first_name}"/></td>
							<td><a onclick="EmpDetails('${employee.eid}');"  style="cursor: pointer;"><c:out value="${employee.last_name}"/></a></td>
							<td><c:out value="${employee.job_title}"/></td>
							<td><c:out value="${employee.emp_status}"/></td>
							<td><button class="btn btn-warning btn-xs" onclick="fillData('${employee.id}','${employee.first_name}','${employee.middle_name}',
							'${employee.last_name}','${employee.job_title}','${employee.email_work}','${employee.email_personal}',
							'${employee.home_ph_num}','${employee.work_ph_num}','${employee.cell_ph_num}','${employee.SSN}',
							'${employee.DOB}','${employee.date_of_joining}','${employee.date_of_ending}','${employee.country_of_birth}',
							'${employee.emp_status}','${employee.active_flag}','${employee.terminated_flag}','${employee.created_by}',
							'${tdmin.email}');">Edit</button></td>
							<td><button class="btn btn-danger btn-xs" onclick="DeleteEmp(${employee.id});">Delete</button></td>
						</tr>
					</c:forEach>  --%>
		      </tbody>
		    </table>
		  </div>
      </div>
   </div>
   
   
        < script type = "text/javascript" >
        function DeleteEmp(id) {
        bootbox.confirm("Are you sure?", function(result) {
        if (result == true){
        $.post('delete', {"id":id}, function(response) {
        bootbox.alert(response);
                $("#EmployeesTable").empty();
                var oTable = $('#EmployeesTableResult').dataTable();
                oTable.fnDestroy();
                fetchEmpdata();
        });
        }
        });
                }

function fillData(id, fname, mname, lname, jobtitle, emailwork, emailper, homeph, workph, cellph, ssn, dob, datejoin, dateend, cob, status, activeflag, termflag, createdby, lupdatedby)
        {
        $('#addempdiv').show();
                $('#btn-submit').hide();
                $('#btn-update').show();
                $("#id").val(id);
                $("#createdby").val(createdby);
                $("#last_updated_by").val(lupdatedby);
                $("#fname").val(fname);
                $("#mname").val(mname);
                $("#lname").val(lname);
                $("#jobt").val(jobtitle);
                $("#emailw").val(emailwork);
                $("#emailp").val(emailper);
                $("#phhome").val(homeph);
                $("#workph").val(workph);
                $("#cellph").val(cellph);
                $("#ssn").val(ssn);
                $("#dob").val(dob);
                $("#dateofjoin").val(datejoin);
                $("#dateofend").val(dateend);
                $("#cob").val(cob);
                $("#status").val(status);
                if (activeflag == 1)
        {
        $("#active_flag").prop('checked', true);
                $('#active_flag').val('1');
        }
        else
        {
        $("#active_flag").prop('checked', false);
                $('#active_flag').val('0');
        }

        if (termflag == 1)
        {
        $("#terminated_flag").prop('checked', true);
                $('#terminated_flag').val('1');
        }
        else
        {
        $("#terminated_flag").prop('checked', false);
                $('#terminated_flag').val('0');
        }
        //$('#addempform').append("<input type='hidden' name='id' value='"+id+"'/>");

        $("html, body").animate({ scrollTop: 0 }, "slow");
                }

function fetchEmpdata() {

$("#EmployeesTable").empty();
        var oTable = $('#EmployeesTableResult').dataTable();
        oTable.fnDestroy();
        $.post('../employee/fetch', function(json) {
        //alert(json);
        //console.log(json);        
        var taRow = "";
                //$("#EmployeesTable").html("");
                $.each(json, function(i, val) {
                console.log(val.id);
                        taRow += "<tr id='" + val.eid + "' >";
                        taRow += "<td>" + val.first_name + "</td>";
                        taRow += "<td><a onclick=\"EmpDetails('" + val.eid + "');\"  style='cursor: pointer;'>" + val.last_name + "</a></td>";
                        taRow += "<td>" + val.job_title + "</td>";
                        taRow += "<td>" + val.emp_status + "</td>";
                        taRow += "<td>" + val.eid + "</td>";
                        if (val.active_flag == 1){
                taRow += "<td>Yes</td>";
                } else{
                taRow += "<td>No</td>";
                }
                taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('" + val.eid + "','" + val.first_name + "','" + val.middle_name + "','" + val.last_name + "', \
        			 '" + val.job_title + "','" + val.email_work + "','" + val.email_personal + "','" + val.home_ph_num + "', \
        			 '" + val.work_ph_num + "','" + val.cell_ph_num + "','" + val.ssn + "','" + val.dob + "','" + val.date_of_joining + "', \
        			 '" + val.date_of_ending + "','" + val.country_of_birth + "','" + val.emp_status + "','" + val.active_flag + "','" + val.terminated_flag + "', \
        			 '" + val.created_by + "','" + val.last_updated_by + "','" + val.eid + "');\">Edit</button></td>";
                        taRow += "<c:choose><c:when test='${tdmin.is_admin==\"1\"}'><td><button class='btn btn-danger btn-xs' onClick=\"DeleteEmp('" + val.eid + "');\">Delete</button></td></c:when><c:otherwise></c:otherwise></c:choose>";
                        taRow += "</tr>";
                        console.log(taRow);
                        $("#EmployeesTableResult").append(taRow);
                        taRow = "";
                });
                $('#EmployeesTableResult').dataTable({
        "sPaginationType": "bootstrap",
                "iDisplayLength": 10
        });
        });
        }

function EmpDetails(empid){
//alert(empid);
$.post('details', {"empid":empid}, function(response) {
    //alert(response);
    $('#container').html(response);
});
        }

$(document).ready(function(){
    fetchEmpdata();
    //EmpDetails(empid);
    $('#addempbtn').click(function(){
        $('#addempform')[0].reset();
        $('#addempdiv').show();
        $('#btn-update').hide();
        $('#btn-submit').show();
    });
    $('.btn-cnl').click(function(){
        $('#addempdiv').hide();
    });
    $('#active_flag').change(function(){
        if ($(this).is(':checked')){
        $(this).val('1');
                } else{
        $(this).val('0');
                }
        //alert($(this).val());
    });
    $('#terminated_flag').change(function(){
        if ($(this).is(':checked')){
            $(this).val('1');
        } else{
         $(this).val('0');
        }
        //alert($(this).val());
    });
    $('#addempform').submit(function(e) {
        // will pass the form date using the jQuery serialize function
        var values = $(this).serialize();
        var active_checked = $("#active_flag").is(':checked');
        if (!active_checked)
        {
        is_admin = 0;
                values += "&active_flag=" + encodeURIComponent(is_admin);
                }
         var terminated_checked = $("#terminated_flag").is(':checked');
        if (!terminated_checked)
        {
            is_admin = 0;
            alert('inside term');
            values += "&terminated_flag=" + encodeURIComponent(is_admin);
        }
        //alert(values);
        $.post('addEmployee', values, function(response) {
            bootbox.alert(response);
            $('#addempform')[0].reset();
            $("#EmployeesTable").empty();
            var oTable = $('#EmployeesTableResult').dataTable();
            oTable.fnDestroy();
            fetchEmpdata();
        });
                e.preventDefault(); // prevent actual form submit and page reload
    });
    $('#btn-update').click(function(e) {
        var values = $('#addempform').serialize();
        var active_checked = $("#active_flag").is(':checked');
        if (!active_checked)
        {
            val = 0;
            values += "&active_flag=" + encodeURIComponent(val);
        }
        var terminated_checked = $("#terminated_flag").is(':checked');
        if (!terminated_checked)
        {
            val = 0;
            values += "&terminated_flag=" + encodeURIComponent(val);
        }
        values += "&id=" + encodeURIComponent($('#id').val());
        //alert(values);
        $.post('update', values, function(response) {
            bootbox.alert(response);
            $('#addempform')[0].reset();
            $("#EmployeesTable").empty();
            var oTable = $('#EmployeesTableResult').dataTable();
            oTable.fnDestroy();
            fetchEmpdata();
        });
        e.preventDefault(); // prevent actual form submit and page reload
    });
});
< /script>




< /div>

< jsp:include page = "templates/footer.jsp" / >



