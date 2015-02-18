<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%-- <link rel="stylesheet" href="<c:url value="/resources/assets/css/ace.min.css" />" />
<link rel="stylesheet" href="<c:url value="/resources/assets/font/font-awesome.min.css" />" /> --%>

<style>
.flip {
  -webkit-perspective: 800;
  -ms-perspective: 800;
  -moz-perspective: 800;
  -o-perspective: 800;
   /* width: 20%; */
   /* height: 245px; */
   height: 135px;
   position: relative;
/*    margin: 50px auto; */
}
.flip .card.flipped {
  transform:rotatey(-180deg);
  -ms-transform:rotatey(-180deg); /* IE 9 */
  -moz-transform:rotatey(-180deg); /* Firefox */
  -webkit-transform:rotatey(-180deg); /* Safari and Chrome */
  -o-transform:rotatey(-180deg); /* Opera */
}
.flip .card {
  width: 100%;
  height: 100%;
  -webkit-transform-style: preserve-3d;
  -webkit-transition: 0.5s;
  -moz-transform-style: preserve-3d;
  -moz-transition: 0.5s;
  -ms-transform-style: preserve-3d;
  -ms-transition: 0.5s;
  -o-transform-style: preserve-3d;
  -o-transition: 0.5s;
  transform-style: preserve-3d;
  transition: 0.5s;
}
.flip .card .face {
  width: 100%;
  height: 100%;
  position: absolute;
  z-index: 1000;
/*   font-family: Georgia;
  font-size: 3em;
  text-align: center;
  line-height: 200px; */
  backface-visibility: hidden;  /* W3C */
  -webkit-backface-visibility: hidden; /* Safari & Chrome */
  -moz-backface-visibility: hidden; /* Firefox */
  -ms-backface-visibility: hidden; /* Internet Explorer */
  -o-backface-visibility: hidden; /* Opera */

}
.flip .card .front {
  position: absolute;
  z-index: 100;
  background: #dff0d8;
  color: black;
  cursor: pointer;
}
.flip .card .back {
    background: blue;
    background: #d9edf7;
    color: black;
    cursor: pointer;
    
  transform:rotatey(-180deg);
  -ms-transform:rotatey(-180deg); /* IE 9 */
  -moz-transform:rotatey(-180deg); /* Firefox */
  -webkit-transform:rotatey(-180deg); /* Safari and Chrome */
  -o-transform:rotatey(-180deg); /* Opera */

}
</style>

<ol class="breadcrumb">
  <li><a href="../tdmin/index">Home</a></li>
  <li><a href="../employee/add">Employees</a></li>
  <li class="active">${employee.last_name} Details</li>
</ol>

<div class="panel panel-success">
	<div class="panel-heading">${employee.first_name} ${employee.last_name} Details (ID:${employee.eid})</div>
	<div class="panel-body">
		
		<div class="row">
			<div class="col-xs-4">
				<dl class="dl-horizontal">
					<dt>First Name:</dt><dd>${employee.first_name}</dd>
					<dt>Middle Name:</dt><dd>${employee.middle_name}</dd>
					<dt>Last Name:</dt><dd>${employee.first_name}</dd>			
					<dt>Job Title:</dt><dd>${employee.job_title}</dd>
					<dt>SSN:</dt><dd>${employee.SSN}</dd>
					<dt>Date Of Birth:</dt><dd>${employee.DOB}</dd>
				</dl>
			</div>
			<div class="col-xs-4">
				<dl class="dl-horizontal">		
					<dt>Status:</dt><dd>${employee.emp_status}</dd>	
					<dt>Employee ID:</dt><dd>${employee.eid}</dd>				
					<dt>Email(Work):</dt><dd>${employee.email_work}</dd>
					<dt>Email(Personal):</dt><dd>${employee.email_personal}</dd>
					<dt>Phone Num.(Home):</dt><dd>${employee.home_ph_num}</dd>
					<dt>Phone Num.(Work):</dt><dd>${employee.work_ph_num}</dd>		
				</dl>		
			</div>
			<div class="col-xs-4">
				<dl class="dl-horizontal">			
					<dt>Cell Number:</dt><dd>${employee.cell_ph_num}</dd>		
					<dt>Date of Joining:</dt><dd>${employee.date_of_joining}</dd>
  					<dt>Date of Ending:</dt><dd>${employee.date_of_ending}</dd>
					<dt>Country of birth:</dt><dd>${employee.country_of_birth}</dd>
					<dt>Active:</dt>
					<dd>
						<c:choose>
							<c:when test="${employee.active_flag == '1'}">Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>							
					</dd>
					<dt>Terminated:</dt>						
					<dd>
						<c:choose>
							<c:when test="${employee.terminated_flag == '1'}">Yes</c:when>
							<c:otherwise>No</c:otherwise>
						</c:choose>							
					</dd>
 					</dl>
					<a href="#" id="example" rel="popover" tabindex="0" data-placement="right" class="popoverOption"  data-content="
						<div>
							<dl>
							  <dt>Created on:</dt><dd>${employee.created}</dd>
							  <dt>Created by:</dt><dd>${employee.created_by}</dd>
							  <dt>Last updated on:</dt><dd>${employee.last_updated}</dd>
							  <dt>Last updated by:</dt><dd>${employee.last_updated_by}</dd>
							</dl>
						</div>"
					data-html="true" data-original-title="Created/Updated Details">Details!</a>
			</div>			
		</div>
			
		<hr>
		<ul class="nav nav-tabs">
			<li><a data-toggle="tab" href="#activities">Activities</a></li>
			<li><a data-toggle="tab" href="#notes">NOTES</a></li>
			<li><a data-toggle="tab" href="#attachments">ATTACHMENTS</a></li>
			<li class="active"><a data-toggle="tab" href="#address">Address</a></li>
			<li><a data-toggle="tab" href="#contact">Contact</a></li>
			<li><a data-toggle="tab" href="#vendor">Vendor</a></li>
			<li><a data-toggle="tab" href="#client">Client</a></li>
			<li><a data-toggle="tab" href="#beneficiary">BENEFICIARY</a></li>
			<li><a data-toggle="tab" href="#education">EDUCATION</a></li>
			<li><a data-toggle="tab" href="#immigration">IMMIGRATION</a></li>
			<li><a data-toggle="tab" href="#benefits">BENEFITS</a></li>
			<li><a data-toggle="tab" href="#payroll">PAYROLL</a></li>
			<li><a data-toggle="tab" href="#referrals">REFERRALS</a></li>
			<li><a data-toggle="tab" href="#assets">ASSETS</a></li>
		</ul>
		<div class="tab-content">
			<div id="address" class="tab-pane active"> 
				<div style="padding:15px;">
					<button class="btn btn-xs btn-primary" type="button" id="addAdrbtn">Add</button>
					<div id="divaddaddress" style="display:none;">
						<input type="hidden" id="empid" name="empid" value="${employee.eid}">
						<input type="hidden" id="addressid" name="addressid" value="">
				      	<form class="form-horizontal" id="addressform">
				      	<input type="hidden" id="createdby" name="created_by" value="${email}">
				      	<input type="hidden" id="lastupdate" name="last_updated_by" value="${email}">
						<input type="hidden" id="par_row_id" name="par_row_id" value="${employee.eid}">
					      	<div class="row">	      	
							  <div class="col-xs-6 col-md-4">
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Type</label>
								    <div class="col-md-8">
								        <select class="form-control input-sm" name="addr_type" id="addr_type" required>
										  <option value="Work">Work</option>
										  <option value="Home">Home</option>
										  <option value="Foreign">Foreign</option>
										</select>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Addr. line1</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="addr_line1" name="addr_line1" placeholder="Address line1" maxlength="100"  required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Addr. line2</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="addr_line2" name="addr_line2" maxlength="100" placeholder="Address line2" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Addr. line3</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="addr_line3" name="addr_line3"  maxlength="100" placeholder="Address line3" >
								    </div>
								  </div>
							  </div>			  
							  <div class="col-xs-6 col-md-4">
								  <div class="form-group">
								    <label class="col-xs-4 control-label">City</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="city" name="city" placeholder="City" maxlength="50" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">State</label>
								    <div class="col-md-8">
								      <select class="form-control input-sm" id="state" name="state" required>
											<option value="AL">Alabama</option>
											<option value="AK">Alaska</option>
											<option value="AZ">Arizona</option>
											<option value="AR">Arkansas</option>
											<option value="CA">California</option>
											<option value="CO">Colorado</option>
											<option value="CT">Connecticut</option>
											<option value="DE">Delaware</option>
											<option value="DC">District Of Columbia</option>
											<option value="FL">Florida</option>
											<option value="GA">Georgia</option>
											<option value="HI">Hawaii</option>
											<option value="ID">Idaho</option>
											<option value="IL">Illinois</option>
											<option value="IN">Indiana</option>
											<option value="IA">Iowa</option>
											<option value="KS">Kansas</option>
											<option value="KY">Kentucky</option>
											<option value="LA">Louisiana</option>
											<option value="ME">Maine</option>
											<option value="MD">Maryland</option>
											<option value="MA">Massachusetts</option>
											<option value="MI">Michigan</option>
											<option value="MN">Minnesota</option>
											<option value="MS">Mississippi</option>
											<option value="MO">Missouri</option>
											<option value="MT">Montana</option>
											<option value="NE">Nebraska</option>
											<option value="NV">Nevada</option>
											<option value="NH">New Hampshire</option>
											<option value="NJ">New Jersey</option>
											<option value="NM">New Mexico</option>
											<option value="NY">New York</option>
											<option value="NC">North Carolina</option>
											<option value="ND">North Dakota</option>
											<option value="OH">Ohio</option>
											<option value="OK">Oklahoma</option>
											<option value="OR">Oregon</option>
											<option value="PA">Pennsylvania</option>
											<option value="RI">Rhode Island</option>
											<option value="SC">South Carolina</option>
											<option value="SD">South Dakota</option>
											<option value="TN">Tennessee</option>
											<option value="TX">Texas</option>
											<option value="UT">Utah</option>
											<option value="VT">Vermont</option>
											<option value="VA">Virginia</option>
											<option value="WA">Washington</option>
											<option value="WV">West Virginia</option>
											<option value="WI">Wisconsin</option>
											<option value="WY">Wyoming</option>
										</select>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">District</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="district" name="district" placeholder="District" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Country</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="country" name="country" value="USA" readonly required>
								    </div>
								  </div>
							  </div>
							  <div class="col-xs-6 col-md-4">
								  <div class="form-group">
								    <label class="col-xs-4 control-label">County</label>
								    <div class="col-md-8">
								      <input type="text" class="form-control input-sm" id="county" name="county" placeholder="County">
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Zipcode</label>
								    <div class="col-md-8">
								      <input type="number" class="form-control input-sm" id="zipcode" name="zipcode" max="9999999999" placeholder="Zipcode" required>
								    </div>
								  </div>				  	 
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Zipcode ext.</label>
								    <div class="col-md-8">
								      <input type="number" class="form-control input-sm" id="zipcode_ext" name="zipcode_ext" max="9999" placeholder="Zipcode extension" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-xs-4 control-label">Time zone</label>
								    <div class="col-md-8" style="margin-top: 6px;">
								      <input type="text" name="time_zone_cd" id="time_zone_cd" class="form-control input-sm" placeholder="Time zone">
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
								<th>Type</th>
								<th>Address line1</th>
								<th>Address line2</th>
								<th>City</th>
								<th>State</th>
								<th>County</th>
								<th>Zipcode</th>
								<th>Zip Extension</th>
								<th>Time zone</th>
								<th>Edit</th>
								<th>Delete</th>
					        </tr>
					      </thead>
					      <tbody id="AddressTable">
					          	 <c:forEach items="${address}" var="address">
									<tr id="${address.id}" >
										<td><a class='popoverOption' style="text-decoration: none;" href='#' data-content='<div><dl>
											  <dt>Created on:</dt><dd>${address.created}</dd>
											  <dt>Created by:</dt><dd>${address.created_by}</dd>
											  <dt>Last updated on:</dt><dd>${address.last_updated}</dd>
											  <dt>Last updated by:</dt><dd>${address.last_updated_by}</dd>
											</dl></div>' rel='popover' data-placement='top' data-html="true" data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>
										<td><c:out value="${address.addr_type}"/></td>
										<td><c:out value="${address.addr_line1}"/></td>
										<td><c:out value="${address.addr_line2}"/></td>
										<td><c:out value="${address.city}"/></td>
										<td><c:out value="${address.state}"/></td>
										<td><c:out value="${address.county}"/></td>
										<td><c:out value="${address.zipcode}"/></td>
										<td><c:out value="${address.zipcode_ext}"/></td>
										<td><c:out value="${address.time_zone_cd}"/></td>
										<td><button class="btn btn-warning btn-xs" onclick="fillData('${address.id}','${address.addr_type}','${address.addr_line1}',
										'${address.addr_line2}','${address.addr_line3}','${address.city}','${address.state}','${address.district}',
										'${address.country}','${address.county}','${address.zipcode}','${address.zipcode_ext}','${address.time_zone_cd}','${address.created_by}');"><i class="icon-edit-sign"></i></button></td>
										<td><button class="btn btn-danger btn-xs" onclick="DeleteAddr(${address.id});"><i class="icon-remove-sign"></i></button></td>										
									</tr>
								</c:forEach> 
					      </tbody>
					    </table>
				</div>
			
			</div>
			<div id="contact" class="tab-pane"> 
				<div style="padding:15px;">
					<button class="btn btn-xs btn-primary" type="button" id="addContactbtn" data-toggle="modal" data-target="#contactModal">Add</button>	
					<div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">					    	
						  	<input type="hidden" id="contactid" name="contactid" value="">
					    	<form  class="form-horizontal" id="contactform">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">Add Contact</h4>
						      </div>
						      <div class="modal-body">
						      	   <input type="hidden" id="ccreatedby" name="created_by" value="${email}">
							       <input type="hidden" id="clastupdate" name="last_updated_by" value="${email}">
								   <input type="hidden" id="cpar_row_id" name="par_row_id" value="${employee.eid}">
								  <div class="form-group">
								    <label class="col-sm-4 control-label">First Name</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="cfirst_name" name="first_name" placeholder="First Name" maxlength="100"  required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Middle Name</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="cmiddle_name" name="middle_name" maxlength="100" placeholder="Middle name" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Last Name</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clast_name" name="last_name" maxlength="100" placeholder="Last name" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Job Title</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="cjob_title" name="job_title"  maxlength="100" placeholder="Job Title" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Organization</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="corg_name" name="org_name"  maxlength="100" placeholder="Organization" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Email(Work)</label>
								    <div class="col-sm-7">
								      <input type="email" class="form-control input-sm" id="cemail_work" name="email_work"  maxlength="100" placeholder="Work Email" >
								    </div>
								  </div> 
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Email(Personal) </label>
								    <div class="col-sm-7">
								      <input type="email" class="form-control input-sm" id="cemail_personal" name="email_personal"  maxlength="100" placeholder="Personal Email" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Phone (Work)</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="cwork_ph_num" name="work_ph_num"  maxlength="100" placeholder="Work Phone Number" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Mobile (Cell)</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="ccell_ph_num" name="cell_ph_num"  maxlength="100" placeholder="Cell Phone Number" >
								    </div>
								  </div>
						      
						      </div>
						      <div class="modal-footer">					        
							    <button  type="button" class="btn btn-success btn-xs" id="btn-cupdate" style="display:none;">Update</button>
						        <button type="submit" id="btn-csubmit" class="btn btn-success btn-xs">Submit</button>
						        <button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Close</button>	
						      </div>
						    </form>
					    </div>
					  </div>
					</div>					
					<hr>
					<table class="table table-striped">
					      <thead>
					        <tr>
								<th>&nbsp;</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Job Title</th>
								<th>Organization</th>
								<th>Email(Work)</th>
								<th>Email(Personal)</th>
								<th>Phone(Work)</th>
								<th>Mobile(cell)</th>
								<th>Edit</th>
								<th>Delete</th>
					        </tr>
					      </thead>
					      <tbody id="ContactTable">
					          	 <c:forEach items="${contacts}" var="contact">
									<tr id="${contact.id}" >
										<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='<div><dl>
											  <dt>Created on:</dt><dd>${contact.created}</dd>
											  <dt>Created by:</dt><dd>${contact.created_by}</dd>
											  <dt>Last updated on:</dt><dd>${contact.last_updated}</dd>
											  <dt>Last updated by:</dt><dd>${contact.last_updated_by}</dd>
											</dl></div>' rel='popover' data-placement='top' data-html="true" data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>
										<td><c:out value="${contact.first_name}"/></td>
										<td><c:out value="${contact.last_name}"/></td>
										<td><c:out value="${contact.job_title}"/></td>
										<td><c:out value="${contact.org_name}"/></td>
										<td><c:out value="${contact.email_work}"/></td>
										<td><c:out value="${contact.email_personal}"/></td>
										<td><c:out value="${contact.work_ph_num}"/></td>
										<td><c:out value="${contact.cell_ph_num}"/></td>
										<td><a onclick="fillContactData('${contact.id}','${contact.first_name}','${contact.middle_name}',
											'${contact.last_name}','${contact.email_work}','${contact.email_personal}','${contact.work_ph_num}','${contact.cell_ph_num}',
											'${contact.job_title}','${contact.org_name}','${contact.created_by}');" style='text-decoration:none;color:#f0ad4e;cursor: pointer;'>
											<span class="icon-stack">
											  <i class="icon-check-empty icon-stack-base"></i>
											  <i class="icon-pencil" style="margin-top: -2px;"></i>
											</span>
											</a>
										</td>
										<td><a onclick="DeleteContact(${contact.id});" style='text-decoration: none;color:#d44950;cursor: pointer;'>
											<span class="icon-stack">
											  <i class="icon-check-empty icon-stack-base"></i>
											  <i class="icon-remove" style="margin-top: -2px;"></i>
											</span>
											</a>
										</td>								
									</tr>
								</c:forEach> 
					      </tbody>
					    </table>
				</div>
			</div>
			<div id="vendor" class="tab-pane">
				<div style="padding:15px;">
					<button class="btn btn-xs btn-primary" type="button" id="addVendorbtn" data-toggle="modal" data-target="#vendorModal">Add</button>					
					<div class="modal fade" id="vendorModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">					    	
						  	<input type="hidden" id="vendorid" name="vendorid" value="">
					    	<form  class="form-horizontal" id="vendorform">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">Add Vendor</h4>
						      </div>
						      <div class="modal-body">
						      	   <input type="hidden" id="vcreatedby" name="created_by" value="${email}">
							       <input type="hidden" id="vlastupdate" name="last_updated_by" value="${email}">
								   <input type="hidden" id="vpar_row_id" name="par_row_id" value="${employee.eid}">
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Vendor Name</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="vname" name="vname" placeholder="Vendor Name" maxlength="100"  required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Contact Person</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="vcontact_person" name="contact_person" maxlength="100" placeholder="Contact Person" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Primary Phone Num.</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="vph_num_primary" name="ph_num_primary"  maxlength="100" placeholder="Primary Phone Number" required>
								    </div>
								  </div> 
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Secondary Phone Num.</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="vph_num_secondary" name="ph_num_secondary"  maxlength="100" placeholder="Secondary Phone Number" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Email </label>
								    <div class="col-sm-7">
								      <input type="email" class="form-control input-sm" id="vemail_addr" name="email_addr"  maxlength="100" placeholder="Email" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Website</label>
								    <div class="col-sm-7">
								      <input type="url" class="form-control input-sm" id="vwebsite" name="website"  maxlength="100" placeholder="Website url" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Payment Term</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="vpayment_term" name="payment_term"  maxlength="100" placeholder="Payment Term" required>
								    </div>
								  </div>
						      
						      </div>
						      <div class="modal-footer">						        
							    <button  type="button" class="btn btn-success btn-xs" id="btn-vupdate" style="display:none;">Update</button>
						        <button type="submit" id="btn-vsubmit" class="btn btn-success btn-xs">Submit</button>
						        <button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Close</button>
						      </div>
						    </form>
					    </div>
					  </div>
					</div>					
					<hr>
					<div id="vendorcards" class="row" >
					
						<c:forEach items="${vendors}" var="vendor">
								<!-- <div class="flip col-md-4" style="padding-bottom: 5px;"> -->
								<div class="flip col-md-6" style="padding-bottom: 5px;">
									<div class="card">
										<div class="face front">
											<h1 class="text-center" style="padding: 25px;"> ${vendor.vname} </h1>
										</div>
										<div class="face back container-fluid">
											<h4 class="text-left col-xs-9" style="padding: 0px;text-decoration: underline;margin-bottom: 0px;">Vendor Name: ${vendor.vname}<small style="font-size: 50%;color:#000;"><a class='btn popoverOption' href='#' data-content='<div><dl>
											  <dt>Created on:</dt><dd>${vendor.created}</dd>
											  <dt>Created by:</dt><dd>${vendor.created_by}</dd>
											  <dt>Last updated on:</dt><dd>${vendor.last_updated}</dd>
											  <dt>Last updated by:</dt><dd>${vendor.last_updated_by}</dd>
											</dl></div>' rel='popover' data-placement='top' data-html="true" data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></small></h4>
											<div class="col-xs-1"></div>
											<div class="col-xs-2" style="margin-left: 26px;">
												<a class="" onclick="fillVendorData('${vendor.id}','${vendor.vname}','${vendor.contact_person}',
												'${vendor.ph_num_primary}','${vendor.ph_num_secondary}','${vendor.email_addr}','${vendor.payment_term}','${vendor.website}',
												'${vendor.created_by}');" style="text-decoration: none;color:#f0ad4e;"><i class="icon-pencil"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;
												<a class="" onclick="DeleteVendor(${vendor.id});" style="text-decoration: none;color:#d44950;"><i class="icon-remove"></i></a>
											</div>
											<!-- <div class="col-xs-1">
												
											</div> -->
											<div class="row" style='word-wrap: break-word;font-size:12px'>
											<%-- 	<div class="col-xs-6">
													<h4>Vendor Name:<small>${vendor.vname}</small></h4>
													<h4>Contact person: <small>${vendor.contact_person}</small></h4>
													<h4>Primary Phone Number: <small>${vendor.ph_num_primary}</small></h4>
													<h4>Secondary Phone Number: <small>${vendor.ph_num_secondary}</small></h4>
												</div>
												<div class="col-xs-6">
													<h4>Email: <small>${vendor.email_addr}</small></h4>
													<h4>Payment term: <small>${vendor.payment_term}</small></h4>
													<h4>Website: <small>${vendor.website}</small></h4>
												</div> --%>
											
												<div class="col-xs-4">
													<dl class="">
													  <%-- <dt>Vendor Name</dt><dd>${vendor.vname}</dd> --%>
													  <dt>Contact person</dt><dd>${vendor.contact_person}</dd>
												      <dt>Phone(Primary)</dt><dd>${vendor.ph_num_primary}</dd>
													  
													 </dl>
												 </div>
												 <div class="col-xs-4">
												    <dl class="">
													  <dt>Phone(Secondary)</dt><dd>${vendor.ph_num_secondary}</dd>
													  <dt>Email</dt><dd>${vendor.email_addr}</dd>
												    </dl>
												 </div>
												 <div class="col-xs-4">
												    <dl class="">
													  <dt>Payment term</dt><dd>${vendor.payment_term}</dd>
													  <dt>Website</dt><dd><a target="_blank" href="${vendor.website}">${vendor.website}</a></dd>
													</dl>
												 </div> 
											 
											</div>
										</div>
									</div>
								</div>
						</c:forEach>	
																						
					</div>

				</div>
			</div>			
			<div id="client" class="tab-pane"> 
				<div style="padding:15px;">
					<button class="btn btn-xs btn-primary" type="button" id="addClientbtn" data-toggle="modal" data-target="#clientModal">Add</button>	
					<div class="modal fade" id="clientModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">					    	
						  	<input type="hidden" id="clientid" name="clientid" value="">
					    	<form  class="form-horizontal" id="clientform">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">Add Client</h4>
						      </div>
						      <div class="modal-body">
						      	   <input type="hidden" id="clcreatedby" name="created_by" value="${email}">
							       <input type="hidden" id="cllastupdate" name="last_updated_by" value="${email}">
								   <input type="hidden" id="clpar_row_id" name="par_row_id" value="${employee.eid}">
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Client Name</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clclient_name" name="client_name" placeholder="Client Name" maxlength="100"  required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Employee Manager</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clemp_manager" name="emp_manager" maxlength="100" placeholder="Employee Manager" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Phone(Primary)</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clph_num_primary" name="ph_num_primary" maxlength="100" placeholder="Primary Phone Number" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Phone(Secondary)</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clph_num_secondary" name="ph_num_secondary"  maxlength="100" placeholder="Secondary Phone Number" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Email</label>
								    <div class="col-sm-7">
								      <input type=email class="form-control input-sm" id="clemail_addr" name="email_addr"  maxlength="100" placeholder="Email" required>
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">LOB</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="cllob" name="lob"  maxlength="100" placeholder="LOB" >
								    </div>
								  </div> 
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Client Type </label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clclient_type" name="client_type"  maxlength="100" placeholder="Client Type" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Website</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clwebsite" name="website"  maxlength="100" placeholder="Website" >
								    </div>
								  </div>
								  <div class="form-group">
								    <label class="col-sm-4 control-label">Payment Term</label>
								    <div class="col-sm-7">
								      <input type="text" class="form-control input-sm" id="clpayment_term" name="payment_term"  maxlength="100" placeholder="Payment Term" >
								    </div>
								  </div>
						      
						      </div>
						      <div class="modal-footer">					        
							    <button  type="button" class="btn btn-success btn-xs" id="btn-clupdate" style="display:none;">Update</button>
						        <button type="submit" id="btn-clsubmit" class="btn btn-success btn-xs">Submit</button>
						        <button type="button" class="btn btn-default btn-xs" data-dismiss="modal">Close</button>	
						      </div>
						    </form>
					    </div>
					  </div>
					</div>					
					<hr>
					<table class="table table-striped">
					      <thead>
					        <tr>
								<th>&nbsp;</th>
								<th>Client Name</th>
								<th>Employee Manager</th>
								<th>Phone(Primary)</th>
								<th>Phone(Secondary)</th>
								<th>Email</th>
								<th>LOB</th>
								<th>Client Type</th>
								<th>Website</th>
								<th>Payment Term</th>
								<th>Edit</th>
								<th>Delete</th>
					        </tr>
					      </thead>
					      <tbody id="ClientTable">
					          	 <c:forEach items="${clients}" var="client">
									<tr id="${client.id}" >
										<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='<div><dl>
											  <dt>Created on:</dt><dd>${client.created}</dd>
											  <dt>Created by:</dt><dd>${client.created_by}</dd>
											  <dt>Last updated on:</dt><dd>${client.last_updated}</dd>
											  <dt>Last updated by:</dt><dd>${client.last_updated_by}</dd>
											</dl></div>' rel='popover' data-placement='top' data-html="true" data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>
										<td><c:out value="${client.client_name}"/></td>
										<td><c:out value="${client.emp_manager}"/></td>
										<td><c:out value="${client.ph_num_primary}"/></td>
										<td><c:out value="${client.ph_num_secondary}"/></td>
										<td><c:out value="${client.email_addr}"/></td>
										<td><c:out value="${client.lob}"/></td>
										<td><c:out value="${client.client_type}"/></td>
										<td><c:out value="${client.website}"/></td>
										<td><c:out value="${client.payment_term}"/></td>
										<td><a onclick="fillClientData('${client.id}','${client.client_name}','${client.emp_manager}',
											'${client.ph_num_primary}','${client.ph_num_secondary}','${client.email_addr}','${client.lob}','${client.client_type}',
											'${client.website}','${client.payment_term}','${client.created_by}');" style='text-decoration:none;color:#f0ad4e;cursor: pointer;'>
											<span class="icon-stack">
											  <i class="icon-check-empty icon-stack-base"></i>
											  <i class="icon-pencil" style="margin-top: -2px;"></i>
											</span>
											</a>
										</td>
										<td><a onclick="DeleteClient(${client.id});" style='text-decoration: none;color:#d44950;cursor: pointer;'>
											<span class="icon-stack">
											  <i class="icon-check-empty icon-stack-base"></i>
											  <i class="icon-remove" style="margin-top: -2px;"></i>
											</span>
											</a>
										</td>								
									</tr>
								</c:forEach> 
					      </tbody>
					    </table>
				</div>
			</div>
			<div id="activities" class="tab-pane"> 
			
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function fetchClientdata() {
	empid = $('#empid').val();
 	$.post('../client/fetch',{empid:empid}, function(json) {
 		//alert(json);
 		console.log(json);        
 		
 		var taRow = "";
 		$("#ClientTable").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			taRow += "<tr id="+val.id+">";
        	taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
	        	taRow += "<div><dl><dt>Created on:</dt><dd>"+val.created+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	        	taRow += "<dt>Last updated on:</dt><dd>"+val.last_updated+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
        		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
        	taRow += "<td>"+val.client_name+"</td>";
        	taRow += "<td>"+val.emp_manager+"</td>";
        	taRow += "<td>"+val.ph_num_primary+"</td>";
        	taRow += "<td>"+val.ph_num_secondary+"</td>";
        	taRow += "<td>"+val.email_addr+"</td>";
        	taRow += "<td>"+val.lob+"</td>";
        	taRow += "<td>"+val.client_type+"</td>";
        	taRow += "<td>"+val.website+"</td>";
        	taRow += "<td>"+val.payment_term+"</td>";
        	taRow += "<td><a onClick=\"fillClientData('"+val.id+"','"+val.client_name+"','"+val.emp_manager+"','"+val.ph_num_primary+"', \
        			 '"+val.ph_num_secondary+"','"+val.email_addr+"','"+val.lob+"','"+val.client_type+"','"+val.website+"','"+val.payment_term+"', \
        			 '"+val.created_by+"');\" style='text-decoration: none;color:#f0ad4e;cursor: pointer;'><span class='icon-stack'><i class='icon-check-empty icon-stack-base'></i><i class='icon-pencil' style='margin-top: -2px;'></i></span></a></td>";
        	taRow += "<td><a onClick=\"DeleteClient('"+val.id+"');\" style='text-decoration: none;color:#d44950;cursor: pointer;'><span class='icon-stack'><i class='icon-check-empty icon-stack-base'></i><i class='icon-remove' style='margin-top: -2px;'></i></span></a></td>";
            taRow += "</tr>";   	
            console.log(taRow);
            $("#ClientTable").append(taRow);
            taRow = "";
 		});
 		load();
	}); 	
}

function fillClientData(id, client_name, emp_manager, ph_num_primary, ph_num_secondary, email_addr, lob, client_type, website, payment_term, created_by){
	
	$('#btn-clsubmit').hide();
	$('#btn-clupdate').show();
	
	$("#clientid").val(id);
    
    $("#clcreatedby").val(createdby);
    $("#clclient_name").val(client_name);
    $("#clemp_manager").val(emp_manager);
    $("#clph_num_primary").val(ph_num_primary);
    $("#clph_num_secondary").val(ph_num_secondary);
    $("#clemail_addr").val(email_addr);    
    $("#cllob").val(lob);
    $("#clclient_type").val(client_type);    
    $("#clwebsite").val(website);
    $("#clpayment_term").val(payment_term);  
    
    $('#clientModal').modal('show');	
    /* $('#vendorModal').on('show.bs.modal', function (event) {
	}) */
}


function fetchContactdata() {
	empid = $('#empid').val();
 	$.post('../contact/fetch',{empid:empid}, function(json) {
 		//alert(json);
 		console.log(json);        
 		
 		var taRow = "";
 		$("#ContactTable").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			taRow += "<tr id="+val.id+">";
        	taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
	        	taRow += "<div><dl><dt>Created on:</dt><dd>"+val.created+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	        	taRow += "<dt>Last updated on:</dt><dd>"+val.last_updated+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
        		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
        	taRow += "<td>"+val.first_name+"</td>";
        	taRow += "<td>"+val.last_name+"</td>";
        	taRow += "<td>"+val.job_title+"</td>";
        	taRow += "<td>"+val.org_name+"</td>";
        	taRow += "<td>"+val.email_work+"</td>";
        	taRow += "<td>"+val.email_personal+"</td>";
        	taRow += "<td>"+val.work_ph_num+"</td>";
        	taRow += "<td>"+val.cell_ph_num+"</td>";
        	taRow += "<td><a onClick=\"fillContactData('"+val.id+"','"+val.first_name+"','"+val.middle_name+"','"+val.last_name+"', \
        			 '"+val.email_work+"','"+val.email_personal+"','"+val.work_ph_num+"','"+val.cell_ph_num+"','"+val.job_title+"','"+val.org_name+"', \
        			 '"+val.created_by+"');\" style='text-decoration: none;color:#f0ad4e;cursor: pointer;'><span class='icon-stack'><i class='icon-check-empty icon-stack-base'></i><i class='icon-pencil' style='margin-top: -2px;'></i></span></a></td>";
        	taRow += "<td><a onClick=\"DeleteContact('"+val.id+"');\" style='text-decoration: none;color:#d44950;cursor: pointer;'><span class='icon-stack'><i class='icon-check-empty icon-stack-base'></i><i class='icon-remove' style='margin-top: -2px;'></i></span></a></td>";
            taRow += "</tr>";   	
            console.log(taRow);
            $("#ContactTable").append(taRow);
            taRow = "";
 		});
 		load();
	}); 	
}

function fillContactData(id, first_name, middle_name, last_name, email_work, email_personal, work_ph_num, cell_ph_num, job_title, org_name, created_by){
	
	$('#btn-csubmit').hide();
	$('#btn-cupdate').show();
	
	$("#contactid").val(id);
    
    $("#ccreatedby").val(createdby);
    $("#cfirst_name").val(first_name);
    $("#cmiddle_name").val(middle_name);
    $("#clast_name").val(last_name);
    $("#cemail_work").val(email_work);
    $("#cemail_personal").val(email_personal);    
    $("#cwork_ph_num").val(work_ph_num);
    $("#ccell_ph_num").val(cell_ph_num);    
    $("#cjob_title").val(job_title);
    $("#corg_name").val(org_name);    
    
    $('#contactModal').modal('show');	
    /* $('#vendorModal').on('show.bs.modal', function (event) {
	}) */
}

function fetchVendordata() {
	empid = $('#empid').val();
 	$.post('../vendor/fetch',{empid:empid}, function(json) {
 		//alert(json);
 		console.log(json);
        /* var json = $.parseJSON(response);
 		console.log(json);  */
        
 		 var divcard = "";
 		$("#vendorcards").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			
	 		divcard+="	<div class='flip col-md-6' style='padding-bottom: 5px;'>";
	 		divcard+=		"<div class='card'>";
	 		divcard+=			"<div class='face front'>";
	 		divcard+=		"<h1 class='text-center' style='padding: 25px;'>"+val.vname+"</h1>";
	 		divcard+=	"</div>";
	 		divcard+=	"<div class='face back container-fluid'>";
	 		divcard+=		"<h4 class='text-left col-xs-9' style='padding: 0px;text-decoration: underline;'>Vendor Name: "+val.vname+"<small style='font-size: 50%;color:#000;'><a class='btn popoverOption' href='#' data-content='<div><dl>";
	 		divcard+=		 " <dt>Created on:</dt><dd>"+val.created+"</dd>";
	 		divcard+=		  "<dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	 		divcard+=		 " <dt>Last updated on:</dt><dd>"+val.last_updated+"</dd>";
	 		divcard+=		  "<dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd>";
	 		divcard+=		"</dl></div>' rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></small></h4>";
	 		divcard+=		"<div class='col-xs-1'></div>";
	 		divcard+=		"<div class='col-xs-2' style='margin-left: 26px;'>";
	 		divcard+=			"<a onclick=\"fillVendorData('"+val.id+"','"+val.vname+"','"+val.contact_person+"',\
	 					'"+val.ph_num_primary+"','"+val.ph_num_secondary+"','"+val.email_addr+"','"+val.payment_term+"','"+val.website+"',\
	 					'"+val.created_by+"');\" style='text-decoration:none;color:#f0ad4e;'><i class='icon-pencil'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;";
	 /* 		divcard+=		"</div>"; */
/* 	 		divcard+=		"<div class='col-xs-1'>"; */
	 		divcard+=			"<a class='' onclick=\"DeleteVendor("+val.id+");\" style='text-decoration: none;color:#d44950;'><i class='icon-remove'></i></a>";
	 		divcard+=		"</div>";
	 		divcard+=		"<div class='row' style='word-wrap: break-word;font-size:12px'>";
	 		divcard+=			"<div class='col-xs-4'>";
	 		divcard+=				"<dl class=''>";
	 		/* divcard+=				  "<dt>Vendor Name</dt><dd>"+val.vname+"</dd>"; */
	 		divcard+=				  "<dt>Contact person</dt><dd>"+val.contact_person+"</dd>";
	 		divcard+=				  "<dt>Vendor Name</dt><dd>"+val.vname+"</dd>";
	 		divcard+=				 "</dl>";
	 		divcard+=			 "</div>";
	 		
	 		divcard+=			"<div class='col-xs-4'>";
	 		divcard+=				"<dl class=''>";
	 		divcard+=				  "<dt>Contact person</dt><dd>"+val.contact_person+"</dd>";
	 		divcard+=				  "<dt>Email</dt><dd>"+val.email_addr+"</dd>";
	 		divcard+=				 "</dl>";
	 		divcard+=			 "</div>";
	 		
	 		
	 		divcard+=			 "<div class='col-xs-4'>";
	 		divcard+=			    "<dl class=''>";
	 		divcard+=				  "<dt>Payment term</dt><dd>"+val.payment_term+"</dd>";
	 		divcard+=				  "<dt>Website</dt><dd><a target='_blank' href='"+val.website+"'>"+val.website+"</a></dd>";
	 		divcard+=				"</dl>";
	 		divcard+=			 "</div> ";
	 		divcard+=		"</div>";
	 		divcard+=	"</div>";
	 		divcard+="</div>";
	 		divcard+= "</div>"; 	
            console.log(divcard);
            $("#vendorcards").append(divcard);
            divcard = "";
 		}); 
 		load(); 
	});
 	
}

function fetchAddressdata() {
	empid = $('#empid').val();
 	$.post('../address/fetch',{empid:empid}, function(json) {
 		//alert(json);
 		console.log(json);
        /* var json = $.parseJSON(response);
 		console.log(json);  */
        
 		var taRow = "";
 		$("#AddressTable").html("");
 		$.each(json, function(i, val) {
 			console.log(val.id);
 			taRow += "<tr id="+val.id+">";
        	taRow += "<td><a class='popoverOption' style='text-decoration: none;' href='#' data-content='";
	        	taRow += "<div><dl><dt>Created on:</dt><dd>"+val.created+"</dd><dt>Created by:</dt><dd>"+val.created_by+"</dd>";
	        	taRow += "<dt>Last updated on:</dt><dd>"+val.last_updated+"</dd><dt>Last updated by:</dt><dd>"+val.last_updated_by+"</dd></dl></div>'";
        		taRow += "rel='popover' data-placement='top' data-html='true' data-original-title='Created/Updated Details'><i class='icon-info-sign'></i></a></td>";
        	taRow += "<td>"+val.addr_type+"</td>";
        	taRow += "<td>"+val.addr_line1+"</td>";
        	taRow += "<td>"+val.addr_line2+"</td>";
        	taRow += "<td>"+val.city+"</td>";
        	taRow += "<td>"+val.state+"</td>";
        	taRow += "<td>"+val.county+"</td>";
        	taRow += "<td>"+val.zipcode+"</td>";
        	taRow += "<td>"+val.zipcode_ext+"</td>";
        	taRow += "<td>"+val.time_zone_cd+"</td>";
        	taRow += "<td><button class='btn btn-warning btn-xs' onClick=\"fillData('"+val.id+"','"+val.addr_type+"','"+val.addr_line1+"','"+val.addr_line2+"', \
        			 '"+val.addr_line3+"','"+val.city+"','"+val.state+"','"+val.district+"','"+val.country+"','"+val.county+"', \
        			 '"+val.zipcode+"','"+val.zipcode_ext+"','"+val.time_zone_cd+"','"+val.created_by+"');\"><i class='icon-edit-sign'></i></button></td>";
        	taRow += "<td><button class='btn btn-danger btn-xs' onClick=\"DeleteAddr('"+val.id+"');\"><i class='icon-remove-sign'></i></button></td>";
            taRow += "</tr>";   	
            console.log(taRow);
            $("#AddressTable").append(taRow);
            taRow = "";
 		});
 		load(); 
	});
 	
}

function DeleteAddr(aid){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('../address/delete',{aid:aid}, function(response){	
				bootbox.alert(response);
				$('#addressform')[0].reset();
				fetchAddressdata();
			});
		}
	}); 
}
function DeleteVendor(vid){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('../vendor/delete',{vid:vid}, function(response){
				bootbox.alert(response);
				$('#vendorform')[0].reset();
				fetchVendordata();
			});
		}
	}); 
}
function DeleteContact(cid){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('../contact/delete',{cid:cid}, function(response){
				bootbox.alert(response);
				fetchContactdata();
			});
		}
	}); 
}
function DeleteClient(clientid){
	bootbox.confirm("Are you sure?", function(result) {
		if(result==true){
			$.post('../client/delete',{clientid:clientid}, function(response){
				bootbox.alert(response);
				fetchClientdata();
			});
		}
	}); 
}

function fillVendorData(id, vname, contact_person, ph_num_primary, ph_num_secondary, email_addr, payment_term, website, createdby){
	
	$('#btn-vsubmit').hide();
	$('#btn-vupdate').show();
	
	$("#vendorid").val(id);
    
    $("#vcreatedby").val(createdby);
    $("#vname").val(vname);
    $("#vcontact_person").val(contact_person);
    $("#vph_num_primary").val(ph_num_primary);
    $("#vph_num_secondary").val(ph_num_secondary);
    $("#vemail_addr").val(email_addr);    
    $("#vpayment_term").val(payment_term);
    $("#vwebsite").val(website);    
    
    $('#vendorModal').modal('show');	
    /* $('#vendorModal').on('show.bs.modal', function (event) {
	}) */
}


function fillData(id, addrtype, addrline1, addrline2, addrline3, city, state, district, country, county, zipcode, zipcodeext, timezone, createdby){
	$('#divaddaddress').show();
	$('#btn-submit').fadeOut();
	$('#btn-update').fadeIn();
	
	$("#addressid").val(id);
    
    $("#createdby").val(createdby);
    $("#addr_type").val(addrtype);
    $("#addr_line1").val(addrline1);
    $("#addr_line2").val(addrline2);
    $("#addr_line3").val(addrline3);
    $("#city").val(city);
    
    $("#state").val(state);
    $("#district").val(district);
    $("#country").val(country);
    $("#county").val(county);
    
    $("#zipcode").val(zipcode);
    $("#zipcode_ext").val(zipcodeext);
    $("#time_zone_cd").val(timezone);

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

	$('#addAdrbtn').click(function(){
		//$('#addadrform')[0].reset();	
		$('#addressform')[0].reset();
		$('#divaddaddress').fadeIn("slow");
		$('#btn-update').fadeOut("slow");
		$('#btn-submit').fadeIn("slow");
	});
	$('.btn-cnl').click(function(){
		$('#divaddaddress').fadeOut("slow");
	});
	
	$('#addVendorbtn').click(function(){
		$('#vendorform')[0].reset();
		$('#btn-vsubmit').show();
		$('#btn-vupdate').hide();
	});
	
	$('#addContactbtn').click(function(){
		$('#contactform')[0].reset();
		$('#btn-csubmit').show();
		$('#btn-cupdate').hide();
	});
	
	$('#addClientbtn').click(function(){
		$('#clientform')[0].reset();
		$('#btn-clsubmit').show();
		$('#btn-clupdate').hide();
	});
	
	$('#addressform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();	   
	    //alert(values);	    
		$.post('../address/add', values, function(response) {
			bootbox.alert(response);
			$('#addressform')[0].reset();
			$('#divaddaddress').fadeOut("slow");
			fetchAddressdata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#vendorform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();	   
	    alert(values);	    
		$.post('../vendor/add', values, function(response) {
			$('#vendorModal').modal('hide');
			bootbox.alert(response);
			fetchVendordata();
			$('#vendorform')[0].reset();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#contactform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();	   
	    alert(values);	    
		$.post('../contact/add', values, function(response) {
			$('#contactModal').modal('hide');
			bootbox.alert(response);
			fetchContactdata();
			$('#contactform')[0].reset();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#clientform').submit(function(e) {
		// will pass the form date using the jQuery serialize function
		var values = $(this).serialize();	   
	    alert(values);	    
		$.post('../client/add', values, function(response) {
			$('#clientModal').modal('hide');
			bootbox.alert(response);
			fetchClientdata();
			$('#clientform')[0].reset();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#btn-update').click(function(e) {
		var values = $('#addressform').serialize();		 
	    values += "&id=" + encodeURIComponent($('#addressid').val());	
		//alert(values); 
		$.post('../address/update', values , function(response) {
			bootbox.alert(response);
			$('#addressform')[0].reset();
			$('#divaddaddress').fadeOut("slow");
			fetchAddressdata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#btn-vupdate').click(function(e) {
		var values = $('#vendorform').serialize();		 
	    values += "&id=" + encodeURIComponent($('#vendorid').val());	
		//alert(values); 
		$.post('../vendor/update', values , function(response) {
			bootbox.alert(response);
			$('#vendorform')[0].reset();
			$('#btn-vsubmit').show();
			$('#btn-vupdate').hide();
			$('#vendorModal').modal('hide');
			fetchVendordata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#btn-cupdate').click(function(e) {
		var values = $('#contactform').serialize();		 
	    values += "&id=" + encodeURIComponent($('#contactid').val());	
		//alert(values); 
		$.post('../contact/update', values , function(response) {
			bootbox.alert(response);
			$('#contactform')[0].reset();
			$('#btn-csubmit').show();
			$('#btn-cupdate').hide();
			$('#contactModal').modal('hide');
			fetchContactdata();
		});
		e.preventDefault(); // prevent actual form submit and page reload
	});
	
	$('#btn-clupdate').click(function(e) {
		var values = $('#clientform').serialize();		 
	    values += "&id=" + encodeURIComponent($('#clientid').val());	
		//alert(values); 
		$.post('../client/update', values , function(response) {
			bootbox.alert(response);
			$('#clientform')[0].reset();
			$('#btn-clsubmit').show();
			$('#btn-clupdate').hide();
			$('#clientModal').modal('hide');
			fetchClientdata();
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
