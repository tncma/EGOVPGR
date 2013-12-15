<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<html>
<head>
<title>JQM Charts</title>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="apple-mobile-web-app-capable" content="yes"/>
<link rel="stylesheet" href="../mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.css" />
<link href="../mobile/jquery/jqplot/jquery.jqplot.css" rel="stylesheet" type="text/css" />

<script src="../mobile/jquery/jquery-1.7.2.min.js"></script>
<script src="../mobile/jquery/jquerymobilefiles/jquery.mobile-1.3.1.min.js"></script>
<script class="include" type="text/javascript" src="../mobile/jquery/jqplot/scripts/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="../mobile/jquery/jqplot/scripts/jqplot.barRenderer.min.js"></script>
<script type="text/javascript" src="../mobile/jquery/jqplot/scripts/jqplot.categoryAxisRenderer.min.js"></script>
<script type="text/javascript" src="../mobile/jquery/jqplot/scripts/jqplot.pointLabels.min.js"></script>

<style type="text/css">

#popupPanel {
   
    border: 1px solid #000;
    border-right: none;
    background: rgba(0,0,0,.5);
    margin: -1px 0;
}
#popupPanel .ui-btn {
    margin: 2em 15px;
}
@media all and (max-width: 480px) {
}


</style>
<script>
     $(document).ready(function(){

    <s:if test="%{reportlist.size!=0}">
    var limit='<s:property value="reportlist.size"/>';
    var i;
    var s = [];
    <s:iterator value="reportlist" status="status">		
		s[<s:property value="%{#status.index}"/>]=[];		
		</s:iterator>
	<s:iterator value="reportlist" status="status">	
		s[<s:property value="%{#status.index}"/>][0]=<s:property value="%{complaintid}"/>	
	var complainttypename='<s:property value="%{complainttype}"/>'
		</s:iterator>	
		
    </s:if>
    var ticks = [];
  <s:iterator value="reportlist" status="xaxisstatus">
   <s:if test="#xaxisstatus.first == true">	
		ticks[<s:property value="%{#xaxisstatus.index}"/>]='<s:property value="%{complainttype}"/>'	
</s:if>
		</s:iterator>	
  
      var bars=[];
   for(j=0;j<s.length;j++){
  bars[j]=s[j];
   
   }
 //var line1 = [14, 32, 41, 44, 0, 40];
  //var line1Labels = line1.map(removeZeros);
  // pointLabels:{
    //    show: true,
      //  labels: line1Labels
      //}

    var plot1 =$.jqplot('chart1', bars, {
        // The "seriesDefaults" option is an options object that will
        // be applied to all series in the chart.
        seriesDefaults:{
            renderer:$.jqplot.BarRenderer,
            rendererOptions: {fillToZero: true}
        },
         pointLabels: {show: true},
     
        seriesColors: ["#135909", "#D48506",
        "#1263B9", "#EE1515", "#F4A881", "#ff5800", "#0085cc","#579575", "#c5b47f", "#EAA228", "#4bb2c5",],

        series:getLabels(),
      
        legend: {
            show: true,
            placement: 'insideGrid'
        },
        axes: {
           
            xaxis: {
                renderer: $.jqplot.CategoryAxisRenderer,
                ticks: ticks
            },
           
            yaxis: { 
               
            }
        }
    });


            resizePlot(plot1);
            
           $(window).bind( 'orientationchange', function(e){
    			resizePlot(plot1);
    
          });
            $(window).bind('resize', function(event, ui) {
                resizePlot(plot1);
            });
                      
        });

        function resizePlot($plot) {
            $($plot.targetId).height($(window).height() * 0.75);
            $plot.replot( { resetAxes: true } );
        }
        
        function getLabels() {
  
   var arr= new Array(<s:property value="reportlist.size"/>);
  <s:iterator value="reportlist" status="xaxisstatus">
		  arr[<s:property value="%{#xaxisstatus.index}"/>] = {label:'<s:property value="%{status}"/>'};
  </s:iterator>	
     
   
   return arr; 
      }
      
      function closepopup(){
   
      $( "#popupPanel" ).popup( "close" );
      }
</script>
</head>
<body>
<form action="#" method="get" name="tablet" id="tablet"	data-ajax="false">
	
<s:hidden name="complaintTypeId" value="%{complaintTypeId}"></s:hidden>	   
	
  <div data-role="page" id="viewcomplaint"  data-add-back-btn="true"
			class="pageclass">

			
<div data-role="popup" data-position-to="window" id="popupPanel" data-corners="true" data-theme="none" data-shadow="false" data-tolerance="0,0">

    
   <a data-theme="a" data-ajax="false" onclick="closepopup();"  data-mini="true" href="/mobile/pgr/grievance!getReportforcomplaint.action?reportView=piechart&complaintTypeId=<s:property value="complaintTypeId"/>"  data-role="button">Pie Chart</a>   
	 
</div>
		<div data-theme="b"  data-role="header" data-position="fixed">
		<a href="javascript:history.back(1)" 	data-ajax="false" data-icon="arrow-l" data-transition="none"
					data-theme="b" class="ui-btn-left">Back</a>
				<a href="/mobile/pgr/grievance!userform.action" data-ajax="false" data-icon="home" data-transition="none"
					data-theme="b" class="ui-btn-right">Home</a>
				<h5>View Complaints By Type</h5>
			</div>
 <div id="first" class="example-content">
        <div id="chart1" style="width: 100%;height: 100%"></div>
         <span id="info3"></span>
    </div>
 <a href="#popupPanel" id="chartpopup" data-rel="popup"  data-transition="" data-position-to="window" data-role="button">Charts</a>   
</div>
</form>




</body>
</html>