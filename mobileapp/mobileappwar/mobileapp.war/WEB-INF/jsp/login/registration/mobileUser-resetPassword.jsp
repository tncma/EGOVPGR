<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>

<!DOCTYPE html>
<html>
<head>
 
<title>Change Password</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="/mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="/mobile/jquery/css/jquery.toastmessage.css" />
<script src="/mobile/jquery/jquery-1.7.2.min.js"></script>
<script src="/mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="/mobile/jquery/jquery.toastmessage.js"></script> 
<script type="text/javascript">

 function errornotification(title,message){

//notice, warning, error, success

  $().toastmessage('showToast', {
            text     : message,
            sticky   : false,
            position : 'top-center',
            type     : title,
            closeText: '',
            close    : function () {
               
            }
        });
}
	function validateInput()
	{
	
	var inputval=document.getElementById("userName").value
		var status=true;
	
		if(inputval=="" || inputval=="Your email-id used during registration")
		{
			errornotification("error","Email Id cannot be empty");
			status=false;
		}
		return status;
	}

	<s:if test="%{mode=='view'}">
	
	alert("Password generated successfully ,Please check your email for the new password  ");		
	$(window.location).attr('href', '/mobile/login/registration/mobileUser!loginForm.action?registeredUserName=<s:property value="userName"/>');				
	</s:if>

</script>
</head>
<body>
<s:if test="%{mode!='view'}">
<div data-role="page" id="resetpage"  class="pageclass">
  <s:form action="mobileUser" name="resetPasswordForm" data-ajax="false"  id="resetPasswordForm" theme="simple"  onSubmit="return validateInput();">
			
			<s:hidden id="mode" name="mode" value="%{mode}"/>
			
		    <s:token/>
		    <s:if test="%{hasErrors()}"> 
					<div class="errorlabel">
						<s:actionerror/>
						<s:fielderror/>
					 </div>
					</s:if>
			<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/login/registration/mobileUser!loginForm.action" id="backtopgr" data-ajax="false" data-theme="b" data-icon="back" class="ui-btn-left">Back</a>
				<h5>Reset Password</h5>
			</div>

	<div data-role="content" name="contentMain" style="padding: 5px">
	 <div align="center" data-role="fieldcontain">
	        <span align="center" class="errorlabel" id="userNameError" ></span>
	</div>
	
	
				<div data-role="fieldcontain">
				<label id="whatLabel" for="userName">Email Id*:</label>
				<s:textfield name="userName" id="userName" class="input" value="Your email-id used during registration" onFocus="if (value == 'Your email-id used during registration') {value=''}" onBlur="if (value== '') {value='Your email-id used during registration';}"/>
			   </div>	
			   
			   
			<fieldset>
				<div>
				   <s:submit data-mini="true" value="Submit" cssClass="button1" onclick="return validateInput()" data-theme="b" id="saveButton" method="generateNewPassword" name="button" />
				</div>
	       </fieldset>
			</div>
			
		
			</s:form>
</div>
</s:if>
<s:else>
<div align="center">
<s:textfield id="userName" name="userName" value="%{userName}"/>
	<h3>Password generated successfully ,Please check your email for the new password</h3> 
</div>	
</s:else>		
</body>
</html>
