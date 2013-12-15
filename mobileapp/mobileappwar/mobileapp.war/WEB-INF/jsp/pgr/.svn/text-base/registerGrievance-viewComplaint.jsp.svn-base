<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<!DOCTYPE html>
<html>
<head>

<title>View Complaint</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<script src="../jquery/jquery-1.7.2.min.js"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>


<style>

@media screen and (min-width: 20em) {
	   .my-custom-class th.ui-table-priority-1,
	   .my-custom-class td.ui-table-priority-1 {
	     display: table-cell;
	   }
	}
	/* Show priority 2 at 480px (30em x 16px) */
	@media screen and (min-width: 30em) {
	   .my-custom-class  th.ui-table-priority-2,
	   .my-custom-class td.ui-table-priority-2 {
	     display: table-cell;
	   }
	}

</style>




</head>

<body>
	
	<form action="#" method="get" name="tablet" id="tablet"	data-ajax="false">
	
	   
	
  <div data-role="page" id="viewcomplaint" data-add-back-btn="true"
			class="pageclass">

		<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/pgr/registerGrievance!newform.action" data-icon="home" data-transition="none"
					data-iconpos="notext" data-theme="b" class="ui-btn-right">Home</a>
				<h5>View Complaints</h5>
			</div>
	 
	 <div align="center" style="padding: 10px," data-role="content" class="ui-content" role="main"></div>
 		<s:if test="%{hasActionMessages()}"><div align="center" class="errorstyle"><h3><s:actionmessage /> <h3> </div>
		</s:if>
			<s:if test="%{reportlist.size!=0}">
				<table data-role="table" id="table-custom-2"
					data-mode="columntoggle"
					class="ui-body-d ui-shadow table-stripe ui-responsive"
					data-column-btn-theme="b"
					data-column-btn-text="Columns to display..."
					data-column-popup-theme="a">
					<thead>
						<tr data-mini="true" class="ui-bar-d">
							<th>Complaint Number</th>
							<th data-mini="true" data-priority="2">Complaint Type</th>
							<th data-mini="true" data-priority="3">Complaint Details</th>
							<th data-mini="true" data-priority="1">Status</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="reportlist" status="status">
							<tr data-mini="true">
								<th><a data-mini="true" href="/mobile/pgr/registerGrievance!viewComplaintDetails.action?complaintId=<s:property value="complaintid"/>"
									data-rel="external" data-ajax="false"><s:property value="%{complaintno}" /></a></th>
								<td data-mini="true"><s:property value="%{complainttype}" /></td>
								<td data-mini="true"><s:property value="%{complaintdetails}" /></td>
								<td data-mini="true"><s:property value="%{status}" /></td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</s:if>
			<s:else>
					     <p align="center"><strong>No Complaints Registered from this number <s:property value="%{mobileNumber}"/></strong></p>
						</s:else>
  </div>

	</form>
</body>
</html>