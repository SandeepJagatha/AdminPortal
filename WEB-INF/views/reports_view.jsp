<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<jsp:include page="templates/header.jsp"/>

<!-- Main content div -->
<div class="container">
	<ol class="breadcrumb">
	  <li><a href="../tdmin/index">Home</a></li>
	  <li class="active">Reports</li>
	</ol>
	<div class="panel panel-info">
	      <div class="panel-heading">
	        <h3 class="panel-title">Generate Reports</h3>
	      </div>
	      <div class="panel-body">
	      		<table class="table table-striped table-condensed" id="reports">
					 <thead>
				        <tr>
				          <th>#</th>
				          <th>Report Item</th>
				          <th>View</th>
				          <th>Csv</th>
				          <th>Pdf</th>
				          <th>Generate</th>
				        </tr>
				      </thead>
				      <tbody>
				        <tr class="active">
				          <td>1</td>
				          <th scope="row">Employees</th>
				          <td>View List</td>
				          <td class="csv"><input type="radio" name="empgtype" class="chkcsv" id="chkcsv1" ></td>
				          <td class="pdf"><input type="radio" name="empgtype"   class="chkpdf"  id="chkpdf1" ></td>
				          <td><button class="btn btn-primary btn-xs" id="genEmpcsv" disabled onclick="generate(this);"><i class="icon-download-alt icon-large" ></i> Generate</button></td>
						</tr>
						<tr class="success">
				          <td>2</td>
				          <th scope="row">Contacts</th>
				          <td>View List</td>
				          <td class="csv"><input type="radio" name="cntgtype"  class="chkcsv" id="chkcsv2" ></td>
				          <td class="pdf"><input type="radio" name="cntgtype" class="chkpdf" id="chkpdf2" ></td>
				          <td><button class="btn btn-primary btn-xs" id="genContactscsv" disabled  onclick="generate(this);"><i class="icon-download-alt icon-large"></i> Generate</button></td>
						</tr>
						<tr class="warning">
				          <td>3</td>
				          <th scope="row">Vendors</th>
				          <td>View List</td>
				          <td class="csv"><input type="radio" name="vengtype" class="chkcsv" id="chkcsv3"></td>
				          <td class="pdf"><input type="radio" name="vengtype" class="chkpdf" id="chkpdf3" ></td>
				          <td><button class="btn btn-primary btn-xs" id="genVendorscsv" disabled  onclick="generate(this);"><i class="icon-download-alt icon-large"></i> Generate</button></td>
						</tr>
						<tr class="danger">
				          <td>4</td>
				          <th scope="row">Clients</th>
				          <td>View List</td>
				          <td class="csv"><input type="radio" name="cltgtype" class="chkcsv" id="chkcsv4" ></td>
				          <td class="pdf"><input type="radio" name="cltgtype" class="chkpdf" id="chkpdf4" ></td>
				          <td><button class="btn btn-primary btn-xs" id="genClientscsv" disabled  onclick="generate(this);"><i class="icon-download-alt icon-large"></i> Generate</button></td>
						</tr>
						<tr class="default">
				          <td>5</td>
				          <th scope="row">Address</th>
				          <td>View List</td>
				          <td class="csv"><input type="radio" name="ldsgtype" class="chkcsv" id="chkcsv5" ></td>
				          <td class="pdf"><input type="radio" name="ldsgtype" class="chkpdf" id="chkpdf5" ></td>
				          <td><button class="btn btn-primary btn-xs" id="genAddresscsv" disabled  onclick="generate(this);"><i class="icon-download-alt icon-large"></i> Generate</button></td>
						</tr><tr class="info">
				          <td>6</td>
				          <th scope="row">Leads</th>
				          <td>View List</td>
				          <td class="csv"><input type="radio" name="addgtype" class="chkcsv" id="chkcsv6" ></td>
				          <td class="pdf"><input type="radio" name="addgtype" class="chkpdf" id="chkpdf6" ></td>
				          <td><button class="btn btn-primary btn-xs" id="genLeadscsv" disabled  onclick="generate(this);"><i class="icon-download-alt icon-large"></i> Generate</button></td>
						</tr>
				      </tbody>
				</table>
	      </div>
	</div>
</div>

<script>
var type="";

function chcktype(lastchar){
	/* if($('#chkcsv'+lastchar).is(":checked") && $('#chkpdf'+lastchar).is(":checked")) {
		type = "both";
		return type;
    }
 	else  */
 	if($('#chkcsv'+lastchar).is(":checked")){
 		type = "csv";
		return type;
 		
 	}else{
 		type = "pdf";
		return type;
 	}
}

//Onclick genreate button this function fires 
// This function call again chckType() function to check the type of generation
// Finally selected the url and filename is given to the ajax call.
function generate(elem){
	var id = $(elem).attr("id");
	var url = null;
	var filename ="";
	
    //alert(id);
    if(id=="genEmpcsv"){
    	alert('genEmpcsv');
    	chcktype(1);
    	if(type == "csv"){
    		url = "../employee/fetch";
    		filename = "Employees";
    	}
    	else{
    		url="../generatepdf/emppdf";
    	}
    }
    
    else if(id=="genContactscsv"){
    	alert('genContactscsv');
    	chcktype(2);
    	if(type == "csv"){
    		url = "../contact/getallcontacts";
    		filename = "Contacts";
    	}
    	else{
    		url="../generatepdf/contactspdf";    		
    	}
    }
    
    else if(id=="genVendorscsv"){
    	alert('genVendorscsv');
    	chcktype(3);
    	if(type == "csv"){
    		url = "../vendor/getallv";
    		filename = "Vendors";
    	}
    	else{
    		url="../generatepdf/vendorspdf";   
    	}
    }
    else if(id=="genClientscsv"){
    	alert('genClientscsv');
    	chcktype(4);
    	if(type == "csv"){
    		url = "../client/getallclients";
    		filename = "Clients";
    	}
    	else{
    		url="../generatepdf/clientspdf";   
    	}
    }
    else if(id=="genAddresscsv"){
    	alert('genAddresscsv');
    	chcktype(5);
    	if(type == "csv"){
    		url = "../address/getalladdresses";
    		filename = "Addresses";
    	}
    	else{
    		url="../generatepdf/addresspdf";   
    	}
    }
    else if(id=="genLeadscsv"){
    	alert('genLeadscsv');
    	chcktype(6);
    	if(type == "csv"){
    		url = "../contact/getallleads";
    		filename = "Leads";
    	}
    	else{
    		url="../generatepdf/leadspdf";   
    	}
    }
    
    // if url is not null and type is csv then it enters into this if condition else it is a pdf file
    if(url != null && type=="csv"){
    	$.post(url).done(function(data) {
			console.log(data);
			console.log(JSON.stringify(data));
			    //var json = data; 
			var data = JSON.stringify(data)
			JSONToCSVConvertor(data, filename, true);
		});
    }else{    	
    	window.open(url);
    }
    
		
}


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
    var fileName = "Report_";
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

$(document).ready(function(){ 
	
    $("input[type='radio']").change(function() {
    	var btnid = "";
    	var chkid = $(this).attr('id');
    	var lastChar = chkid.substr(chkid.length - 1);
    	chkf = chkid.slice(0, -1);
    	if(chkf == 'chkcsv'){
    		var newid = "chkpdf"+lastChar;
    	}else{
    		var newid = "chkcsv"+lastChar;
    	}
        /* if($(this).is(":checked")) {
            var btnid = $(this).parent().parent().children().children('button').attr('id');
            $('#'+btnid+'').removeAttr('disabled');
        }else if */
        if($('#'+newid+'').is(":checked") || $(this).is(":checked")){
        	var btnid = $(this).parent().parent().children().children('button').attr('id');
            $('#'+btnid+'').removeAttr('disabled');
        	
        }else{
        	var btnid = $(this).parent().parent().children().children('button').attr('id');
        	$('#'+btnid+'').attr('disabled','disabled');
        }
    });
    
    
    
});
</script>

<jsp:include page="templates/footer.jsp"/>