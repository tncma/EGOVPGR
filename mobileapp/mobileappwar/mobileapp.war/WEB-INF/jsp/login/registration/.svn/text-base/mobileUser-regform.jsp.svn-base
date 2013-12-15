<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>

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


	
	function checkPasswords()
	{
		if(jQuery('#pwd').val()!=jQuery('#confirmPwd').val())
		{
				errornotification("error","Passwords are not same");
				jQuery('#confirmPwd').val("");
				return false;
		}		
	}
	function checkPasswordLength()
	{
		if(jQuery('#pwd').val()!='' && jQuery('#pwd').val().length<8)
		{
				errornotification("error","Passwords should be atleast 8 characters");
				jQuery('#pwd').val("");
				return false;
		}		
	}

	function validateMobileNumber(obj)
	{
		var text = obj.value;
		if(text=='')
			return;
		if(text.length!=10)
		{
			errornotification("error",'<s:text name="registration.invalid.mobileno.length" />');
			obj.value="";
		}
		validatePhoneNumber(obj,'mobile');
	}
	function validatePhoneNumber(obj,mode){
		var text = obj.value;
		if(text=="")
			return;
		var msg;
		if(mode=='mobile')
			msg='<s:text name="registration.invalid.mobileno" />';
		else
			msg='<s:text name="registration.invalid.teleno" />';
		if(isNaN(text))
		{
			errornotification("error",msg);
			obj.value="";
			return;
		}
		if(text<=0)
		{
			errornotification("error",msg);
			obj.value='';
			return;
		}
		if(text.replace(".","~").search("~")!=-1)
		{
			errornotification("error",'<s:text name="registration.period.notallowed" />');
			obj.value='';
			return;
		}
		if(text.replace("+","~").search("~")!=-1)
		{
			errornotification("error",'<s:text name="registration.plus.notallowed" />');
			obj.value='';
			return;
		}
	}	
	function validatePinCode(obj)
	{
		var text = obj.value;
		if(text=="")
			return;
		if(text.length!=6)
		{
			errornotification("error",'<s:text name="registration.invalid.pincode.length" />');
			obj.value="";
			return;
		}
		if(isNaN(text))
		{
			errornotification("error",'<s:text name="registration.invalid.pincode" />');
			obj.value="";
			return;
		}
		if(text<=0)
		{
			errornotification("error",'<s:text name="registration.invalid.pincode" />');
			obj.value='';
			return;
		}
		if(text.replace(".","~").search("~")!=-1)
		{
			errornotification("error",'<s:text name="registration.period.notallowed" />');
			obj.value='';
			return;
		}
		if(text.replace("+","~").search("~")!=-1)
		{
			errornotification("error",'<s:text name="registration.plus.notallowed" />');
			obj.value='';
			return;
		}
	}

	function validateUserNameAndEmail()
	{		
		var x=jQuery('#userName').val();
		if(x!="" && x!=null && x!="Your email-id"){
			var atpos=x.indexOf("@");
			var dotpos=x.lastIndexOf(".");
			if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
			{			
				errornotification('notice','<s:text name="registration.invalid.email.address" />');
				jQuery('#userName').val("");
			  return false;
			}
		}
		populateEmail();
		return true;
	}
	
	
	function clearForm()
	{
		var mode=	jQuery('#mode').val();	
		jQuery('#userName').val("");
		if(jQuery('#mode').val()!='edit'){
			jQuery('#pwd').val("");
			jQuery('#confirmPwd').val();
		}
		document.getElementById("isIndividualRadiotrue").checked="checked";
		jQuery('#firstName').val("");
		jQuery('#organizationTypes').val("-1");
		jQuery('#mobileNumber').val("");
		jQuery('#alternateNumber').val("");
		jQuery('#email').val("");
		jQuery('#houseNo').val("");
		jQuery('#address1').val("");
		jQuery('#address2').val("");
		jQuery('#locality').val("");
		jQuery('#pincode').val("");

		jQuery('#orgDiv').hide();
		jQuery('#nameDiv').show();

		clearErrorLabels();
	}
	function validateInput()
	{
		var status=true;
		
      
	
		if(jQuery('#userName').val()=="" || jQuery('#userName').val()=="Your email-id")
		{
			errornotification('notice','<s:text name="EmailId cannot be Empty" />');
			status=false;
			return false;
		}else{
			if(!validateUserNameAndEmail()){
				status= false;
				return false;
			}
		}
		if(jQuery('#mode').val()!='edit'){
			if(jQuery('#pwd').val()=="")
			{
				errornotification('notice','<s:text name="Password cannot be Empty" />');
				status=false;
				return false;
			}
			if(jQuery('#confirmPwd').val()=="")
			{
				errornotification('notice','<s:text name="Confirm Password cannot be Empty" />');
				status=false;
				return false;
			}
		}
		
			if(jQuery('#firstName').val()=="")
		{
			errornotification('notice','<s:text name="firstName cannot be Empty" />');
			status=false;
			return false;
		}
		
		if(jQuery('#mobileNumber').val()=="")
		{
			errornotification('notice','<s:text name="Mobile Number cannot be Empty" />');
			status=false;
			return false;
		}
		
		if(jQuery('#address1').val()=="")
		{
			errornotification('notice','<s:text name="Address cannot be Empty" />');
			status=false;
			return false;
		}
		if(jQuery('#locality').val()=="")
		{
			errornotification('notice','<s:text name="Locality cannot be Empty" />');
			status=false;
			return false;
		}
		if(jQuery('#pincode').val()=="")
		{
			errornotification('notice','<s:text name="Pincode cannot be Empty" />');
			status=false;
			return false;
		}
	

		if(status){			
			for(var i=0;i<document.forms[0].length;i++)
			{
				document.forms[0].elements[i].disabled =false;
			}			
		}
		return status;
	}
	


	function validateUserName(){	
	if(jQuery('#userName').val()!='' && jQuery('#userName').val()!='Your email-id' && jQuery('#mode').val()!='edit'){
	var username=jQuery('#userName').val();
	 $.ajax({
	    url:"/mobile/login/registration/mobileUser!checkUniquenessForUserName.action",
	     data: {userNameCheck:username}, 
	      type: "POST",
	     dataType: "json",
	    success: function(data){
	    
	    if(!data){
	     jQuery('#userNameError').show();	   	
		errornotification('error',""+jQuery('#userName').val()+" is already registered with us");
		jQuery('#userNameError').css("color", "#cc0000");		
		jQuery('#userNameError').html(""+jQuery('#userName').val()+" is already registered with us.\n Please use a different EmailId");				
		jQuery('#userName').val("");
		jQuery('#pwd').val("");
	    }else{
	   
	    jQuery('#userNameError').hide();
	    }
	    },
	     error: function(xhr, textStatus, errorThrown){
          alert('Sorry! there seems to be a problem .Please try again after some time');
        },
        
	    });  
	    
	   } 
	    
		
		
	}
	function populateEmail(){
		if(jQuery('#userName').val()!="" || jQuery('#userName').val()!="Your email-id"){
			jQuery('#email').val(jQuery('#userName').val());
		}
	}
	
	function load()
	{
		if( jQuery('#mode').val()=="view"){
			for(var i=0;i<document.forms[0].length;i++)
			{
				document.forms[0].elements[i].disabled =true;
			}
		}
		if( jQuery('#mode').val()=="edit"){
			//jQuery('#userName').disabled("true");
			jQuery("#userName").attr('disabled','disabled');
			jQuery("#Check").attr('disabled','disabled');
		}
		
	
		<s:if test="%{userNameTemp!=null}" >
			document.getElementById("userName").value='<s:property value="%{userNameTemp}"/>';
		</s:if>
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
<body onload="">

	<s:form action="mobileUser.action" method="post" enctype="multipart/form-data" theme="simple" name="tablet" id="tablet" data-ajax="false">
  	<s:token/>
	 <s:push value="model">	
			<s:hidden id="id" name="id" value="%{id}"/>
			<s:hidden id="mode" name="mode" value="%{mode}"/>
			<s:hidden id="isActive" name="isActive" value="%{isActive}"/>
		    <s:hidden id="isSuspended" name="isSuspended" value="%{isSuspended}"/>
		    <s:hidden id="isPortalUser" name="isPortalUser" value="%{isPortalUser}"/>
	        <s:hidden id="fromDate" name="fromDate" value="%{fromDate}"/>
			<s:hidden id="toDate" name="toDate" value="%{toDate}"/>
			<s:hidden id="address" name="address" value="%{address.addressID}"/>
		
	<div data-role="page" id="complaintdetails"  class="pageclass">
	
			<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/login/registration/mobileUser!loginForm.action" id="backtologin" data-theme="b" data-icon="back" class="ui-btn-left">Back</a>
				<h5>Registration Form</h5>
			</div>

	<div data-role="content" name="contentMain" style="padding: 5px">
	 <div align="center" data-role="fieldcontain">
	        <span align="center" class="errorlabel" id="userNameError" ></span>
	</div>
				<div data-role="fieldcontain">
				<label id="whatLabel" for="userName">Email Id*:</label>
				<s:textfield  name="userName" id="userName" data-mini="true"   value="Your email-id" onFocus="if (value == 'Your email-id') {value=''}" onBlur="if (value== '') {value='Your email-id';} else {validateUserName();};validateUserNameAndEmail();"/>
			
			</div>

				<div data-role="fieldcontain">
				<label id="whatLabel" for="pwd">Password*:</label>
				<s:password  name="pwd" id="pwd" maxlength="30"  onBlur="checkPasswordLength()" data-mini="true"   />
			
			</div>

			

			<div data-role="fieldcontain">
				<label id="whatLabel" for="confirmPwd">Confirm Password*:</label>
				<s:password name="confirmPwd" maxlength="30" id="confirmPwd" onBlur="checkPasswords();" data-mini="true"  />
			
			</div>
			
			<div data-role="fieldcontain">
				<label id="whatLabel" for="firstName">Name*:</label>
				<s:textfield name="firstName" id="firstName"  value="%{firstName}"  data-mini="true" />
			
			</div>	


	<div data-role="fieldcontain">
				<label id="whatLabel" for="mobileNumber">Mobile Number*:</label>
				<s:textfield  name="mobileNumber"  type="tel" data-mini="true" id="mobileNumber" value="%{mobileNumber}"  maxlength="10" onblur="validateMobileNumber(this)" />
			
			</div>

	<div style="display: none" data-role="fieldcontain">
				<label id="whatLabel" for="email">Email*:</label>
				<s:textfield name="email" id="email"  value="%{email}" data-mini="true"  readonly="true" />
			
			</div>	
			
	<div data-role="fieldcontain">
				<label id="whatLabel" for="address1">Address*:</label>
				<s:textarea cols="40" rows="8" id="address1" data-mini="true"  name="address.streetAddress1" class="required" maxlength="512"/>
			
			</div>
			
			
<div data-role="fieldcontain">
				<label id="whatLabel" for="locality">Locality*:</label>
				<s:textarea name="address.locality" id="locality" value="%{address.locality}" data-mini="true"  />
			</div>	
			
   <div data-role="fieldcontain">
				<label id="whatLabel" for="pincode">PinCode*:</label>
				<s:textfield  id="pincode" name="address.pinCode" data-mini="true"  maxlength="12"/>
			
			</div>									
		</div>
	<fieldset class="ui-grid-a">
				<div class="ui-block-a">
					<a href="#home" data-role="button" data-mini="true" id="cancell" onclick="" data-theme="d">Cancel</a>
				</div>
				<div class="ui-block-b">
					
					<s:submit data-mini="true" value="Submit" cssClass="button1" onclick="return validateInput()" data-theme="b" id="saveButton" method="save" name="button" />
				</div>
			</fieldset>
	</div>

	 </s:push> 
	</s:form>
		
</body> 
</html>