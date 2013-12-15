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
jQuery.noConflict();
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

function checkPasswordLength()
{
	if(jQuery('#newPassword').val()!='' && jQuery('#newPassword').val().length<8)
	{
			alert("Passwords should be atleast 8 characters");
			jQuery('#newPassword').val("");
			return false;
	}		
}
function checkPasswords()
{
	if(jQuery('#newPassword').val()!=jQuery('#confirmNewPassword').val())
	{
			alert("New Password and Confirm Password are not same");
			jQuery('#confirmNewPassword').val("");
			return false;
	}		
}
function validateInput()
{
	var status=true;
	jQuery('#currentPasswordError').html("");
	jQuery('#newPasswordError').html("");
	jQuery('#confirmNewPasswordError').html("");
	
	if(jQuery('#currentPassword').val()=="")
	{
		jQuery('#currentPasswordError').html('Cannot be empty');
		status=false;
	}
	if(jQuery('#newPassword').val()=="")
	{
		jQuery('#newPasswordError').html('Cannot be empty');
		status=false;
	}
	if(jQuery('#confirmNewPassword').val()=="")
	{
		jQuery('#confirmNewPasswordError').html('Cannot be empty');
		status=false;
	}
	return status;
}

</script>
</head>
<body>
<div data-role="page"   class="pageclass">
  <s:form action="mobileUserModify" name="changePasswordForm" data-ajax="false" id="changePasswordForm" theme="simple"  onSubmit="return validateInput()">
			<s:push value="model">
			<s:hidden id="mode" name="mode" value="%{mode}"/>
		    <s:hidden id="portalUserId" name="portalUserId" value="%{portalUserId}"/>
			<s:token/>
			
					<s:if test="%{hasErrors()}"> 
					<div class="errorlabel">
						<s:actionerror/>
						<s:fielderror/>
					 </div>
					</s:if>
				<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/pgr/registerGrievance!newform.action" id="backtopgr" data-ajax="false" data-theme="b" data-icon="back" class="ui-btn-left">Back</a>
				<h5>Registration Form</h5>
			</div>

	<div data-role="content" name="contentMain" style="padding: 5px">
	 <div align="center" data-role="fieldcontain">
	        <span align="center" class="errorlabel" id="userNameError" ></span>
	</div>
	
	
				<div data-role="fieldcontain">
				<label id="whatLabel" for="currentPassword">Current Password*:</label>
				<s:password  name="currentPassword" id="currentPassword" maxlength="30"  data-mini="true"   />
			   </div>	
			   <div data-role="fieldcontain">
				<label id="whatLabel" for="newPassword">New Password*:</label>
				<s:password  name="newPassword" id="newPassword" maxlength="30"  onBlur="checkPasswordLength()" data-mini="true"   />
			   </div>	
			   <div data-role="fieldcontain">
				<label id="whatLabel" for="confirmNewPassword">Confirm New Password:</label>
				<s:password  name="confirmNewPassword" id="confirmNewPassword" maxlength="30"  onBlur="checkPasswords()" data-mini="true"   />
			   </div>	
			<fieldset>
				<div>
				   <s:submit data-mini="true" value="Submit" cssClass="button1" onclick="return validateInput()" data-theme="b" id="saveButton" method="saveChangePassword" name="button" />
				</div>
	       </fieldset>
			</div>
			
			</s:push>
			</s:form>
</div>		
</body>
</html>
