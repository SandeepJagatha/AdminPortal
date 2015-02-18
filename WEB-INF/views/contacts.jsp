<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>


<!-- Main content div -->
<div class="container" id="container">
<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li class="active">Contacts</li>
</ol>
<button class="btn btn-xs btn-primary" id="gencsv">Generate CSV File</button> <br><br>


    		<%-- <c:forEach items="${contacts}" var="contact">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				  <div class="panel panel-success">
				    <div class="panel-heading" role="tab" id="headingOne">
				      <h4 class="panel-title">
				        <a data-toggle="collapse" data-parent="#accordion" href="#${contact.id}" aria-expanded="true" aria-controls="collapseOne" style="text-decoration: none;">
				          <strong>First Name: </strong> ${contact.first_name} &nbsp;&nbsp;&nbsp; <strong>Last Name: </strong> ${contact.last_name} &nbsp;&nbsp;&nbsp; <strong>Job Role: </strong> ${contact.job_title} &nbsp;&nbsp;&nbsp; <strong>Organization: </strong> ${contact.org_name} 
				        </a>
				      </h4>
				    </div>
				    <div id="${contact.id}" class="panel-collapse collapse out" role="tabpanel" aria-labelledby="headingOne" style="background-color: rgb(243, 254, 238);">
				      <div class="panel-body">
				      	<div class="row">
				      		<div class="col-xs-4">
				      			<dl class="dl-horizontal">
				      			  <dt>First Name</dt><dd>${contact.first_name}</dd>
								  <dt>Middle Name</dt><dd>${contact.middle_name}</dd>
								  <dt>Last Name</dt><dd>${contact.last_name}</dd>
								  <dt>Job title</dt><dd>${contact.job_title}</dd>
				      			</dl>
				      		</div>
				      		<div class="col-xs-4">
				      			<dl class="dl-horizontal">
				      			  <dt>Organization</dt><dd>${contact.org_name}</dd>
								  <dt>Email(Work)</dt><dd>${contact.email_work}</dd>
								  <dt>Email(Personal)</dt><dd>${contact.email_personal}</dd>
				      			</dl>
				      		</div>
				      		<div class="col-xs-4">
				      			<dl class="dl-horizontal">
				      				<dt>Phone(Work)</dt><dd>${contact.work_ph_num}</dd>
							  	    <dt>Mobile</dt><dd>${contact.cell_ph_num}</dd>
							  	    <dt>Employee ID</dt><dd><a onclick="EmpDetails('${contact.par_row_id}');" style="cursor:pointer;text-decoration: none;">${contact.par_row_id}</a></dd>
				      			</dl>
				      		</div>		      	
				      	</div>
				      </div>
				    </div>
				  </div>
				</div>
			</c:forEach> --%>
	  
    <div class="panel panel-info">
	  <div class="panel-heading">
	    <h3 class="panel-title">Contacts List</h3>
	  </div>
	  <div class="panel-body table-responsive" style="background-color:#F2FAFE; /* rgb(243, 254, 238); */">
    	<table class="table table-striped table-condensed table-hover" id="ContactsTableResult" >
	      <thead>
	        <tr>
				<th>First Name</th>
				<!-- <th>Middle Name</th> -->
				<th>Last Name</th>
				<th>Job Title</th>
				<th>Organization</th>
				<th>Email(Work)</th>
				<th>Email(Personal)</th>
				<th>Phone(Work)</th>
				<th>Mobile</th>
				<th>Employee ID</th>
	        </tr>
	      </thead>
	      <tbody id="ContactsTable">
	      </tbody>
	    </table>
	  </div>
	</div>
</div>

<script type="text/javascript">
$('#contactsli').addClass('active');
function fetchContactsdata() {
	
	$("#VendorsTable").empty();
    var oTable = $('#ContactsTableResult').dataTable();
    oTable.fnDestroy();
	
 	$.post('../contact/getallcontacts', {}, function(json) {
 		//alert(json);
 		//console.log(json);        
 		var taRow = "";
 		//$("#EmployeesTable").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			taRow += "<tr id='"+val.id+"' >";
        	taRow += "<td>"+val.first_name+"</td>";
        	/* taRow += "<td>"+val.middle_name+"</td>"; */
        	taRow += "<td>"+val.last_name+"</td>";
        	taRow += "<td>"+val.job_title+"</td>";
        	taRow += "<td>"+val.org_name+"</td>";
        	taRow += "<td>"+val.email_work+"</td>";	  
        	taRow += "<td>"+val.email_personal+"</td>";
        	taRow += "<td>"+val.work_ph_num+"</td>";
        	taRow += "<td>"+val.cell_ph_num+"</td>";
        	taRow += "<td><a onclick=\"EmpDetails('"+val.par_row_id+"');\"  style='cursor: pointer;text-decoration:none;'>"+val.par_row_id+"</a></td>";
            taRow += "</tr>";   	
            //console.log(taRow);
            $("#ContactsTable").append(taRow);
            taRow = "";
 		});
 		$('#ContactsTableResult').dataTable({            
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
	fetchContactsdata();
	
	$('#gencsv').click(function(){
		$.post("../contact/getallcontacts").done(function(data) {
			console.log(data);
			console.log(JSON.stringify(data));
			    //var json = data; 
			var data = JSON.stringify(data)
			JSONToCSVConvertor(data, "Contacts Report", true);
		});
	});
	
});
function JSONToCSVConvertor(JSONData, ReportTitle, ShowLabel) {
    //If JSONData is not an object then JSON.parse will parse the JSON string in an Object
    var arrData = typeof JSONData != 'object' ? JSON.parse(JSONData) : JSONData;
    
    var CSV = '';    
    //Set Report title in first row or line
    
    CSV += ReportTitle + '\r\n\n';

    //This condition will generate the Label/Header
    if (ShowLabel) {
        var row = "";
        
        //This loop will extract the label from 1st index of on array
        for (var index in arrData[0]) {
            
            //Now convert each value to string and comma-seprated
            row += index + ',';
        }

        row = row.slice(0, -1);
        
        //append Label row with line break
        CSV += row + '\r\n';
    }
    
    //1st loop is to extract each row
    for (var i = 0; i < arrData.length; i++) {
        var row = "";
        
        //2nd loop will extract each column and convert it in string comma-seprated
        for (var index in arrData[i]) {
            row += '"' + arrData[i][index] + '",';
        }

        row.slice(0, row.length - 1);
        
        //add a line break after each row
        CSV += row + '\r\n';
    }

    if (CSV == '') {        
        alert("Invalid data");
        return;
    }   
    
    //Generate a file name
    var fileName = "MyReport_";
    //this will remove the blank-spaces from the title and replace it with an underscore
    fileName += ReportTitle.replace(/ /g,"_");   
    
    //Initialize file format you want csv or xls
    var uri = 'data:text/csv;charset=utf-8,' + escape(CSV);
    
    // Now the little tricky part.
    // you can use either>> window.open(uri);
    // but this will not work in some browsers
    // or you will not get the correct file extension    
    
    //this trick will generate a temp <a /> tag
    var link = document.createElement("a");    
    link.href = uri;
    
    //set the visibility hidden so it will not effect on your web-layout
    link.style = "visibility:hidden";
    link.download = fileName + ".csv";
    
    //this part will append the anchor tag and remove it after automatic click
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}

//SJ-- This function is to generate csv file
/* function gencsv(){
	$.post("../contact/getallcontacts").done(function(data) {
		// var json = $.parseJSON(data);
		console.log(data);
		console.log(JSON.stringify(data));
		    //var json = data; 
		var json = JSON.stringify(data)
		var csvContent = "";
		$.each($.parseJSON(json),function(infoArray, index){			
			console.log(infoArray);
			console.log(index);
		   dataString = infoArray.join(",");
		   csvContent += index < infoArray.length ? "\'" + dataString + "\' \n" : "\'" + dataString+ "\' \n";	
		   		 console.log("datastring:"+dataString);
		   		 console.log("csvContent:"+csvContent);
		}); 
		
		info =csvContent;
	 	var info = info.replace(/'/g, "");
	 	
		var csv = info; 
		var varBlob = createObjectURL( csv );
		var brow = isIE();
		if(brow == 1)
		{
			var blob1 = new Blob([csv], {type: 'text/csv'});
			window.navigator.msSaveOrOpenBlob(blob1, 'ContactDetails.csv');
		}
		else
		{
			var a = document.getElementById('a');
			a.href = createObjectURL( csv ); 
			a.download = 'ContactDetails.csv';
			document.body.appendChild(a)
			a.click();
		}			
	});		
}

function createObjectURL(csv) {
	if (window.webkitURL) {
		return window.webkitURL.createObjectURL(new Blob([csv], {
			type : 'text/csv'
		}))

	} else if (window.URL && window.URL.createObjectURL) {
		return window.URL.createObjectURL(new Blob([csv], {
			type : 'text/csv'
		}))
	} else {
		return null;
	}
}

function isIE() {

	var sBrowser = 1, sUsrAg = navigator.userAgent;
	//alert("Agent : " + sUsrAg);
	if (sUsrAg.indexOf("Chrome") > -1) {
		sBrowser = 0;
	} else if (sUsrAg.indexOf("Safari") > -1) {
		sBrowser = 0;
	} else if (sUsrAg.indexOf("Opera") > -1) {
		sBrowser = 0;
	} else if (sUsrAg.indexOf("Firefox") > -1) {
		sBrowser = 0;
	} else if (sUsrAg.indexOf("MSIE ") > -1) {
		sBrowser = 1;
	}

	return sBrowser;
} */




</script>


<jsp:include page="templates/footer.jsp"/>