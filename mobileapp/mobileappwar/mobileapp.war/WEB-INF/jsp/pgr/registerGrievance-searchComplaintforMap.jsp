<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
<title>View Complaint</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="../jquery/css/jquery.toastmessage.css" /> 
 <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 90% }
            .ui-controlgroup-label {
    text-align: center;
}
    </style>

<style>
@media all and (max-width: 480px) {
#footers
    {
        display:none;
    }  
#infotable{
	    display:none;
	}  
    
}
</style>
<script src="../jquery/jquery-1.7.2.min.js"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="../jquery/map/jquery.ui.map.js"></script>
<script type="text/javascript" src="../jquery/jquery.toastmessage.js"></script>  
<script>

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



$(document).ready(function() {
	$('#showmap').click(function() {
	var month=($('#searchMonth').val())
var year=($('#searchYear').val())

if(month== -1){
   errornotification('error','Please Select Month');
return false;
}
else if(year == -1){
   errornotification('error','Please Select Year');
   return false;
}else{
 document.location.href="/mobile/pgr/registerGrievance!getallComplaintsforMap.action?searchMonth="+month+"&searchYear="+year
	}
	});
});


</script>
</head>  

<body >
	
	<form action="registerGrievance.action" method="get" name="tablet" id="tablet"	data-ajax="false">

	<div data-role="page" id="complaintdetails" data-add-back-btn="true"
				class="pageclass">
				<s:if test="%{hasErrors()}">
					<div class="required" style="color: red;font-size: 12px">
						<s:actionerror />
						<s:fielderror />
					</div>
				</s:if>
				<s:if test="%{hasActionMessages()}">
					<div class="errorstyle">
						<s:actionmessage />
					</div>
				</s:if>
			<div data-mini="true" data-theme="b" data-role="header"
				data-position="fixed" data-icon="home" data-transition="none"
				data-iconpos="notext" data-theme="b" class="ui-btn-right">
				<a href="javascript:history.back(1)" data-ajax="false"
					data-icon="arrow-l" data-transition="none" data-theme="b"
					class="ui-btn-left">Back</a>
				<h5>View My Complaints</h5>
			</div>

			<div align="center"  data-mini="true" data-role="content" id="contentMain" style="padding: 5px;">
					
					<div align="center" data-mini="true" data-role="fieldcontain" id="categoryType">
						<fieldset data-role="controlgroup" data-type="horizontal" data-mini="true">
                        <legend>Date</legend>
                        <label for="searchMonth">Month</label>
                        <s:select id="searchMonth" name="searchMonth" list="monthMap" listKey="key" 
                        listValue="value"  headerKey="-1" headerValue="Month"/></td>
                         
                          <label for="searchYear">Year</label>
                           <s:select id="searchYear" name="searchYear" list="dropdownData.yearlist"   headerKey="-1" headerValue="Year"/></td>
                        </fieldset>
					</div>
					
					
               
               </div>
                
                <div align="center">
					<div data-role="button" data-inline="false" data-theme="b"
						data-mini="true"  id="showmap" >Show</div>
				</div>
				
			</div>	
 

	</form>
</body>
</html>