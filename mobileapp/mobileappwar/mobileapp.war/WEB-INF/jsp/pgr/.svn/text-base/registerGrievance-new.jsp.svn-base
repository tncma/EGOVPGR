<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>

<!DOCTYPE html>
<html>
<head>
 <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map-canvas { height: 90% }
    </style>

<style>

#forwardbtn .ui-icon {
		background: url(../images/forwardbtn.png) 30% 30% no-repeat;
		background-size: 20px 15px;
		background-color: white
	}
	#homebtn .ui-icon {
		background: url(../images/homeBtn.jpg) 30% 30% no-repeat;
		background-size: 20px 15px;
		background-color: white
	}
	#backbtn .ui-icon {
		background: url(../images/backBtn.ico) 30% 30% no-repeat;
		background-size: 20px 15px;
		background-color: white
	}
.ui-grid-a {
	margin-top: 1em;
	padding-top: .8em;
	margin-top: 1.4em;
	border-top: 1px solid rgba(0, 0, 0, .1);
}

@media all and (max-width: 480px) {
	#footers {
		display: none;
	}
	#mapok {
		display: none;
	}
	#cancelmap {
		display: none;
	}
	.nav-footer .ui-btn .ui-btn-inner {
		padding-top: 40px !important;
	}
	.nav-footer .ui-btn .ui-icon {
		width: 30px !important;
		height: 30px !important;
		margin-left: -15px !important;
		box-shadow: none !important;
		-moz-box-shadow: none !important;
		-webkit-box-shadow: none !important;
		-webkit-border-radius: 0 !important;
		border-radius: 0 !important;
	}
	
}
</style>

<title>Register Grievances</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<link rel="stylesheet"
	href="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="../jquery/css/jquery.toastmessage.css" />
<script src="../jquery/jquery-1.7.2.min.js"></script>
<script src="../jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=true"></script>
	<script type="text/javascript" src="../jquery/map/jquery.ui.map.js"></script>
<script type="text/javascript" src="../jquery/jquery.toastmessage.js"></script>
<script type="text/javascript" src="../jquery/map/jquery.ui.map.extensions.js"></script>
<script type="text/javascript" src="../jquery/map/jquery.ui.map.services.js"></script>
<script type="text/javascript" src="../jquery/map/jquery.ui.map.overlays.js"></script>

<script type="text/javascript">
 getcurrentlats();

     
 
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

function getPaginatedData(){
$.mobile.showPageLoadingMsg("Please wait while we get your data");
var pageNum;
var pageSizes;

 var pageNum=$("#pageNumber").val();
 if(pageNum==undefined||pageNum==""){
 pageNum=1
 }
 var pageSizes=$("#pagesiz").val();
 if(pageSizes==undefined||pageSizes==""){
 pageSizes=5
 }
 
 var i=0
	var phonenum= $("#complainantMobileTelephone").val();

	
	 $.ajax({
	    url:"/mobile/pgr/registerGrievance!getPaginatedComplaints.action",
	     data: { ajaxPhoneNum:phonenum,pageNo:pageNum,pageSize:pageSizes}, 
	      type: "POST",
	     dataType: "json",
	    success: function(data){
	   	   
	    $("#pageNumber").val(data.page);
	    $("#pagesiz").val(data.pagesize);
	    $('div#paginationdescription').children().remove()
	     $('div#paginationdescription').append('<p>Showing '+data.showingcomplainttotal+' of '+data.total+'</p>');
	     if(data.showingcomplainttotal==data.total){
	     $('#loadmore').hide();
	     }
	     var out = [];	    
	      for(i=0;i<data.complaints.length;i++){
	      var statushtml=getHtmlcodeforstatus(data.complaints[i].complaintstatus);
	     out.push('<li data-mini="true" data-role="list-divider">'+data.complaints[i].complaintno+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+data.complaints[i].complaintdate+'</li><li data-mini="true" data-icon="false"><a data-transition="none" href="/mobile/pgr/registerGrievance!viewComplaintDetails.action?complaintId='+data.complaints[i].complaintId+'"</a> <h3>'+data.complaints[i].complaintno+'</h3><p><strong>'+data.complaints[i].complainttype+'</strong></p><p>'+data.complaints[i].complaintdetails+'</p>'+statushtml+'</a></li>')
		 
	      }
	     if(data.complaints.length==0){	       
	       errornotification("notice","No more complaints found")
	       $('#loadmore').hide();
	     
	     } 
	       $('ul#complaintul').append(out.join(''));
		   $('ul#complaintul:visible').listview('refresh');
	       $('#home:visible').page("destroy").page();
	    }
	    });  
$.mobile.hidePageLoadingMsg()
}
function getHtmlcodeforstatus(status){
var op;
	if(status=='COMPLETED'){
				op='<p style="color: #009933" class="ui-li-aside"><strong>'+status+'</strong></p>'
				}
				else if(status=='REGISTERED'){				   
			op=	'<p style="color: #ff0000" class="ui-li-aside"><strong>'+status+'</strong></p>'
				}
				else{
			op=	'<p style="color: #E68A00" class="ui-li-aside"><strong>'+status+'</strong></p>'
				}
return op
}

function getData(){
var pageNum;
var pageSizes;

 var pageNum=$("#pageNumber").val();
 if(pageNum==undefined||pageNum==""){
 pageNum=1
 }
 var pageSizes=$("#pagesiz").val();
 if(pageSizes==undefined||pageSizes==""){ 
 pageSizes=5
 }
	var phonenum= $("#complainantMobileTelephone").val();
	if(phonenum!=""){
	 $.ajax({
	    url:"/mobile/pgr/registerGrievance!getallComplaints.action",
	     data: { ajaxPhoneNum:phonenum,pageNo:pageNum,pageSize:pageSizes}, 
	      type: "POST",
	     dataType: "html",
	    success: function(data){
	     $("#attachdiv").children().remove();  
	     $("#attachdiv").append(data);	     
	     $('#home:visible').page("destroy").page();
	    }
	    });  
	
}
}


function capture(video, scaleFactor) {
		if (scaleFactor == null) {
			scaleFactor = 1;
		}
		var w = video.videoWidth * scaleFactor;
		var h = video.videoHeight * scaleFactor;
		var canvas = document.getElementById('canvaselement');
		canvas.width = w;
		canvas.height = h;
		var ctx = canvas.getContext('2d');
		//ctx.drawImage(video, 0, 0, w, h);
		  ctx.drawImage(video, 0, 0, 20, 20);
		return canvas;
	}


function validateuserinfomenu(){

	/*var userName= $("#complainantFirstName").val();
	if(userName==""){
		errornotification("notice","Enter First Name");
		$( "#userpanel" ).panel( "open");
		return false;
		}*/
	var emailaddress = $("#complainantEmail").val();	
		/*if(emailaddress==""){
		errornotification("notice","Enter User Details")
				$( "#userpanel" ).panel( "open");
					return false;
				}
				*/
	if (!isValidEmailAddress(emailaddress)) {
       errornotification("error","Enter Valid Email Address")
                $( "#userpanel" ).panel( "open");
					return false;
	}

	var mobileOrTelNumber=$('#complainantMobileTelephone').val();	
		if(mobileOrTelNumber==""){
			 $( "#mypanel" ).panel("close");
			 $( "#userpanel" ).panel( "open");
			 errornotification("notice","Enter Mobile Number")
				
					return false;
				}
	var phoneregEx = new RegExp("/[0-9]{10}/");									
		if ($("#complainantMobileTelephone").val().length != 10 && !$("#complainantMobileTelephone").val().match(phoneregEx)) {	
		       errornotification("error","Enter a valid Mobile Number")
				 $( "#mypanel" ).panel("close");
				 $( "#userpanel" ).panel( "open");
					return false;						
		}
}


function validateuserinfo(){
	var userName= $("#complainantFirstName").val();
	/*if(userName==""){
		errornotification("notice","Enter First Name");
		return false;
		}
		*/
	var emailaddress = $("#complainantEmail").val();	
		/*	if(emailaddress==""){
		errornotification("notice","Enter Email Address");
			return false;
				}*/
	if (!isValidEmailAddress(emailaddress)) {
       errornotification("error","Enter Valid Email Address");
       return false;
	}

	var mobileOrTelNumber=$('#complainantMobileTelephone').val();	
		if(mobileOrTelNumber==""){
			 errornotification("notice","Enter Mobile Number");
			 return false; 
				}
	var phoneregEx = new RegExp("/[0-9]{10}/");									
		if ($("#complainantMobileTelephone").val().length != 10 && !$("#complainantMobileTelephone").val().match(phoneregEx)) {	
		       errornotification("error","Enter a valid Mobile Number")
		       return false;						
		}
	$( "#userpanel" ).panel( "close");
	
	getData();
	
	
	return true;
}

$(document).delegate('[data-role="page"]', 'pageinit', function() {

$('input[data-type="search"]').on('change', function(event){
  if($('input[data-type="search"]').val()!=''){
    $('#paginationdescription').show();
   $('#loadmore').show();
  }
});

$(this).delegate('input[data-type="search"]', 'keyup', function() {
if($('input[data-type="search"]').val()!=''){
   $('#paginationdescription').hide();
   $('#loadmore').hide();
   }else{
    $('#paginationdescription').show();
   $('#loadmore').show();
   }
});
});

$(document).ready(function() {
 
 
 $.mobile.defaultPageTransition = 'none';
 $.mobile.defaultDialogTransition = 'none';
 $.mobile.useFastClick = false;


<s:if test="%{hasErrors()}">
   $.mobile.changePage($("#complaintdetails"));
</s:if>

<s:if test="%{source=='changePwdSuccess'}">
  errornotification("notice","Password changed successfully");
</s:if>
<s:if test="%{source=='modifyUserSuccess'}">
  errornotification("notice","User Details changed successfully");
</s:if>
   $('#logout').click(function () {
						      
	    								$("#logout").attr("href","/mobile/login/registration/mobileUser!loginForm.action");
						        });




   $('#modifyuser').click(function () {
						      
	    								$("#modifyuser").attr("href","/mobile/login/mobileUserModify!modifyForm.action");
						        });


   $('#changepassword').click(function () {
						      
	    								$("#changepassword").attr("href","/mobile/login/mobileUserModify!changePassword.action");
						        });						        						        



					     $('#complaincategory').change(function () {
						        var i=0;
						        	var categorytypeid=$('#complaincategory').val();
						        	var mySelect = $('#complaintype1');
						        	//$('#myselect >option').remove();
						        	
						        	mySelect.children('option:not(:first)').remove();
						        	$('#complaintype1').selectmenu('refresh', true);				        	
							         $.getJSON("/mobile/pgr/registerGrievance!complaintTypes.action", {categoryTypeId:categorytypeid}, function(data) {
	   									 for(i=0;i<data.ResultSet.Result.length;i++){
	   									 mySelect.append($('<option></option>').val(data.ResultSet.Result[i].Id).html(data.ResultSet.Result[i].Description));
	   									 }
	    								});
	    							
						        });
					        

					     $("#top5ComplaintTypes").change(function(){
						     var ft = $('#top5ComplaintTypes').val();
						     if(ft!=-1) {
					       		$("#categoryType").hide();
						     }
						     else {
						    	 $("#categoryType").show();
							 }
					     });

					     $("#complaincategory").change(function(){
						     var ft = $('#complaincategory').val();
						     if(ft!=-1) {
					       		$("#frequentType").hide();
						     }
						     else {
						    	 $("#frequentType").show();
							 }
					     });
					        
					     $('#adminBndry5').change(function () {
					    	    var i=0;
					    	   	var area_id=$('#adminBndry5').val();
					    	   	var mySelect1 = $('#adminBndry6');
					    	       	mySelect1.children('option:not(:first)').remove();
					    	       	$('#adminBndry6').selectmenu('refresh', true);		
					    	     	$('#adminBndry7').children('option:not(:first)').remove();
					    	    	$('#adminBndry7').selectmenu('refresh', true);		        	
					    	         $.getJSON("/mobile/pgr/ajaxCommonPGR!populateLocations.action", {areaId:area_id}, function(data) {
					    					 for(i=0;i<data.ResultSet.Result.length;i++){
						    				 mySelect1.append($('<option></option>').val(data.ResultSet.Result[i].Value).html(data.ResultSet.Result[i].Text));
					    					 }
					    				});
					    			
					    	       });

					    	$('#adminBndry6').change(function () {
					    	    var i=0;
					    	   	var location_id=$('#adminBndry6').val();
					    	   	var mySelect2 = $('#adminBndry7');
					    	       	//$('#myselect >option').remove();
					    	       	
					    	       	mySelect2.children('option:not(:first)').remove();
					    	       	$('#adminBndry7').selectmenu('refresh', true);				        	
					    	         $.getJSON("/mobile/pgr/ajaxCommonPGR!populateStreets.action", {locationId:location_id}, function(data) {
					    					 for(i=0;i<data.ResultSet.Result.length;i++){
					    						 mySelect2.append($('<option></option>').val(data.ResultSet.Result[i].Value).html(data.ResultSet.Result[i].Text));
					    					 }
					    				});
					    			
					    	       });
					     
				 $('#viewComplaint').click(function() {
											var mobileOrTelNumber=$('#complainantMobileTelephone').val();
									if(mobileOrTelNumber==""){
											errornotification("error","Please add your phone number in User Details and try again");
											$( "#userpanel" ).panel( "open");
											return false;
											}
											$("#viewComplaint").attr("href","/mobile/pgr/registerGrievance!viewComplaints.action?mobileNumber="+mobileOrTelNumber);
										});
				
									     
				 $('#viewComplaintMap').click(function() {
				
									var mobileOrTelNumber=$('#complainantMobileTelephone').val();
									if(mobileOrTelNumber==""){
											errornotification("error","Please add your phone number in User Details and try again");
											$( "#userpanel" ).panel( "open");
											return false;
											}
											$("#viewComplaintMap").attr("href","/mobile/pgr/registerGrievance!showComplaintonMap.action?mobileNumber="+mobileOrTelNumber);
										});
				$('#completedComplaints').click(function() {
				
									var mobileOrTelNumber=$('#complainantMobileTelephone').val();
									if(mobileOrTelNumber==""){
											errornotification("error","Please add your phone number in User Details and try again");
											$( "#userpanel" ).panel( "open");
											return false;
											}
											$("#completedComplaints").attr("href","/mobile/reports/viewComplaints!getCompletedComplaints.action?ajaxPhoneNum="+mobileOrTelNumber);
										});						
										
				 $('#registerComp').click(function() {
						var mobileOrTelNumber=$('#complainantMobileTelephone').val();
				if(mobileOrTelNumber==""){
						errornotification("error","Please add your phone number in User Details and try again");
						$( "#userpanel" ).panel( "open");
						return false;
						}
						$("#registerComp").attr("href","#complaintdetails");
					});						
						


						$('#submit').click(function() {
											var fieldsetCount = $('#tablet').children().length;
											for ( var i = 1; i < fieldsetCount; ++i) {
												if (!validateStep(i)) {
													return false;
													break;
												}
											}

											var emailaddress = $("#complainantEmail").val();
											if (!isValidEmailAddress(emailaddress)) {

												
												fieldsempty = $("#complainantEmail")
														.attr("name");
												alert("Please Enter a valid Email");
												var pagetoshow = $("#complainantEmail")
														.parents(
																'div.pageclass')
														.attr('id');
												$.mobile.changePage("#"
														+ pagetoshow, {
													transition : "none"
												});
												return false;
											} 


											var phoneregEx = new RegExp("/[0-9]{10}/");									
											if ($("#complainantMobileTelephone").val().length != 10 && !$("#complainantMobileTelephone").val().match(phoneregEx)) {										
											
												
										fieldsempty = $("#complainantMobileTelephone")
												.attr("name");
										alert("Please Enter a valid Phone Number");
										var pagetoshow = $("#complainantMobileTelephone")
												.parents(
														'div.pageclass')
												.attr('id');
										$.mobile.changePage("#"
												+ pagetoshow, {
											transition : "none"
										});
										return false
										    }

											var complaintcatdropdown=$("#complaincategory").val();
											var freqtype = $('#top5ComplaintTypes').val();
										    if(freqtype==-1) {
													if(complaintcatdropdown==-1 || complaintcatdropdown==""){
														
											
														fieldsempty = $("#myselect")
																.attr("name");
														
														alert("Please Select the Complaint Category");
														var pagetoshow = $("#complaincategory")
																.parents(
																		'div.pageclass')
																.attr('id');
														$.mobile.changePage("#"
																+ pagetoshow, {
															transition : "none"
														});
														return false;
													     }
											 }

										    var complainttypedropdown=$("#complaintype1").val();
										    if(freqtype==-1) {
													if(complainttypedropdown==-1 || complainttypedropdown==""){
														
											
														fieldsempty = $("#myselect")
																.attr("name");
														
														alert("Please Select the Complaint Type");
														var pagetoshow = $("#complaintype1")
																.parents(
																		'div.pageclass')
																.attr('id');
														$.mobile.changePage("#"
																+ pagetoshow, {
															transition : "none"
														});
														return false;
													     }
											 }

										    var complaintdet=  jQuery.trim($("#complaintDetails").val()).length;	
													if(complaintdet==0){
														
											
														fieldsempty = $("#complaintDetails").attr("name");
														
														alert("Please Enter Complaint Details");
														var pagetoshow = $("#complaintDetails")
																.parents(
																		'div.pageclass')
																.attr('id');
														$.mobile.changePage("#"
																+ pagetoshow, {
															transition : "none"
														});
														return false;
													     }

											
										var	valueLengths;    
										var mapAddress=$("#complainantAddress1").val();
										if(mapAddress == ""){
										var areadropdown=$("#adminBndry5").val();
										if(areadropdown==-1){
								
											fieldsempty = $("#myselect")
													.attr("name");
											alert("Please Select Area");
											var pagetoshow = $("#adminBndry5")
													.parents(
															'div.pageclass')
													.attr('id');
											$.mobile.changePage("#"
													+ pagetoshow, {
												transition : "none"
											});
											return false;
										}

										var locationdropdown=$("#adminBndry6").val();
											if(locationdropdown==-1){
												fieldsempty = $("#myselect")
														.attr("name");
												alert("Please Select Location");
												var pagetoshow = $("#adminBndry6")
														.parents(
																'div.pageclass')
														.attr('id');
												$.mobile.changePage("#"
														+ pagetoshow, {
													transition : "none"
												});
												return false;
										}

										var steetdropdown=$("#adminBndry7").val();
											if(steetdropdown==-1){
									
												fieldsempty = $("#myselect")
														.attr("name");
												alert("Please Select Street");
												var pagetoshow = $("#adminBndry7")
														.parents(
																'div.pageclass')
														.attr('id');
												$.mobile.changePage("#"
														+ pagetoshow, {
													transition : "none"
												});
												return false;
										}}
											});
						});

function validateStep(step) {

		var count = 0;
		$('#tablet').children(':nth-child(' + parseInt(step) + ')').find(
				':input.required').each(function() {

			var $this = $(this);
			var valueLength;
			var mandatoryelement = $this.attr('class');
			if (mandatoryelement.indexOf("required") != -1) {
				valueLength = jQuery.trim($this.val()).length;
			} else {
				valueLength = 1;

			}

			if (valueLength == '') {
				count++;
				
				var elementname = $this.prev().text();
				alert("Please Enter the " + elementname);
				var pagetoshow = $this.parents('div.pageclass').attr('id');
				$.mobile.changePage("#" + pagetoshow, {
					transition : "none"
				});
				return false;
			} else {

				
			}
		});
		if (count == 0) {
			return true;
		} else
			return false;

	}

	function isValidEmailAddress(emailAddress) {
		if(emailAddress!=""){
		var pattern = new RegExp(
				/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i);
		return pattern.test(emailAddress);
		}
		else 
			return true;
	};
	
	function getcurrentlats(){
	   if (navigator.geolocation) {
	  
    navigator.geolocation.getCurrentPosition(successFunction, errorFunction);
} else {
    alert('It seems like Geolocation, which is required for this page, is not enabled in your browser. Please use a browser which supports it.');
}
}
function errorFunction(){


}

function successFunction(position) {
    $('#lats').val(position.coords.latitude);
    $('#lons').val(position.coords.longitude);

   
}

  function generatemaps() {
  
	  if( $('#map_canvas').attr('name')!='opened'){
			 $('#googlemaps').live("pagecreate", function () {
		     $('#map_canvas').attr('name','opened');
		   
				$('#hiddenfields').hide();
				
				var currlat =   $('#lats').val();
				var currlon =   $('#lons').val();
				var clientPosition;
				
				if(currlat==""){
				currlat=12.9799279;
				}
				
				if(currlon==""){
				currlon=77.6406317;
				}
				$("#complainantAddress1_latitude").val(currlat);
					$("#complainantAddress1_longitude").val(currlon);
					var resultAdd;
					$('#map_canvas').gmap({'zoom':12}).bind('init', function(evt, map) {
							$('#map_canvas').gmap('getCurrentPosition', function(position, status) {
								if ( status === 'OK' ) {
									clientPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
									setLocation(clientPosition,this);
								}
							$('#map_canvas').gmap('addMarker', {'position': clientPosition, 'bounds': true,'draggable':true,'animation': google.maps.Animation.DROP})
								.dragend( function(event) {
										setLocation(event.latLng,this); 
							});
						});
							
					});	
					var road = new google.maps.KmlLayer( 
						    'http://118.102.160.131/mapguide/kml/coczone.kml',
						    {preserveViewport:true}
						    );
					var map = $("#map_canvas").gmap("get", "map");
						road.setMap(map);
				});
			}
		  }

  function setLocation(location,obj) {
		$('#map_canvas').gmap('search', {'location': location}, function(results, status) {
				$('#map_canvas').gmap('openInfoWindow', {'content': results[0].formatted_address}, obj);
				$('#complainantAddress1_latitude').val(location.lat());
				$('#complainantAddress1_longitude').val(location.lng());
				$('#complainantAddress1').val(results[0].formatted_address);
		});
	}

function init()
        {
		showHideComplaintType();
 		var myname =  window.localStorage.getItem("complainantFirstName");
    
       myname='<s:property value="%{model.complainantFirstName}"/>'
		 if (myname!=null){
		    document.getElementById('complainantFirstName').value =myname;
		    
		  
		    document.getElementById('complainantEmail').value ='<s:property value="%{model.complainantEmail}"/>';
		 
		
		    document.getElementById('complainantMobileTelephone').value ='<s:property value="%{model.complainantMobileTelephone}"/>';
		    document.getElementById('mobileNumber').value ='<s:property value="%{model.complainantMobileTelephone}"/>';
		    getData();
		    
		   }else{ 
		   errornotification("notice","Welcome to Mobile PGR \n Please Enter your details to proceed .");
		
		   $( "#userpanel" ).panel( "open");
		   }   	  
       	
        }
     function validateForm(){
			if (!window.localStorage){
       		 return;
   			 }
		    //if (window.localStorage.getItem("name")){
		        window.localStorage.setItem("complainantFirstName",document.getElementById("complainantFirstName").value);
		        window.localStorage.setItem("complainantEmail",document.getElementById("complainantEmail").value);
		        window.localStorage.setItem("complainantMobileTelephone",document.getElementById("complainantMobileTelephone").value);
		    //}
		   		
		return true;
	}
	   
   function fileSelected() {
          var fup = document.getElementById('fileUpload').files[0];
          
          var fileName = fup.name;
          var ext = fileName.substring(fileName.lastIndexOf('.') + 1);
   			//alert(ext);
          if(ext == "gif" || ext == "GIF" || ext == "JPEG" || ext == "jpeg" || ext == "jpg" || ext == "JPG" || ext == "doc" || ext == "docx" || ext == "DOCX" || ext == "png" || ext == "PNG"  || ext == "txt"  || ext == "TXT")
          {
        	  if (fup) {
                  ParseFile(fup);
                    var fileSize = 0;
                    if (file.size > 1024 * 1024)
                      fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
                    else
                      fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';
          return true;
        	  }
          } 
          else
          {		
        	document.getElementById('fileUpload').value = '';
        	errornotification("error","Upload files with these formats : gif,jpg,jpeg,png,txt,docx");
            return false;
          }
       }
     

 function ParseFile(file) {

		Output(
			"<p>File information: <strong>" + file.name +
			"</strong> type: <strong>" + file.type +
			"</strong> size: <strong>" + file.size +
			"</strong> bytes</p>"
		);

		// display an image
		if (file.type.indexOf("image") == 0) {
			var reader = new FileReader();
			reader.onload = function(e) {
				Output(
					"<p><strong>" + file.name + ":</strong><br />" +
					'<img width=50% height=50% src="' + e.target.result + '" /></p>'
				);
			}
			reader.readAsDataURL(file);
		}

		// display text
		if (file.type.indexOf("text") == 0) {
			var reader = new FileReader();
			reader.onload = function(e) {
				Output(
					"<p><strong>" + file.name + ":</strong></p><pre width=50% height=50%>" +
					e.target.result.replace(/</g, "&lt;").replace(/>/g, "&gt;") +
					"</pre>"
				);
			}
			reader.readAsText(file);
		}

	}
	
	function Output(msg) {
		var m = document.getElementById("messages");
		m.innerHTML ="";
		m.innerHTML = msg + m.innerHTML;
	}

	function showHideComplaintType()
	{
     var ft = $('#top5ComplaintTypes').val();
     if(ft!=-1) {
      		$("#categoryType").hide();
     }
     else {
    	 $("#categoryType").show();
	 }

     var compCat = $('#complaincategory').val();
     if(compCat!=-1) {
      		$("#frequentType").hide();
     }
     else {
    	 $("#frequentType").show();
	 }
	}

</script>
</head>
<body onload="init();">

	<s:form action="registerGrievance!save.action" method="post"
		enctype="multipart/form-data" theme="simple" name="tablet" id="tablet"
		data-ajax="false">
		<s:token />
		<s:push value="model">
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
			<div data-role="page" id="home" data-position="fixed">
				<!-- menupanel  -->
				<div data-mini="true" class="ui-panel" data-role="panel" data-theme="b" id="mypanel"
					data-display="overlay" data-position="left"
					data-position-fixed="false" data-rel="close" data-theme="none">
					<ul data-mini="true" data-role="listview" data-theme="c"
						class="nav-search">

						<li data-icon="false"><a href="#" data-rel="close"><img
								src="/mobile/images/Close.png" class="ui-li-icon">Close Menu</a></li>

						<div data-mini="true" data-role="collapsible" data-collapsed="false"
							data-expanded-icon="arrow-u" data-collapsed-icon="arrow-d"
							data-iconpos="left" data-content-theme="c">
							<h3>Grievances</h3>
							<ul data-role="listview" data-theme="c" class="nav-search">
								<li data-mini="true" data-icon="false"><a id="registerComp"><img
										src="/mobile/images/register.jpg" class="ui-li-icon">Register
										Complaint</a></li>
								<li data-mini="true" data-icon="false"><a
									id="viewComplaint"><img src="/mobile/images/view.png"
										class="ui-li-icon">My Complaints </a></li>
								<li data-mini="true" data-icon="false"><a
									id="viewComplaintMap" data-ajax="false"><img
										src="/mobile/images/mapimg.jpg" class="ui-li-icon">View
										Complaint on Map </a></li>-
								<li data-mini="true" data-icon="false"><a
									id="completedComplaints" data-ajax="false"><img
										src="/mobile/images/completed.jpeg" class="ui-li-icon">My Completed
										Complaint</a></li>		
							</ul>
						</div>

						
					</ul>
				</div>
				<!--End menupanel  -->
				<!--Userpanel  -->
				<div class="ui-panel" data-dismissible="false" data-role="panel"
					data-theme="b" id="userpanel" data-display="overlay" width="50%"
					data-position="right" data-position-fixed="false" data-rel="close"
					data-theme="none">
					<div>

						<label for="complainantFirstName"> First Name </label> <input
							type="text" name="complainantFirstName" id="complainantFirstName"
							data-mini="true">

					</div>

					<div>

						<label for="complainantMobileTelephone"> Phone Number <span><font
								color="red">*</font></span></label> <input id="complainantMobileTelephone"
							maxlength="10" placeholder="" value="" type="tel"
							data-mini="true" class="required"
							name="complainantMobileTelephone" />

					</div>

					<div>

						<label for="complainantEmail"> Email </label> <input
							id="complainantEmail" placeholder="" value=""
							name="complainantEmail" type="email" data-mini="true" />

					</div>

					<div class="ui-grid-a">

						<div class="ui-block-b">
							<a href="#" data-rel="close"
								onclick=" return validateuserinfo();" data-role="button"
								data-theme="b" data-mini="true">Save</a>
						</div>
						<!--
					   		
					   		<div class="ui-block-b"><input onclick=" return validateuserinfo();"  type="button" value="Save" /></div>
						     <div class="ui-block-a"><a href="#" data-rel="close" data-role="button" data-theme="c" data-mini="true">Cancel</a></div>
						-->
					</div>

				</div>
				<!-- End Userpanel  -->
				<div  data-theme="b" data-role="header" data-position="fixed">
					<a data-mini="true" href="#mypanel" id="menubuttons" data-theme="b" data-icon="grid"
						class="ui-btn-left">Menu</a> <a href="#" id="logout"
						data-ajax="false" data-theme="b" data-icon="delete"
						class="ui-btn-right">Log Out</a>
					<h6 align="left">Mobile PGR</h6>
					<div id="notificationWrapper"></div>
				</div>
				<div align="center" style="padding: 4px"></div>
				<div data-mini="true" id="attachdiv"></div>


			</div>

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
				<div data-mini="true" data-theme="b" data-role="header" data-position="fixed">
					<a href="#locationdetails" data-icon="arrow-r"
						data-transition="none" data-theme="b" class="ui-btn-right">Next</a>
					<h5>Complaint Details</h5>
				</div>

				<div data-mini="true" data-role="content" id="contentMain" style="padding: 5px">
					<div data-role="fieldcontain" id="frequentType">
						<fieldset data-mini="true" data-role="controlgroup">
							<legend style="padding: 5px">Frequently Filed Complaint
								Types :</legend>
							<s:select data-mini="true" id="top5ComplaintTypes"
								name="top5ComplaintTypes" list="frequentComplaintMap"
								listKey="key" listValue="value" headerKey="-1"
								headerValue="Select Frequent Complaints"
								value="%{top5ComplaintTypes}">
							</s:select>
						</fieldset>
					</div>
					<div data-mini="true" data-role="fieldcontain" id="categoryType">
						<fieldset data-mini="true" data-role="controlgroup">
							<legend style="padding: 5px">Complaint Category and Type
								* :</legend>
							<label for="complaincategory"> Select Complaint Category
							</label>
							<s:select data-mini="true" id="complaincategory"
								name="complaincategory" list="dropdownData.complaintgrouplist"
								listKey="complaintGroupId" listValue="complaintGroupName"
								headerKey="-1" headerValue="Select Complaint Category"
								value="%{complaincategory}">
							</s:select>
							<label for="complaintype1"> Select Complaint Type </label>
							<s:select data-mini="true" id="complaintype1"
								name="complaintype1" list="dropdownData.complainttypelist"
								listKey="complaintTypeId" listValue="complaintTypeName"
								headerKey="-1" value="%{complaintype1}"
								headerValue="Select Complaint Type" data-mini="true">
							</s:select>
							<s:hidden id="complainantAddress1_latitude"
								name="complainantAddress1_latitude" />
							<s:hidden id="mobileNumber" name="mobileNumber" />
							<s:hidden id="complainantAddress1_longitude"
								name="complainantAddress1_longitude" />
						</fieldset>
					</div>

					<div data-role="fieldcontain">
						<label data-mini="true" id="whatLabel" for="complaintDetails">Complaint
							Detail * :</label>
						<s:textarea data-mini="true" cols="40" rows="8"
							id="complaintDetails" name="complaintDetails" class="required"
							maxlength="512"></s:textarea>
					</div>

					


					<div data-mini="true" data-role="content">
						<a data-mini="true" href="#uploadfiles" id="uploadOptionsButton" data-role="button"
							data-transition="none"> Attach File/Photo </a>
					</div>
				</div>

				<div id="footers" data-theme="c" data-role="footer"
					data-position="fixed" class="nav-footer" data-mini="true">
					<div data-role="navbar" class="nav-footer">
						<ul>
							<li><a href="/mobile/pgr/registerGrievance!newform.action"
								id="backbtn" data-icon="custom">Back</a></li>
							<li><a href="/mobile/pgr/registerGrievance!newform.action"
								id="homebtn" data-iconpos="notext" data-icon="custom">Home</a></li>
							<li><a href="#locationdetails" id="forwardbtn"
								data-icon="custom">Next</a></li>
						</ul>
					</div>

				</div>
			</div>

			<div id="uploadfiles" data-role="page" data-add-back-btn="true"
				class="pageclass">

				<div data-theme="b" data-role="header" data-position="fixed">
					<a href="#locationdetails" data-icon="arrow-r"
						data-transition="none" data-theme="b" class="ui-btn-right">Next</a>
					<h5>Select File</h5>
				</div>
				<div data-role="content" align="center">
					<label for="fileUpload"> Attach File/Photo </label> <input
						type="file" name="fileUpload" id="fileUpload"
						accept="/*;capture=camera" onchange="fileSelected();" />
					<div id="messages"></div>
					<s:hidden id="imageDetail" name="imageDetail" />
				</div>
				<div data-theme="c" data-role="footer" data-position="fixed">
					<div data-role="navbar">
						<ul>
							<li><a href="#complaintdetails" id="backbtn"
								data-icon="custom">Back</a></li>
							<li><a href="#home" data-iconpos="notext" id="homebtn" data-icon="custom">Home</a></li>
							<li><a href="#locationdetails" id="forwardbtn"
								data-icon="custom">Next</a></li>
						</ul>
					</div>

				</div>
			</div>


			<div id="locationdetails" data-role="page" data-add-back-btn="true"
				class="pageclass">
				<div data-theme="b" data-role="header" data-position="fixed">
					<a href="#home" data-iconpos="notext" data-icon="home" data-transition="none"
						data-theme="b" class="ui-btn-right">Home</a>
					<h5>Address Details</h5>
				</div>

				<div data-role="content" name="contentMain" style="padding: 5px">
					<div data-role="fieldcontain">
						<fieldset data-role="controlgroup">
							<legend>Complaint Location * : </legend>
							<s:select data-mini="true" headerKey="-1"
								headerValue="Select Area" name="adminBndry5" id="adminBndry5"
								list="dropdownData.areaList" listKey="id" listValue='name'
								data-mini="true" value="%{adminBndry5}" />
							<s:select data-mini="true" headerKey="-1"
								headerValue="Select Location" name="adminBndry6"
								id="adminBndry6" value="%{adminBndry6}"
								list="dropdownData.locationList" listKey="id" listValue='name' />
							<s:select data-mini="true" headerKey="-1"
								headerValue="Select Street" name="adminBndry7" id="adminBndry7"
								list="dropdownData.streetList" listKey="id" listValue='name'
								value="%{adminBndry7}" />
						</fieldset>
					</div>

					<div data-role="fieldcontain">
						<label id="Address" for="complainantAddress1">Address :</label>
						<s:textarea data-mini="true" cols="40" rows="8"
							id="complainantAddress1" name="complainantAddress1" class=""
							maxlength="210"></s:textarea>
					</div>
					<div data-role="content">
						<a href="#googlemaps" id="mapsButton" data-role="button"
							onclick="generatemaps();" data-mini="true" data-transition="none">
							Google Maps </a>
					</div>

					<fieldset class="ui-grid-a">
						<div class="ui-block-a">
							<a href="#home" data-mini="true" data-role="button" id="cancell" onclick=""
								data-theme="d">Cancel</a>
						</div>
						<div class="ui-block-b">
							<button type="submit" data-mini="true" id="submit" onclick="validateForm();"
								data-theme="b">Submit</button>
						</div>
					</fieldset>

				</div>
			</div>

			<div id="googlemaps" data-role="page" data-add-back-btn="true"
				class="pageclass">
				<div data-theme="b" data-role="header" data-position="fixed">
					<a href="#locationdetails" data-icon="arrow-r"
						data-transition="none" data-theme="b" class="ui-btn-right">Next</a>
					<h5>Google Maps</h5>
				</div>
				<div data-role="content">
					<div id="abc" class="" style="padding: 0em;">
						<div id="map_canvas" name="closed" style="height: 350px;"></div>
					</div>
				</div>
				<fieldset class="ui-grid-a">
					<div class="ui-block-a">
						<s:hidden id="lats" name="lats" />
						<s:hidden id="lons" name="lons" />
						<a href="#locationdetails" data-transition="none"
							data-role="button" id="mapok" onclick="" data-theme="b">Ok</a>
					</div>
					<div class="ui-block-b">
						<a href="#locationdetails" data-transition="none"
							data-role="button" id="cancelmap" onclick="" data-theme="d">Cancel</a>
					</div>
				</fieldset>
			</div>
		</s:push>
	</s:form>
</body>
</html>
