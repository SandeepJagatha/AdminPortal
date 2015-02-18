<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
    <html lang="en">
    <head>
    	<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    	<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tabner Admin</title>

        <link href="<c:url value="/resources/assets/css/bootstrap.css" />" rel="stylesheet" />
        <link href="<c:url value="/resources/assets/css/customization.css" />" rel="stylesheet" media="screen">
        <link href="<c:url value="/resources/assets/css/font-awesome.min.css" />" rel="stylesheet" media="screen">
        <link href="<c:url value="/resources/assets/css/bootstrap-datetimepicker.css" />" rel="stylesheet" media="screen">
        <link href="<c:url value="/resources/assets/datatable/css/jquery.dataTables_themeroller.min.css" />" rel="stylesheet" media="screen">
        <link href="<c:url value="/resources/assets/css/dropzone.css" />" rel="stylesheet" media="screen">
        

        <script src="<c:url value="/resources/assets/js/jquery-2.1.0.min.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/bootstrap.min.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/bootstrap-datetimepicker.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/jquery-ui.js"/>"></script>
        <script src="<c:url value="/resources/assets/js/bootbox.js"/>"></script>
        <script src="<c:url value="/resources/assets/datatable/js/jquery.dataTables.min.js"/>"></script>
		<script src="<c:url value="/resources/assets/datatable/js/dataTables.js"/>"></script>
		<script src="<c:url value="/resources/assets/js/jquery.fileupload.js"/>"></script>
		<script src="<c:url value="/resources/assets/js/jquery.iframe-transport.js"/>"></script>
		<script src="<c:url value="/resources/assets/js/jquery.ui.widget.js"/>"></script>
		<script src="<c:url value="/resources/assets/js/myuploadfunction.js"/>"></script>
        
		<style>
            body {    
			    position: relative;
			    padding-top: 60px;
			    padding-bottom: 40px;
			    background-image: url("<c:url value="/resources/assets/img/adminbg.jpg"/>");
			}
			ul.nav a:hover {
				 color: white !important; 
				 background-color: #337ab7 !important; 
			}
			.navbar-inverse .navbar-nav li a.active {
				color: white !important; 
				 background-color: #337ab7 !important; 
			}
			
			.navbar-inverse .navbar-nav li a.active, .navbar-inverse .navbar-nav li a.active:hover,
				.navbar-inverse .navbar-nav li a.active:focus {
				color: white !important; 
				 background-color: #337ab7 !important; 
			}
        </style>
        <style>
			.sidebar-nav {
				padding: 9px 0;
			}
			
			.dropdown-menu .sub-menu {
				left: 100%;
				position: absolute;
				top: 0;
				visibility: hidden;
				margin-top: -1px;
			}
			
			.dropdown-menu li:hover .sub-menu {
				visibility: visible;
			}
			
			.dropdown:hover .dropdown-menu {
				display: block;
			}
			
			.nav-tabs .dropdown-menu, .nav-pills .dropdown-menu, .navbar .dropdown-menu
				{
				margin-top: 0;
			}
			
			.navbar .sub-menu:before {
				border-bottom: 7px solid transparent;
				border-left: none;
				border-right: 7px solid rgba(0, 0, 0, 0.2);
				border-top: 7px solid transparent;
				left: -7px;
				top: 10px;
			}
			
			.navbar .sub-menu:after {
				border-top: 6px solid transparent;
				border-left: none;
				border-right: 6px solid #fff;
				border-bottom: 6px solid transparent;
				left: 10px;
				top: 11px;
				left: -6px;
			}
		</style>

		<style>
			.table tbody tr td{
				border-top: none;
			}
        </style>
      
    </head>

    <body>
	<!-- <form method="get" action="header.php" name="form1"> -->
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		  <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex8-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index" id="dashboard">Tabner Admin v.1.0</a>
            </div>
            
            <div class="collapse navbar-collapse navbar-ex8-collapse">
              <ul class="nav navbar-nav">  
              	  <%-- <li class='dropdown'>
             	  		<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Employees <span class='caret'></span></a>
	                    <ul class='dropdown-menu'>
	                    	<li><a href='../employee/add'> Add Employees</a></li>
	                    	<c:choose>
			                     <c:when test="${tdmin.is_admin =='1'}">
								     <li><a href='../main/manage_employers'> Manage Employees</a></li>
									 <li><a href='../main/schedule'>Employees List</a></li>
							      </c:when>
							      <c:otherwise>
							      
							      </c:otherwise>
							 </c:choose>
	                    </ul>
	                </li> --%>
	                <c:choose>
	                     <c:when test="${tdmin.is_admin =='1'}">
						     <!-- <li><a href='../employee/add'> Employees</a></li> -->
					      </c:when>
					      <c:otherwise>
					      
					      </c:otherwise>
					 </c:choose>
	                <li><a href='../lead/leads' id="leadli" style="margin-right:1px;"> Leads </a></li>
					<li><a href='../employee/employees' id="empli" class="" style="margin-right:1px;"> Employees</a></li>
	                <li><a href='../contact/getallcontacts' id="contactsli" style="margin-right:1px;"> Contacts </a></li>
	                <li><a href='../vendor/getallvendors' id="vendorsli" style="margin-right:1px;"> Vendors </a></li>
	                <li><a href='../client/getallclients' id="clientsli" style="margin-right:1px;"> Project/Clients </a></li>
	                <li><a href='../invoice/reports' id="leadsli" style="margin-right:1px;"> Invoice </a></li>
	                <li><a href='../report/reports' id="leadsli" style="margin-right:1px;"> Reports </a></li>
	                <!-- <li class='dropdown'>
                           <a href='#' class='dropdown-toggle' data-toggle='dropdown'> Reports<b class='caret'></b></a>
                            <ul class='dropdown-menu'>
                               <li><a href='#'> Employee Roster</a></li>
                            </ul>
                     </li> -->
                     <c:choose>
					      <c:when test="${tdmin.is_admin =='1'}">
						      <li class='dropdown' id="adminli">
		 		                    <a href='#' class='dropdown-toggle' data-toggle='dropdown'><span class='glyphicon glyphicon-user'></span> Admin <span class='caret'></span></a>
		 		                    <ul class='dropdown-menu'>
		 		                        <li><a href='../tdmin/manageusers' > Admin</a>	</li>
		 		                        <li><a href='../settings/listofvalues'> Settings</a></li>
		 		                    </ul>
		 		             </li>
		 		             <li>
		 		             	 <a href='../org/view' id="adminli"> Organization</a>
		 		             </li>
					      </c:when>
					      <c:otherwise>
					      
					      </c:otherwise>
					</c:choose>
 		             <li class='dropdown'>
                            <a href='#' class='dropdown-toggle' data-toggle='dropdown'> Help<b class='caret'></b></a>
                            <ul class='dropdown-menu'>
                                <li><a href='#'> Help</a></li></ul>
                      </li> 
              </ul>              
              <ul class="nav navbar-nav pull-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <strong>${tdmin.firstname} ${tdmin.lastname}</strong>
                       <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="../tdmin/pwdreset"> Password Reset</a></li>
                        <li><a href="../logout"> Logout</a></li>
                    </ul>
                </li>
              </ul>  
 		     </div>        
		</nav>

        <script type="text/javascript">
            
        </script>