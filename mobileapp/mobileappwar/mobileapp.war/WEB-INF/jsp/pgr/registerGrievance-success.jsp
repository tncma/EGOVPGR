<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%@taglib prefix="egov" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>

<title>Register Grievances</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="../css/jquery.mobile-1.3.1.min.css" />

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>




<script type="text/javascript">

$(document)
			.ready(
					function() {
					var complaintnum=$("#complaintnumber").val();
					alert("Your complaint has been saved successfully\nThe complaint Number is "+complaintnum);		
					$(window.location).attr('href', '/mobile/pgr/registerGrievance!newform.action');				
					}
					
					);

 </script>
</head>
<body>

	<s:form action="registerGrievance!newform.action" method="post" enctype="multipart/form-data" theme="simple" name="tablet" id="tablet" data-ajax="false">
  	<s:token/>
	 <s:push value="model">	
	<div align="center">
	<h3>Complaint registered successfully.</h3> 
	<s:hidden id="complaintnumber" name="complaintnumber" value="%{complaint.complaintno}"></s:hidden>	
	</div>	
	 </s:push> 
	</s:form>
		
</body> 
</html>