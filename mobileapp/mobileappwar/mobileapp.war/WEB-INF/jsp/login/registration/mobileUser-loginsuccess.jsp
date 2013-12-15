<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<!DOCTYPE html>
<html>
<head>

<title>User Registered</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="/mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<script src="/mobile/jquery/jquery-1.7.2.min.js"></script>
<script src="/mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>




<script type="text/javascript">

$(document)
			.ready(
					function() {
					var name=$("#firstName").val();
					var emailid=$("#userName").val();
					alert("Thank you "+name+" for registering with us .Use your email "+emailid+" and password **** to login.. ");		
					$(window.location).attr('href', '/mobile/login/registration/mobileUser!loginForm.action?registeredUserName='+emailid);				
					}
					
					);

 </script>
</head>
<body>

	<s:form action="mobileUser.action" method="post" enctype="multipart/form-data" theme="simple" name="tablet" id="tablet" data-ajax="false">
  	<s:token/>
	 <s:push value="model">	
	<div align="center">
	<h3>User registered successfully.</h3> 
	<s:hidden id="firstName" name="firstName" value="%{firstName}"></s:hidden>	
		<s:hidden id="userName" name="userName" value="%{userName}"></s:hidden>	
	</div>	
	 </s:push> 
	</s:form>
		
</body> 
</html>