<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<!DOCTYPE html>
<html>
<head>
<title>Submit Receipt</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<script src="../jquery/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<style type="text/css">
 
.ui-block-a, .ui-block-b, .ui-block-c {

     text-align : center;
    
    }

</style>

<script type="text/javascript">


$(document).ready(function() {


if($('#mode').val()=="new"){
alert("Receipt saved successfully")
$('#amount').val('');
$('#manualReceiptNumber').val('');
}
			
});


function validateForm(){

var amount= $('#amount').val();
var receiptno= $('#manualReceiptNumber').val();

if(amount==""){
alert("please select the amount");
return false;
}


return true;
}

$('#listviewid li').live('click', function() {
   $('#amount').val($(this).attr('value'))
   
   $('#listviewid li').each(function() {
   $(this).removeClass('ui-bar-b');
  $(this).addClass('ui-bar-c');
   });
   
    if ($(this).hasClass('ui-bar-b')) {
        $(this).removeClass('ui-bar-b');
          $(this).addClass('ui-bar-c');
    } else {
   $(this).removeClass('ui-bar-c');
        $(this).addClass('ui-bar-b');
    }
    });
   
    </script>



</head>

<body>
	
	<s:form action="receiptPOC!save.action" method="post" enctype="multipart/form-data" theme="simple" name="poc" id="poc" data-ajax="false">
		 <s:push value="model">
		  <s:token/> 
		<div id="receiptpage" data-role="page" data-add-back-btn="true"
				class="pageclass">
				<div data-theme="b" data-role="header" data-position="fixed">
					<h5>Receipt</h5>
					<a href="/mobile/login/securityLogin.jsp" id="logout"
						data-ajax="false" data-theme="b" data-icon="delete"
						class="ui-btn-right">Log Out</a>
				</div>
				
				<div data-role="content" style="margin-top: 2%">
            <div id="listviewid" class="ui-grid-a">
			<div class="ui-block-a"><li  style="height:90px" class="ui-bar ui-bar-c" value="20" data-icon="false"><p style="padding-top: 5%"><font style="font-size:xx-large">20</font></p></li></div>
			<div class="ui-block-b"><li  style="height:90px" class="ui-bar ui-bar-c" value="30" data-icon="false"><p style="padding-top: 5%"><font style="font-size:xx-large">30</font></p></li></div>	
			<div class="ui-block-a"><li  style="height:90px" class="ui-bar ui-bar-c" value="40" data-icon="false"><p style="padding-top: 5%"><font style="font-size:xx-large">40</font></p></li></div>
			<div class="ui-block-b"><li  style="height:90px" class="ui-bar ui-bar-c" value="50" data-icon="false"><p style="padding-top: 5%"><font style="font-size:xx-large">50</font></p></li></div>
			</div>
			<div style="padding-top: 5px">
               <label for="manualReceiptNumber">Manual Receipt Number :</label>
                <input type="text" name="manualReceiptNumber" id="manualReceiptNumber" data-mini="true">
                <s:hidden id="amount" name="amount" value="%{amount}"/>
                   <s:hidden id="mode" name="mode" value="%{mode}"/>
                   <div style="padding-top: 5px">
               <button  type="submit" data-mini="true" id="submit" onclick=" return validateForm();" data-theme="b">Submit</button>
               </div>
			</div>
				
			</div>
			</div>
			</s:push>
	</s:form>
</body>
</html>