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
<link rel="stylesheet" href="../mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link rel="stylesheet" href="../mobile/jquery/css/jquery.toastmessage.css" /> 
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
<script src="../mobile/jquery/jquery-1.7.2.min.js"></script>
<script src="../mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript" src="../mobile/jquery/map/jquery.ui.map.js"></script>
<script type="text/javascript" src="../mobile/jquery/jquery.toastmessage.js"></script>  
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



$('#map_canvas').gmap({'center': '20.016789684314304,77.69557234062495'}).bind('init', function() { 
	
	$.getJSON( '/mobile/pgr/grievance!getMarkersforStatusReportMap.action',{complaintTypeId:'<s:property value="complaintTypeId"/>',complaintStatus:'<s:property value="complaintStatus"/>'}, function(data) { 
	
	if(data.markers==""){
	
 errornotification("notice","No Complaints found to show on map");
	}
		$.each( data.markers, function(i, marker) {
		 if(marker.latitude!=0){
			$('#map_canvas').gmap('addMarker', { 
				'position': new google.maps.LatLng(marker.latitude, marker.longitude), 
				'bounds': true,
				 'icon': getMarkerImage(marker.colour),
			}).click(function() {
				$('#map_canvas').gmap('openInfoWindow', { 'content': marker.content }, this);
			});
			$('#map_canvas').gmap('option', 'zoom', 9);
			}
		});
		
	});
});

});

function getMarkerImage(iconColor) {

   if ((typeof(iconColor)=="undefined") || (iconColor==null)) { 
      iconColor = "red"; 
   }
   if (!icons[iconColor]) {
      icons[iconColor] = {
        url: "http://labs.google.com/ridefinder/images/mm_20_"+ iconColor +".png",
        // This marker is 20 pixels wide by 32 pixels tall.
        size: new google.maps.Size(12, 20),
        // The origin for this image is 0,0.
        origin: new google.maps.Point(0,0),
        // The anchor for this image is the base of the flagpole at 0,32.
        anchor: new google.maps.Point(6, 20)};
   } 
   return icons[iconColor];
}

var icons = new Array();
icons["green"] = {
      url: "http://labs.google.com/ridefinder/images/mm_20_green.png",
      // This marker is 20 pixels wide by 32 pixels tall.
      size: new google.maps.Size(50, 50),
      // The origin for this image is 0,0.
      origin: new google.maps.Point(0,0),
      // The anchor for this image is the base of the flagpole at 0,32.
      anchor: new google.maps.Point(12, 35)
    };
 icons["yellow"] = {
      url: "http://labs.google.com/ridefinder/images/mm_20_yellow.png",
      // This marker is 20 pixels wide by 32 pixels tall.
      size: new google.maps.Size(50, 50),
      // The origin for this image is 0,0.
      origin: new google.maps.Point(0,0),
      // The anchor for this image is the base of the flagpole at 0,32.
      anchor: new google.maps.Point(12, 35)
    };   
</script>
</head>  

<body >
	
	<form action="#" method="get" name="tablet" id="tablet"	data-ajax="false">
	
  <div data-role="page" id="viewcomplaint" class="pageclass"  >

		<div data-theme="b" data-role="header" data-position="fixed">

		<a href="javascript:history.back(1)" 	data-ajax="false" data-icon="arrow-l" data-transition="none"
					data-theme="b" class="ui-btn-left">Back</a>
				
				<h5>View Complaints</h5>
			</div>
	 
	 <div align="center" style="padding: 10px" data-role="content" class="ui-content" role="main"></div>
 	<div id="map_canvas"  style="height: 350px ;"></div>
	<div id="infotable" style="padding: 20px">
	<table align="left" >
    <tbody>
      <tr>
       <td><img id="LoginForm:redMarker" src="http://labs.google.com/ridefinder/images/mm_20_red.png"  title="Registered Complaints"></td>
           <td><label style="font-size:14;">
          Complaints - Registered</label></td>
</tr>
<tr>
<td><img id="LoginForm:yellowMarker" src="http://labs.google.com/ridefinder/images/mm_20_green.png"  title="InProgress Complaints"></td>
<td><label style="font-size:14;">
  Complaints - Completed</label></td>
</tr>
<tr>
<td><img id="LoginForm:blueMarker" src="http://labs.google.com/ridefinder/images/mm_20_yellow.png"  title="Resolved Complaints"></td>
<td><label style="font-size:14;">
 Complaints - Withdrawn </label></td>
</tr>

     <tr>
       <td><img id="LoginForm:redMarker" src="http://labs.google.com/ridefinder/images/mm_20_blue.png"  title="Registered Complaints"></td>
           <td><label style="font-size:14;">
          Complaints - Rejected</label></td>
</tr>
<tr>
<td><img id="LoginForm:yellowMarker" src="http://labs.google.com/ridefinder/images/mm_20_white.png"  title="InProgress Complaints"></td>
<td><label style="font-size:14;">
  Complaints - Forwarded</label></td>
</tr>
<tr>
<td><img id="LoginForm:blueMarker" src="http://labs.google.com/ridefinder/images/mm_20_orange.png"  title="Resolved Complaints"></td>
<td><label style="font-size:14;">
 Complaints - Processing </label></td>
</tr>

     <tr>
       <td><img id="LoginForm:redMarker" src="http://labs.google.com/ridefinder/images/mm_20_black.png"  title="Registered Complaints"></td>
           <td><label style="font-size:14;">
          Complaints - ReOpened</label></td>
</tr>


</tbody>
</table>
	</div>	

  </div>

	</form>
</body>
</html>