

<!DOCTYPE html>
<html>
  <head>
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <style>
      html, body, #map-canvas {
        margin: 0;
        padding: 0;
        height: 100%;
      }
    </style>
   <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=visualization"></script>

    <script>
var map;
function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(13.0708065920815,80.1841618646423),
     mapTypeId: google.maps.MapTypeId.SATELLITE
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
      var taxiData = [
  new google.maps.LatLng(13.0285623,80.2592859),
  new google.maps.LatLng(13.0823417,80.2711892),
   new google.maps.LatLng(13.060422,80.249583),
    new google.maps.LatLng(13.0722466364028,80.2320318464844),
     new google.maps.LatLng(13.0655580304783,80.21143248125),
      new google.maps.LatLng(13.0655580304783,80.21143248125),    
       new google.maps.LatLng(13.0388017955256,80.200446153125),
        new google.maps.LatLng(13.0285623,80.2592859),
  new google.maps.LatLng(13.0823417,80.2711892),
   new google.maps.LatLng(13.060422,80.249583),
    new google.maps.LatLng(13.0722466364028,80.2320318464844),
     new google.maps.LatLng(13.0655580304783,80.21143248125),
      new google.maps.LatLng(13.0655580304783,80.21143248125),    
       new google.maps.LatLng(13.0388017955256,80.200446153125),
        new google.maps.LatLng(13.0285623,80.2592859),
  new google.maps.LatLng(13.0823417,80.2711892),
   new google.maps.LatLng(13.060422,80.249583),
    new google.maps.LatLng(13.0722466364028,80.2320318464844),
     new google.maps.LatLng(13.0655580304783,80.21143248125),
      new google.maps.LatLng(13.0655580304783,80.21143248125),    
       new google.maps.LatLng(13.0388017955256,80.200446153125),
        new google.maps.LatLng(13.0285623,80.2592859),
  new google.maps.LatLng(13.0823417,80.2711892),
   new google.maps.LatLng(13.060422,80.249583),
    new google.maps.LatLng(13.0722466364028,80.2320318464844),
     new google.maps.LatLng(13.0655580304783,80.21143248125),
      new google.maps.LatLng(13.0655580304783,80.21143248125),
        new google.maps.LatLng(13.0285623,80.2592859),
  new google.maps.LatLng(13.0823417,80.2711892),
   new google.maps.LatLng(13.060422,80.249583),
    new google.maps.LatLng(13.0722466364028,80.2320318464844),
     new google.maps.LatLng(13.0655580304783,80.21143248125),
      new google.maps.LatLng(13.0655580304783,80.21143248125),    
       new google.maps.LatLng(13.0388017955256,80.200446153125),
        new google.maps.LatLng(13.0285623,80.2592859),
  new google.maps.LatLng(13.0823417,80.2711892),
   new google.maps.LatLng(13.060422,80.249583),
    new google.maps.LatLng(13.0722466364028,80.2320318464844),
     new google.maps.LatLng(13.0655580304783,80.21143248125),
      new google.maps.LatLng(13.0655580304783,80.21143248125),      
       new google.maps.LatLng(13.0388017955256,80.200446153125),
               new google.maps.LatLng(13.0285623,80.2592859)
              
  ]
      
        var pointArray = new google.maps.MVCArray(taxiData);

  heatmap = new google.maps.visualization.HeatmapLayer({
    data: pointArray
  });

  heatmap.setMap(map);
      
}

google.maps.event.addDomListener(window, 'load', initialize);

    </script>
  </head>
  <body>
    <div id="map-canvas"></div>
  </body>
</html>

