<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="org.egov.infstr.client.filter.EGOVThreadLocals"%>
<%@ taglib prefix="html" uri="/WEB-INF/struts-html.tld"%>
<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>eGov - Error Page</title>
	<link href="/egi/css/commonegov.css" rel="stylesheet" type="text/css" />
	<style>
.hiddenError {
	display: none;
}

.oopstext {
	font-family: Verdana, Geneva, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #F00;
	margin-bottom: 15px;
}
.loadImg {
		position:absolute;top:15%;left:20%;display:none;
		background:white;  color:#444; font:bold 11px tohoma,arial,helvetica;
}
.loadspan {
	position: absolute;width:200px;margin-left:5px;margin-top:8px
}
</style>
</head>
<body>
	<div id="loadImg" class="loadImg"><img src="../images/loading.gif"  />&nbsp;<span class="loadspan">Please wait... Sending error report...</span></div>
	<div class="formmainbox">
		<div class="insidecontent">
			<div class="errorroundbox2">
				<div class="errortop2">
					<div></div>
				</div>
				<div class="errorcontent2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="59%">
								<div class="logouttext">
									<img src="/egi/images/error.png" width="128" height="128"
										alt="Error" />
									<div class="oopstext">
										Oops! Sorry your request cannot be processed!
									</div>
									<span class="bold">Invalid Request!!!!! </span>
								</div>
								<s:actionerror />
							</td>
						</tr>
						
					</table>
				</div>
				
			</div>
		</div>
	</div>
	<div class="buttonbottom" style="position:absolute;bottom:0px;width:100%;clear:both;left:0px;right:0px">
		City Administration System Designed and Implemented by
		<a href="http://www.egovernments.org/">eGovernments Foundation</a> All
		Rights Reserved
	</div>

</body>
</html>