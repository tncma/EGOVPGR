<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.th-groups th { 
		text-align:center;
		background-color:rgba(0,0,0,.1);
		border-right:1px solid #fff;
	 }
	.th-groups th.totals { 
		background-color:rgba(0,0,0,.5);
		color:#fff;
		text-shadow:none;
	 }


	/* Show priority 1 at 320px (20em x 16px) */ 
	@media screen and (min-width: 20em) {
	   th.ui-table-priority-1,
	   td.ui-table-priority-1 {
	     display: table-cell;
	   }
	}
	/* Show priority 2 at 480px (30em x 16px) */ 
	@media screen and (min-width: 30em) {
	   th.ui-table-priority-2,
	   td.ui-table-priority-2 {
	     display: table-cell;
	   }
	}
	/* Show priority 3 at 640px (40em x 16px) */ 
	@media screen and (min-width: 40em) {
	   th.ui-table-priority-3,
	   td.ui-table-priority-3 {
	     display: table-cell;
	   }
	}
	/* Show priority 4 at 800px (50em x 16px) */ 
	@media screen and (min-width: 50em) {
	  th.ui-table-priority-4,
	  td.ui-table-priority-4 {
	     display: table-cell;
	   }
	}
	/* Show priority 5 at 960px (60em x 16px) */ 
	@media screen and (min-width: 60em) {
	  th.ui-table-priority-5,
	  td.ui-table-priority-5 {
	     display: table-cell;
	   }
	}
	/* Show priority 6 at 1200 (75em x 16px) */ 
	@media screen and (min-width: 75em) {
	  th.ui-table-priority-6,
	  td.ui-table-priority-6 {
	     display: table-cell;
	   }
	}
	/* Manually hidden */ 
	th.ui-table-cell-hidden,
	td.ui-table-cell-hidden {
	  display: none;
	}

	/* Manually shown */
	th.ui-table-cell-visible,
	td.ui-table-cell-visible {
	   display: table-cell;
	}
	</style>
<style type="text/css">
.rounded-corners {
	-moz-border-radius: 20px;
	-webkit-border-radius: 20px;
	-khtml-border-radius: 20px;
	border-radius: 20px;
}

p {
	margin: 0;
	padding: 0;
}

* {
	margin: 0;
	padding: 0;
}
</style>
<title>View Complaint</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet"
	href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<script src="../jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
	
</script>

</head>

<body onload="">
	<form action="registerGrievance.action" method="post"
		enctype="multipart/form-data" name="tablet" id="tablet"
		data-ajax="false">
		<s:push value="model">
			<div data-role="page" id="viewcomplaint" data-add-back-btn="true"
				class="pageclass">

				<!-- /header -->
				<div data-theme="b" data-role="header" data-position="fixed" >
				<a href="javascript:history.back(1)" 	data-ajax="false" data-icon="arrow-l" data-transition="none"
					data-theme="b" class="ui-btn-left">Back</a>
					<a href="/mobile/pgr/registerGrievance!newform.action"
						data-iconpos="notext" data-icon="home"  	data-ajax="false" data-transition="none" data-theme="b"
						class="ui-btn-right">Home</a>
					<h5>View Complaint</h5>
				</div>

				<div class="ui-grid-a ui-responsive"
					style="padding-top: 0%; align: center;">

					<div class="ui-block-a">
						<div class="ui-body ui-body-b">
							<b>Complaint Number</b>
						</div>
						<div class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.complaintno}" />
						</div>
					</div>

					<div class="ui-block-b">
						<div class="ui-body ui-body-b">
							<b>Complainer's Address </b>
						</div>
						<div class="ui-body ui-body-g" data-role="content">
							<s:property value="%{comp.getComplainantAddress()}" default="N/A" />
						</div>
					</div>

					<div class="ui-block-a">
						<div class="ui-body ui-body-b">
							<b> Complaint Category/Type</b>
						</div>
						<div class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.complainttype}" />
						</div>
					</div>

					<div class="ui-block-b">
						<div class="ui-body ui-body-b">
							<b> Complaint Details </b>
						</div>
						<div class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.complaintdetails}" />
						</div>
					</div>

					<div class="ui-block-a">
						<div class="ui-body ui-body-b">
							<b>Complaint Status</b>
						</div>
						<div class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.status}" />
						</div>
					</div>
					<div class="ui-block-b">
						<div class="ui-body ui-body-b">
							<b>Last Update Remarks </b>
						</div>
						<div class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.lastUpdatedComment}" />
						</div>
					</div>
				</div><!--
				 Commented this for the hackathon demo
				   <div data-mini="true" data-role="collapsible" data-content-theme="c" data-iconpos="right">
                             <h3 align="center">Update Comments</h3>
  					
						<div data-mini="true"  data-role="content" align="center">
						<s:hidden id="complaintId" name="complaintId" />
						<textarea data-mini="true" cols="20" rows="8" id="comments" data-inline="true" name="comments" maxlength="512"></textarea>
                        <s:submit  align="center" data-mini="true" data-theme="b" data-role="button" data-inline="true" method="updateComments" value="Submit Comments" />
						
					    </div>
				
                </div>
					<fieldset align="center">
				   <div><a href="#transactionhistory"  data-role="button" data-theme="b" data-mini="true" data-inline="false">View Transaction History</a></div>
				   </fieldset>
			    -->
			    <fieldset align="center">
				   <div><a href="#contractorInfo"  data-role="button" data-theme="b" data-mini="true" data-inline="false">Contractor Info</a></div>
				   </fieldset>
			 
				
				
  </div>
  
  
  
  <!--
   Added the following div for the hackathon demo
  -->
  		<div data-role="page" id="contractorInfo" data-add-back-btn="true"
				class="pageclass">
 
				<!-- /header -->
				<div data-theme="b" data-role="header" data-position="fixed" >
				<a href="javascript:history.back(1)" 	data-ajax="false" data-icon="arrow-l" data-transition="none"
					data-theme="b" class="ui-btn-left">Back</a>
					<a href="/mobile/pgr/registerGrievance!newform.action"
						data-iconpos="notext" data-icon="home"  	data-ajax="false" data-transition="none" data-theme="b"
						class="ui-btn-right">Home</a>
					<h5>Contractor / WorkOrder Info</h5>
				</div>

				<div class=" "
					style="padding-top: 0%; align: center;">

					<div>
						<div align="center" class="ui-body ui-body-b">
							<b>Contractor Name</b>
						</div>
						<div align="center" class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.contractorName}" />
						</div>
					</div>

					<div>
						<div align="center" class="ui-body ui-body-b">
							<b>Contractor Address </b>
						</div>
						<div align="center" class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.contractorAddress}" default="N/A" />
						</div>
					</div>

					<div>
						<div align="center" class="ui-body ui-body-b">
							<b> Contractor Number</b>
						</div>
						<div align="center" class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.contractorNumber}" />
						</div>
					</div>
<div>
						<div align="center" class="ui-body ui-body-b">
							<b>WorkOrder Name</b>
						</div>
						<div align="center" class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.workOrderNumber}" />
						</div>
					</div>

					<div>
						<div align="center" class="ui-body ui-body-b">
							<b>WorkOrder FromDate </b>
						</div>
						<div align="center" class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.workOrderFromDate}" default="N/A" />
						</div>
					</div>

					<div>
						<div align="center" class="ui-body ui-body-b">
							<b> WorkOrder ToDate</b>
						</div>
						<div align="center" class="ui-body ui-body-g" data-role="content">
							<s:property value="%{complaint.workOrderToDate}" />
						</div>
					</div>
					

					
				</div>
			 
				
				
  </div>
  
  
  
  
  
  
  
  
  
  <div data-role="page" id="transactionhistory" data-add-back-btn="true" class="pageclass">

		<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/pgr/registerGrievance!newform.action" data-icon="home" data-ajax="false" data-transition="none"
					data-iconpos="notext" data-theme="b" class="ui-btn-right">Home</a>
				<h5>View Complaints</h5>
			</div>
	 <div align="center" style="padding: 5px," data-role="content" class="ui-content" role="main">Complaint History</div>
	 <div align="center" style="padding: 10px," data-role="content" class="ui-content" role="main"></div>
						<s:if test="%{complaintHistory.getSize()!=0}">
							<table   data-role="table" id="historytable"
								data-mode="columntoggle"
								class="ui-body-d ui-shadow table-stripe ui-responsive"
								data-column-btn-theme="b"
								data-column-btn-text="Columns to display..."
								data-column-popup-theme="c"
								data-mini="true" >
								<thead>
									<tr data-mini="true" class="ui-bar-b">
										
										<th data-mini="true" data-priority="1">Role</th>
										<th data-mini="true" data-priority="2">Date</th>
										<th data-mini="true" data-priority="3">User Name</th>
										<th data-mini="true" data-priority="4">Complaint Status</th>
										<th data-mini="true" data-priority="5">Messages</th>
									
										
									</tr> 
								</thead> 
								<tbody data-mini="true">
									<s:iterator value="listComm" status="status">
										<tr data-mini="true">
											<td data-mini="true"><s:property value="%{fromUserName}" default="N/A" /></td>
											<td data-mini="true"><s:property value="%{commDate}" default="N/A" /></td>
											<td data-mini="true"><s:property value="%{roleName}" default="N/A" /></td>					
											<td data-mini="true"><s:property value="%{statusName}" default="N/A" /></td>
										    <td data-mini="true"><s:property value="%{message}" default="N/A" /></td>
											
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</s:if>
						<s:else>
							<p align="center">
								<strong>No Messages available For this Complaint</strong>
							</p>
						</s:else>
					</div>
				
			
		
		</s:push>
	</form>
</body>
</html>