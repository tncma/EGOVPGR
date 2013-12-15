<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#center_content {
	text-align: center;
	min-height: 400px;
}

#homepage {
	width: 250px;
	margin: 0px auto;
	display: block;
	clear: both;
	text-align: center;
}

.homepage_icon {
	display: block;
	padding: 15px;
	float: left;
}

p {
	margin: 0;
	padding: 0;
}

* {
	margin: 0;
	padding: 0;
}

.footer {
 opacity: 1; 
 background-color: rgba(0,0,0,0.6); 
}

</style>

<title>Grievances</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet"
	href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="../jquery/css/jquery.toastmessage.css" />
<script src="../jquery/jquery-1.7.2.min.js"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="../jquery/jquery.toastmessage.js"></script>

</head>
<body>
	<s:if test="%{hasErrors()}">
		<div class="errorstyle">
			<s:actionerror />
			<s:fielderror />
		</div>
	</s:if>
	<s:if test="%{hasActionMessages()}">
		<div class="errorstyle">
			<s:actionmessage />
		</div>
	</s:if>

	<s:form action="registerGrievance.action" method="post"
		enctype="multipart/form-data" theme="simple" name="tablet" id="tablet"
		data-ajax="false">
		<div data-role="page" id="home" data-position="fixed">
			<div data-theme="b" data-role="header" data-position="fixed">
				<h6 align="left">Welcome to PGR</h6>
			</div>
			<div data-role="content">
				<div id="center_content">
					<div id="homepage">
						<s:iterator value="homePageInfoMap">
							<a href="<s:property value="%{value}"/>" class="homepage_icons">
								<img src="../images/<s:property value="%{key}"/>.jpeg" alt=""
								width="50" height="50">
							</a>
							<p>
								<s:property value="%{key}" />
							</p>
						</s:iterator>
					</div>
				</div>
			</div>
			<div data-role="footer" data-position="fixed">
				<div data-role="navbar" class="footer" >

					<ul>
						<li><a href='mobileHomepage.action' data-direction="reverse">
								<img src="../images/home.png" alt="" width="25" height="25">
								<p>Homescreen</p>
						</a></li>
						<li><a href="http://egovernments.org/index.php/about-us.html"
							target="_blank" data-rel="external"> <img
								src="../images/about.png" alt="" width="25" height="25">
								<p>About Us</p>
						</a></li>
						<li><a id="logouthref" href="#"
							onclick="javascript:top.location='/mobile/logout.do';top.opener.location='mobile/logout.do';">
								<img src="../images/logout.jpeg" alt="" width="25" height="25">
								<p>Log Out</p>
						</a></li>
					</ul>
					<p align="center" style="font-size: 10px">© 2013 eGovernments
						Foundation</p>
				</div>
			</div>
		</div>
	</s:form>
</body>
</html>
