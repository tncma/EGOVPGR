<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<!DOCTYPE html>
<html>
<head>
<style>
.ui-grid-a { margin-top:1em; padding-top:.8em; margin-top:1.4em; border-top:1px solid rgba(0,0,0,.1); }

@media all and (max-width: 480px) {
#footers
    {
        display:none;
    }  
#mapok{
	    display:none;
	}  
#cancelmap{
        display:none;
	}
    
}

		
      
</style>

<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="/mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="/mobile/jquery/css/jquery.toastmessage.css" /> 
<script src="/mobile/jquery/jquery-1.7.2.min.js"></script>
<script src="/mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="/mobile/jquery/jquery.toastmessage.js"></script> 
<script type="text/javascript">

   	function buttonpress() {
		if (validate() == false) {
			return false;
		}
	
		
		document.forms[0].submit();
	}

   	function validate() {
		if(document.getElementById("j_username").value == "") {
			errornotification("error","Please enter your User Name");
			return false;
		} else if (document.getElementById("j_password").value == "") {
			errornotification("error","Please enter your Password");
			return false;
		}
		}
	
	function checkCapsLock(e) {
		var kc = e.keyCode?e.keyCode:e.which;
		var sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false);
		 if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk)) {
		  	document.getElementById('tooltip').style.display = '';
		 } else {
		 	document.getElementById('tooltip').style.display = 'none';
		 }
	 
	}
 
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

function init(){
var regusername="";
regusername='<s:property value="registeredUserName"/>';
if(regusername!=""){
jQuery('#j_username').val(regusername);
}

}
 </script>
</head>
<body onload="init();" onkeypress="checkCapsLock(event)">
	<form method="post" id="UserValidateForm" name="UserValidateForm"
		action="${pageContext.request.contextPath}/j_security_check"
		enctype="application/x-www-form-urlencoded">
	<div data-role="page" id="complaintdetails" data-add-back-btn="true" class="pageclass">
	
			<div data-theme="b" data-role="header" data-position="fixed">
				
				<h5>Login</h5>
			</div>

	<div data-role="content" name="contentMain" style="padding: 5px">
                  <input type="hidden" id="ipAddress" name="ipAddress" />
				  <input type="hidden" id="cityName" name="cityName" />
				  <input type="hidden" id="todaysDate" name="todaysDate" />
				  <s:hidden  id="device" name="device" value="%{device}"/>
				   <s:hidden  id="deviceUser" name="deviceUser" value="%{deviceUser}"/>
				  	<% if("true".equals(request.getParameter("error"))) { %>
				<div data-role="fieldcontain">
					<c:choose>
						<c:when test="${sessionScope.ACEGI_SECURITY_LAST_EXCEPTION.message == 'Maximum sessions of {0} for this principal exceeded'}">
							<script>
							//	errornotification("error","You have already logged in another session. Please log off from the other session to log in from this machine.");</script>
						</c:when>
						<c:otherwise>
							<script>
									errornotification("error","User Name or Password is invalid or you are not allowed to login from this terminal.");
								</script>
						</c:otherwise>
					</c:choose>
				</div>
				<%}%>
				<div data-role="fieldcontain">
				<label id="whatLabel" for="j_username">Email Id*:</label>
				<s:textfield  name="j_username" id="j_username" value="%{j_username}" data-mini="true"   />
			
			</div>

				<div data-role="fieldcontain">
				<label id="whatLabel" for="j_password">Password*:</label>
				<s:password  name="j_password" id="j_password" maxlength="30"  data-mini="true"   />
			
			</div>								
		</div>
	   
		<fieldset align="center">
				<div><a href="#" onclick="buttonpress();" data-role="button" data-theme="b" data-mini="false" data-inline="false">Login</a></div>
			</fieldset>
  
   
   <div  style="margin-left: 5%;margin-top: 5%">
   
     <p><b>Forgot Password?</b><a href="/mobile/login/registration/mobileUser!resetPassword.action" data-ajax="false" data-role="button" data-theme="d" data-mini="true" data-inline="true">Click here</a> </p>
   
     <p><b>Not a user yet ?</b><a href="/mobile/login/registration/mobileUser!regform.action" data-ajax="false" data-role="button"  data-theme="b" data-mini="true" data-inline="true">Sign up</a> </p>
   
    </div>
    <div id="tooltip" style="display: none; color: red; font-weight: bolder; font-size: 10px">CAPSLOCK : ON</div>
    <div data-theme="b" data-role="footer" data-position="fixed">
			<h8 > <center> © 2013 eGovernments Foundation</center></h8>
		</div>
   
	</div>

	
	</form>
	<%
	if (request.getSession(false) != null) {
	System.out.println("printing after session validate "+session.getAttribute("device"));
    	session.invalidate();
    		
    	
	} 
	final Cookie cookies[] = request.getCookies();
	if ((cookies == null) || (cookies.length < 1)) {
		return;
	}
	for (final Cookie cookie : cookies) {
		cookie.setMaxAge(0);
		cookie.setPath("/");
		cookie.setValue(null);
		response.addCookie(cookie);
	}
%>
		
</body> 
</html>