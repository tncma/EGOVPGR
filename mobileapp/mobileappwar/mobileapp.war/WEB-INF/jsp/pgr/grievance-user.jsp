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

		.nav-footer .ui-btn .ui-btn-inner { padding-top: 40px !important; }
		.nav-footer .ui-btn .ui-icon { width: 30px!important; height: 30px!important; margin-left: -15px !important; box-shadow: none!important; -moz-box-shadow: none!important; -webkit-box-shadow: none!important; -webkit-border-radius: 0 !important; border-radius: 0 !important; }
		#forwardbtn .ui-icon { background:  url(../images/forwardbtn.png) 30% 30% no-repeat; background-size: 20px 15px; background-color: white}
		#homebtn .ui-icon { background:  url(../images/homeBtn.jpg) 30% 30% no-repeat; background-size: 20px 15px;background-color: white }
		#backbtn .ui-icon { background:  url(../images/backBtn.ico) 30% 30% no-repeat; background-size: 20px 15px;background-color: white }
     
      
</style>

<title> Grievances</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">  
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">   
<link rel="stylesheet" href="../mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="../mobile/jquery/css/jquery.toastmessage.css" /> 
<script src="../mobile/jquery/jquery-1.7.2.min.js"></script>
<script src="../mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript" src="../mobile/jquery/gmap3.min.js"></script>
<script type="text/javascript" src="../mobile/jquery/jquery.toastmessage.js"></script>
   
<script type="text/javascript">
 
var mediastream = "";

	

var snapshots=[];
function dataURItoBlob(dataURI) {
    // convert base64 to raw binary data held in a string
    // doesn't handle URLEncoded DataURIs
    var byteString = atob(dataURI.split(',')[1]);

    // separate out the mime component
    var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0]

    // write the bytes of the string to an ArrayBuffer
    var ab = new ArrayBuffer(byteString.length);
    var ia = new Uint8Array(ab);
    for (var i = 0; i < byteString.length; i++) {
        ia[i] = byteString.charCodeAt(i);
    }

    // write the ArrayBuffer to a blob, and you're done
  //  if (!window.BlobBuilder && window.WebKitBlobBuilder) {
    //    window.BlobBuilder = window.WebKitBlobBuilder;
    // }
  //  var BlobBuilder = (window.MozBlobBuilder || window.WebKitBlobBuilder || window.BlobBuilder);
 //BlobBuilderObj.append(byteArray.buffer);               
  // var builder =window.BlobBuilder;
    // builder.append(ab);
    //return builder.getBlob(mimeString);
    
    var bb = window.WebKitBlobBuilder;
  //  bb.append(ab);
    return bb.getBlob(mimeString)
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



	//ios.notify({
 // title: title,
 // message: message,
 // delay :5000
//});

}

function getData(){

	var phonenum= $("#complainantMobileTelephone").val();
	if(phonenum!=""){
	 $.ajax({
	    url:"/mobile/pgr/grievance!getallComplaints.action",
	     data: { ajaxPhoneNum:phonenum }, 
	      type: "POST",
	     dataType: "html",
	    success: function(data){
	     $("#attachdiv").children().remove();  
	     $("#attachdiv").append(data);	     
	     $('#home').page("destroy").page();
	    }
	    });  
	
}
}


$(document).ready(function() {

$( '#complaintdetails' ).on( 'pageinit',function(event){
//alert("")
                                     var i=0;
						        	var categorytypeid=$('#complaincategory').val();
						        	if(categorytypeid!=-1){
						        	var mySelect = $('#complaintype1');
						        	//$('#myselect >option').remove();
						        	mySelect.children('option:not(:first)').remove();
						        	$('#complaintype1').selectmenu('refresh', true);				        	
							         $.getJSON("/mobile/pgr/grievance!.action", {categoryTypeId:categorytypeid}, function(data) {
	   									 for(i=0;i<data.ResultSet.Result.length;i++){
	   									 mySelect.append($('<option></option>').val(data.ResultSet.Result[i].Id).html(data.ResultSet.Result[i].Description));
	   									 }
	    								});
	    							
	}					        
});


$( '#complaintstatusdetails' ).on( 'pageinit',function(event){

                                     var i=0;
						        	var categorytypeid=$('#complaintcategory').val();
						        	if(categorytypeid!=-1){
						        	var mySelect = $('#complainstatustype');
						        	//$('#myselect >option').remove();
						        	
						        	mySelect.children('option:not(:first)').remove();
						        	$('#complainstatustype').selectmenu('refresh', true);				        	
							         $.getJSON("/mobile/pgr/grievance!complaintTypes.action", {categoryTypeId:categorytypeid}, function(data) {
	   									 for(i=0;i<data.ResultSet.Result.length;i++){
	   									 mySelect.append($('<option></option>').val(data.ResultSet.Result[i].Id).html(data.ResultSet.Result[i].Description));
	   									 }
	    								});
	    							
	}					        
});

 $('#complaincategory').change(function () {
						        var i=0;
						        	var categorytypeid=$('#complaincategory').val();
						        	var mySelect = $('#complaintype1');
						        	//$('#myselect >option').remove();
						        	
						        	mySelect.children('option:not(:first)').remove();
						        	$('#complaintype1').selectmenu('refresh', true);				        	
							         $.getJSON("/mobile/pgr/grievance!complaintTypes.action", {categoryTypeId:categorytypeid}, function(data) {
	   									 for(i=0;i<data.ResultSet.Result.length;i++){
	   									 mySelect.append($('<option></option>').val(data.ResultSet.Result[i].Id).html(data.ResultSet.Result[i].Description));
	   									 }
	    								});
	    							
						        });
						        
	 $('#complaintcategory').change(function () {
						        var i=0;
						        	var categorytypeid=$('#complaintcategory').val();
						        	var mySelect = $('#complainstatustype');
						        	//$('#myselect >option').remove();
						        	
						        	mySelect.children('option:not(:first)').remove();
						        	$('#complainstatustype').selectmenu('refresh', true);				        	
							         $.getJSON("/mobile/pgr/grievance!complaintTypes.action", {categoryTypeId:categorytypeid}, function(data) {
	   									 for(i=0;i<data.ResultSet.Result.length;i++){
	   									 mySelect.append($('<option></option>').val(data.ResultSet.Result[i].Id).html(data.ResultSet.Result[i].Description));
	   									 }
	    								});
	    							
						        });					        
					     
			 $('#mapbytype').click(function() {
											var complainttype=$('#complaintype1').val(); 
									if(complainttype==""||complainttype=="-1"){
											errornotification("error","Please select the complaint type and try again");
										    return false;
											}
											$("#mapbytype").attr("href","/mobile/pgr/grievance!getReportForComplaint.action?complaintTypeId="+complainttype+"&reportView=map");
										});
			
					 $('#chartbytype').click(function() {
											var complainttype=$('#complaintype1').val();
									if(complainttype==""||complainttype=="-1"){
											errornotification("error","Please select the complaint type and try again");
										    return false;
											}
											$("#chartbytype").attr("href","/mobile/pgr/grievance!getReportForComplaint.action?complaintTypeId="+complainttype+"&reportView=chart");
										});							
		
		
		 $('#mapbystatus').click(function() {
											var complainttype=$('#complainstatustype').val();
												var complaintstatus=$('#complaintstatus').val();
												
									if(complainttype==""||complainttype=="-1"){
											errornotification("error","Please select the complaint type and try again");
										    return false;
											}
											
											if(complaintstatus==""||complaintstatus=="-1"){
											errornotification("error","Please select the complaint status and try again");
										    return false; 
											} 
											$("#mapbystatus").attr("href","/mobile/pgr/grievance!getStatusReportForComplaint.action?complaintTypeId="+complainttype+"&complaintStatus="+complaintstatus+"&reportView=map");
										});
			
			
				 $('#listbydepartment').click(function() {
											var complaintdepartment=$('#complaintdepartment').val();
											
												
								
											if(complaintdepartment==""||complaintdepartment=="-1"){
											errornotification("error","Please select the complaint category and try again");
										    return false;
											}
											$("#listbydepartment").attr("href","/mobile/pgr/grievance!getreportbyCategory.action?complaintCategoryId="+complaintdepartment);
										});
				

});
						


				
						



function errorFunction(){


}



 
	
 
function init()
        {
        
      
        }
     function validateForm(){
			
	}
	   
  
	function Output(msg) {
		var m = document.getElementById("messages");
		m.innerHTML ="";
		m.innerHTML = msg + m.innerHTML;
	}

	$('#logout').click(function () {
	    
		$("#logout").attr("href","/mobile/login/securityLogin.jsp");
	});
		   
 </script>
</head>
<body onload="init();">
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

	<s:form action="registerGrievance!save.action" method="post" enctype="multipart/form-data" theme="simple" name="tablet" id="tablet" data-ajax="false">
  	<s:token/>
	 <s:push value="model">	
		<div data-role="page" id="home" data-position="fixed" >
		<!-- menupanel  -->
				<div class="ui-panel" data-role="panel" data-theme="b" id="mypanel" data-display="overlay" 
				data-position="left" data-position-fixed="false" data-rel="close" data-theme="none">
      				<ul data-mini="true" data-role="listview"   data-theme="c" class="nav-search">
                   		
                   		 <li  data-icon="false"><a href="#" data-rel="close" ><img src="../images/Close.png" class="ui-li-icon">Close Menu</a></li>				
					   
						<div data-role="collapsible" data-collapsed="false"  data-expanded-icon="arrow-u"  data-collapsed-icon="arrow-d" data-iconpos="left" data-content-theme="c"><h3>Reports</h3>
                               <ul data-role="listview"   data-theme="c" class="nav-search">
                               <li  data-icon="false" ><a href="/mobile/pgr/grievance!getreportbyCategory.action"><img src="../images/register.jpg" class="ui-li-icon">Complaints By Department</a></li>
                                <!--<li  data-icon="false" ><a href="#complaintdetails"><img src="../images/register.jpg" class="ui-li-icon">Complaints By Type</a></li>-->				
                                <!--<li  data-icon="false"><a href="#complaintstatusdetails"><img src="../images/view.png" class="ui-li-icon">Complaints By Status</a></li>-->                      
						      </ul>
					   </div>
					   <div data-role="collapsible" data-collapsed="false"  data-expanded-icon="arrow-u"  data-collapsed-icon="arrow-d" data-iconpos="left" data-content-theme="c"><h3>List Complaints</h3>
                               <ul data-role="listview"   data-theme="c" class="nav-search">
                               <li data-mini="true" data-icon="false"><a href="/mobile/pgr/grievance!viewUserComplaints.action"
									id="viewComplaint"><img src="/mobile/images/view.png"
										class="ui-li-icon">List My Complaints </a></li>
                               <!--<li data-mini="true" data-icon="false" ><a href="/mobile/pgr/grievance!getAllParticiptedComplaints.action"><img src="../images/participated.png" class="ui-li-icon">My participated complaints</a></li>-->
                               <!--<li data-mini="true" data-icon="false" ><a href="#complaintdetails"><img src="../images/completed1.jpg" class="ui-li-icon">My completed complaints</a></li>-->				
                              </ul>
					   </div>
					 
					  
						
						
						
	 			   </ul>
               </div>
     	<!--End menupanel  -->
     
		<div data-theme="b"  data-role="header"  data-position="fixed">
		<a href="#mypanel" id="menubuttons" data-theme="b" data-icon="grid" class="ui-btn-left">Menu</a>
		<a href="#" id="logout" onclick="javascript:top.location='/mobile/logout.do';top.opener.location='mobile/logout.do';" data-ajax="false" data-theme="b" data-icon="delete"
						class="ui-btn-right">Log Out</a>
			<h6 align="left">Welcome to PGR</h6>
			<div id="notificationWrapper"></div>
		</div>
		<div align="center" style="padding: 4px"></div>
		<div id="attachdiv">
		<div data-role="content" style="padding: 5px" >									                    
				<s:if test="%{reportlist.size!=0}">
					<ul data-filter="true" data-role="listview" data-theme="d" data-divider-theme="b" data-add-back-btn="true" class="pageclass" data-inset="true">
					
						<s:iterator value="reportlist" status="status">		
			 					<li data-role="list-divider"><s:property value="%{complaintno}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="%{date}"/></li>
								<li data-icon="false"><a data-transition="none" href="/mobile/pgr/grievance!viewComplaintDetails.action?complaintId=<s:property value="complaintid"/>"</a> 
				                      <h3><s:property value="%{complaintno}"/></h3>
											<p><strong><s:property value="%{complainttype}"/></strong></p>
											<p><s:property value="%{complaintdetails}"/></p>
											<s:if test="%{status=='COMPLETED'}">
											<p style="color: #009933" class="ui-li-aside"><strong><s:property value="%{status}"/></strong></p>
				  						    </s:if>			  	 					   
				  						     <s:elseif test="%{status=='REGISTERED'}">
											<p style="color: #ff0000" class="ui-li-aside"><strong><s:property value="%{status}"/></strong></p>
				  						    </s:elseif>
				  						     <s:else>
											<p style="color: #E68A00" class="ui-li-aside"><strong><s:property value="%{status}"/></strong></p>
				  						    </s:else>
								</a></li>
			
						</s:iterator>
						</ul>
						</s:if>	
						<s:else>
					     <p align="center"><strong>No Complaints Filed against you </strong></p>
						</s:else>
					
		     
		</div>
		</div>
		<div data-theme="b" data-role="footer" data-position="fixed">
			<h8 > <center> © 2013 eGovernments Foundation</center></h8>
		</div>
	</div>
	
		<div  data-role="page" id="complaintdetails" data-add-back-btn="true" class="pageclass">
			<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/pgr/grievance!userform.action" data-icon="home" data-transition="none"
					data-theme="b" class="ui-btn-right">Home</a>
				<h5>Complaint Details</h5>
			</div>

	<div data-role="content" name="contentMain" style="padding: 5px">

			<div data-role="fieldcontain">
				<label for="complaincategory"> Complaint Category: </label>
				<s:select id="complaincategory" name="complaincategory"
								list="dropdownData.complaintgrouplist" listKey="complaintGroupId"
								listValue="complaintGroupName" headerKey="-1" headerValue="Select Category"> 
				</s:select>
						
			</div>
			
			<div data-role="fieldcontain">				
				<label for="complaintype1"> Complaint Type: </label> 
				<s:select id="complaintype1" name="complaintype1"
								list="dropdownData.complainttypelist" listKey="complaintTypeId"
								listValue="complaintTypeName" headerKey="-1" headerValue="Select Complaint Type"> 
				</s:select>		
				
			</div>
			
					<fieldset class="ui-grid-a">
				<div class="ui-block-a">
			
				<a href="#" data-ajax="false" data-transition="none" data-role="button"
					id="mapbytype" onclick="" data-theme="b">Map</a>
				</div>
				<div class="ui-block-b">
					<a href="#"  data-ajax="false" data-transition="none" data-role="button"
					id="chartbytype" onclick="" data-theme="b">Chart</a>
				</div>
			</fieldset>
			</div>
	
		
	
	</div>
	
	<div data-role="page" id="complaintstatusdetails" data-add-back-btn="true" class="pageclass">
			<div data-theme="b" data-role="header" data-position="fixed">
				<a href="/mobile/pgr/grievance!userform.action" data-icon="home" data-transition="none"
					data-theme="b" class="ui-btn-right">Home</a>
				<h5>Complaint Details</h5>
			</div>

	<div data-role="content" name="contentMain" style="padding: 5px">

			<div data-role="fieldcontain">
				<label for="complaincategory"> Complaint Category: </label>
				<s:select id="complaintcategory" name="complaincategory"
								list="dropdownData.complaintgrouplist" listKey="complaintGroupId"
								listValue="complaintGroupName" headerKey="-1" headerValue="Select Category"> 
				</s:select>
						
			</div>
			
			<div data-role="fieldcontain">				
				<label for="complaintype1"> Complaint Type: </label> 
				<s:select id="complainstatustype" name="complaintype1"
								list="dropdownData.complainttypelist" listKey="complaintTypeId"
								listValue="complaintTypeName" headerKey="-1" headerValue="Select Complaint Type"> 
				</s:select>		
				
			</div>
			
			<div data-role="fieldcontain">				
				<label for="complaintype1"> Complaint Status: </label> 
				<s:select id="complaintstatus" name="complaintStatus"
								list="statusMap" 
								 headerKey="-1" headerValue="Select Status"> 
				</s:select>		
				
			</div>
			
					<fieldset>
				<div >
				<s:hidden id="lats" name="lats" />
					<s:hidden id="lons" name="lons" />
				<a href="#" data-ajax="false" data-transition="none" data-role="button"
					id="mapbystatus" onclick="" data-theme="b">Map</a>
				</div>				
			</fieldset>
			</div>
	
		
	
	</div>
	


	</div>	
	 </s:push> 
	</s:form>
		
</body> 
</html>
