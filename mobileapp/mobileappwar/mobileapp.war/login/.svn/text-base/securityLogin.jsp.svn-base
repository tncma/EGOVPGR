<!DOCTYPE html>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%@page import="org.egov.infstr.utils.StringUtils"%>
<%@taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page
	import="org.egov.infstr.utils.EgovMasterDataCaching,
		org.egov.infstr.utils.EGovConfig,
		org.egov.lib.admbndry.CityWebsiteDAO,
		org.egov.lib.admbndry.CityWebsite,
		java.util.ArrayList,
		org.egov.lib.security.terminal.dao.UserValidateDAO,
		org.egov.lib.security.terminal.dao.UserValidateHibernateDAO,
		org.egov.lib.security.terminal.model.Location"%>

<%
ArrayList locationList = null;
ArrayList locationParentList = null;
locationList = (ArrayList)EgovMasterDataCaching.getInstance().get("egi-location");
locationParentList = (ArrayList)EgovMasterDataCaching.getInstance().get("egi-locationparent");
	String cityUrl = (String) session.getAttribute("cityurl");
   	CityWebsiteDAO cityWebsiteDAO = new CityWebsiteDAO();
	CityWebsite cityWebsite = cityWebsiteDAO.getCityWebSiteByURL(cityUrl);
	String cityName = cityWebsite.getCityName();
	String logoName = cityWebsite.getLogo();
	/*This code will fetch the request root IP Address*/
	String ipAddress = request.getRemoteAddr();
	String proxiedIPAddress = request.getHeader("X-Forwarded-For");
	if (StringUtils.isNotBlank(proxiedIPAddress)) {
		String [] ipAddresses = proxiedIPAddress.split(",");
		ipAddress = ipAddresses[ipAddresses.length-1].trim();
	}
	%>
<!--
        REMOTE IP ADDRESS USING getRemoteAddr :<%=request.getRemoteAddr()%>
        REMOTE IP ADDRESS USING getHeader("X-Forwarded-For") :<%=request.getHeader("X-Forwarded-For")%>
        FINAL IP ADDRESS GOING TO USE :  <%=ipAddress%>
    -->

<c:set var="locationList" value="<%=locationList%>" scope="page" />
<c:set var="locationParentList" value="<%=locationParentList%>"
	scope="page" />

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=cityName%> Portal Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link rel="stylesheet"
	href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="../jquery/css/jquery.toastmessage.css" />
<script src="../jquery/jquery-1.7.2.min.js" type="text/javascript"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript" src="common/js/portal.js"></script>
<script type="text/javascript"
	src="<c:url value='/commonjs/ajaxCommonFunctions.js' />"></script>
<script type="text/javascript" src="../jquery/jquery.toastmessage.js"></script>
<script>
var locationbased = false;
var dataLength = new Array();
   	function buttonpress() {
		if (validate() == false) {
			return false;
		}
		document.getElementById("ipAddress").value = "<%=ipAddress%>";
		
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

		if (locationbased) {
			if (document.getElementById("locationname").value == "") {
				errornotification("error","Please select the Location");
				return false;
			} else if (document.getElementById("counterId").value == "") {
				errornotification("error","Please select the Counter");
				return false;
			}
		}
	}

   	function bodyonload() {
		document.getElementById("j_username").setAttribute("autocomplete","off");
	    document.getElementById("j_password").setAttribute("autocomplete","off");
	    document.getElementById("UserValidateForm").setAttribute("autocomplete","off"); 		
		document.getElementById("j_username").focus();
 	}
 
 	function checkRole () {
 		var username = document.getElementById("j_username").value;
 		if(username !== "") {
 			var link = "${pageContext.request.contextPath}/login/TerminalAjax.jsp?username="+username;
			var request = initiateRequest();
			request.open("GET", link, false);
			
			if (!document.all) {
				request.send(null);
				if (request.status) {
					var response = request.responseText.split("|");
					prepareLoginScreen (response[0],response[1]);
				}
				
				return ;					
			} 
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					if (request.status == 200) {
							var response = request.responseText.split("|");
							prepareLoginScreen (response[0],response[1])
					}
				}
			};
			request.send(null);
		}
	}
	
	function prepareLoginScreen (locationbased,locationid) {
		
		locationid = locationid.split("^");
			
		for(var u = 0; u < locationid.length; u++) 	{
			dataLength[u]=locationid[u];
		}
			
		locationid = dataLength[0];
		if("true" == locationbased) {
			document.getElementById('loginType').value = "Location";
			document.getElementById('loc').style.display = "block";
			document.getElementById('loc1').style.display = "block";
			document.getElementById('cou').style.display = "block";
			document.getElementById('cou1').style.display = "block";
			var locationObj = document.getElementById('locationname');

			<c:forEach var="obj" items="${locationParentList}" >
			if (locationid == '${obj.id}') {
				locationObj.value = '${obj.name}';
				document.getElementById('locationId').value = '${obj.id}';		
			}
			</c:forEach>
			document.getElementById('couId').value = dataLength[1];		
			loadTerminalFields();
		} else {
			document.UserValidateForm.loginType.value = "";
			document.getElementById('loc').style.display = "none";
			document.getElementById('loc1').style.display = "none";
			document.getElementById('cou').style.display = "none";
			document.getElementById('cou1').style.display = "none";
		}
	}

 	function loadTerminalFields() {
     	var locationId = document.getElementById("locationId").value;
     	var couId = document.getElementById("couId").value;
		var terminalObj = document.getElementById("counterId");
		terminalObj.length = 0;
		terminalObj.options[0] = new Option('--- Choose ---','');
		var i = 1;
		<c:forEach var="obj" items="${locationList}" >
		if(couId != 0 && couId == ${obj.id} ) {
			terminalObj.options[i] = new Option('${obj.name}','${obj.id}');
			i++;
		}
		if(couId == 0 && locationId == '${obj.locationId.id}') {
			terminalObj.options[i] = new Option('${obj.name}','${obj.id}');
			i++;
		}	
		</c:forEach>
	}

	function checkEnterKey(e) {
		if(e.keyCode == 13 && !e.shiftKey && !e.ctrlKey && !e.altKey) {
			buttonpress();
		}
	}
	
	function closeWindow () {
		var x = window.close();
		window.setTimeout('if (!window.closed) {errornotification("notice","Please use Browser close button!");}',10);
		
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
</script>
</head>
<body onload="bodyonload()" onkeypress="checkCapsLock(event)">
	<form method="post" id="UserValidateForm" name="UserValidateForm"
		action="${pageContext.request.contextPath}/j_security_check"
		enctype="application/x-www-form-urlencoded">
		<div data-role="page" id="home" data-position="fixed">
			<div data-theme="b" data-role="header" data-position="fixed">

				<h6 align="left">Welcome to PGR</h6>
				<div id="notificationWrapper"></div>
			</div>

			<div data-role="content" style="padding: 5px">

				<input type="hidden" id="ipAddress" name="ipAddress" /> <input
					type="hidden" id="loginType" name="loginType" />
					 <input type="hidden" id="device" name="device" value="mobile" />
					  <input type="hidden" id="deviceUser" name="deviceUser" value="official" />
				<% if("true".equals(request.getParameter("error"))) { %>
				<div data-role="fieldcontain">
					<c:choose>
						<c:when
							test="${sessionScope.ACEGI_SECURITY_LAST_EXCEPTION.message == 'Maximum sessions of {0} for this principal exceeded'}">
							<script>
								errornotification("error","You have already logged in another session. Please log off from the other session to log in from this machine.");</script>
						</c:when>
						<c:otherwise>
							<script>
									errornotification("error","User Name or Password is invalid or you are not allowed to login from this terminal.");
								</script>
						</c:otherwise>
					</c:choose>
				</div>
				<%}%>
				<div data-role="content" align="center" data-mini="true" style="color: red;" >For Authorized
					Employees only</div>

				<div>
					<label id="name" for="name" data-inline="true">User
						Name: </label> <input type="text" id="j_username" name="j_username"
						tabindex="1" style="text-align: left" autocomplete="off"
						onblur="checkRole()" />
				</div>
				<div>
					<label id="password" for="password" data-inline="true">Password:
					</label> <input type="password" id="j_password" name="j_password"
						data-inline="true" tabindex="1" style="text-align: left"
						onkeydown="checkEnterKey(event)" autocomplete="off" />
				</div>
				<div data-role="fieldcontain">
					<div style="display: none" id="loc">
						<label>Location :</label>
						<div style="color: red">*</div>
					</div>
					<div style="display: none" id="loc1" class="smallfieldcell">
						<input type="text" id="locationname" name="locationname"
							tabindex="1" class="fieldinput" readonly="true" /> <input
							type="hidden" name="locationId" id="locationId" /> <input
							type="hidden" name="couId" id="couId" />
					</div>

					<div style="display: none" id="cou">
						<label>Counter :</label>
						<div style="color: red">*</div>
					</div>
					<div style="display: none" id="cou1" class="smallfieldcell">
						<select name="counterId" id="counterId" class="fieldinput"
							tabindex="1"></select>
					</div>
				</div>

				<div align="center">
					<div data-role="button" data-inline="false" data-theme="b"
						data-mini="true" onclick="buttonpress();">Login</div>
				</div>
			</div>
			<div id="tooltip"
				style="display: none; color: red; font-weight: bolder; font-size: 10px">CAPS
				LOCK : ON</div>
			<div data-theme="b" data-role="footer" data-position="fixed">
				<h8 align="center">© 2013 eGovernments Foundation</h8>
			</div>
		</div>
	</form>
</body>
</html>
