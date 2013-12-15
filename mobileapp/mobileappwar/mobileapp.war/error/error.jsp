<%@ page isErrorPage="true"%>
<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<% 

	 String msg = null;
	 String sentMail = null;
	 sentMail = (String)request.getSession().getAttribute("mailSent");
	 
	 if("true".equals(sentMail)) {
		 msg = (String)request.getSession().getAttribute("errMessage");
		 if (msg == null)
			 msg = "Sorry, your request can not be processed due to Internal Server Error";
		 request.getSession().removeAttribute("errMessage");
		 request.getSession().removeAttribute("mailSent");
	 } else {
		 msg =(String) exception.getLocalizedMessage();
		 request.getSession().setAttribute("errMessage", msg); 	 
	 }	 
%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" media="all" href="/egi/css/egov.css" />
		<title>Error</title>
		<script type="text/javascript"> 

		 function onBodyLoad() {
		 	if("<%=sentMail%>" == "true") { 
		    	document.getElementById('msgRow').style.display="block";
		    } else {
				document.getElementById('msgRow').style.display="none";
			}
		}

		 function buttonpress(){
			var flag = confirm("Do you want to send Error Report ?"); 
			if(flag) {
			    document.errorForm.action="${pageContext.request.contextPath}/error/errorPage.do?submitType=sendErrorMail";
			    document.errorForm.submit();  	  
			} else {
			    return false;   
			} 
		 } 
	</script>
	</head>
	<body onload="onBodyLoad()">
		<table class="tableStyle" align="center">
			<tr>
				<td>
					<div id="main">
						<div id="m2">
							<div id="m3">
								<div align="center">
									<html:form action="/error/errorPage">
										<table id="mytable" class="tableStyle" border=1 width="754">
											<tbody>
												<tr>
													<td class="tableStyle" align="center" height="27"
														width="772">
														<p align="center">
															An error has occurred! Please try again or contact the
															administrator if the problem persists.
														</p>
													</td>
												</tr>
												<tr>
													<td height="15" class="tableStyle"></td>
												</tr>
												<tr>
													<td align="center" width="728" height="30">
														<p class="smalltext">
															<input type="button" value="Send Error Report" onclick="return buttonpress();" />
														</p>
													</td>
												</tr>

												<tr style="display: none" id="msgRow">
													<td class="tableheader" align="middle" width="728" height="30">
														<p align="center">
															<b><font color="blue">Error Report has successfully sent. </font>
															</b>
														</p>
													</td>
												</tr>
											</tbody>
										</table>
									</html:form>
								</div>
							</div>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>