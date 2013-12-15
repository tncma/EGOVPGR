<%@ include file="/includes/taglibs.jsp" %>
<head>
<title>User Aggregate Report</title>
<link rel="stylesheet" href="../css/mobilePOC.css" />
<link rel="stylesheet" href="../css/egov.css" />
<link rel="stylesheet" href="../css/commonegov.css" />
<script type="text/javascript" src="<c:url value='/javascript/calender.js'/>"></script>
<script type="text/javascript" src="<c:url value='/javascript/dateValidation.js'/>"></script>
<script>
setTimeout(function(){
   window.location.reload(1);
}, 30000);

function validate()
{
	var fromdate=document.getElementById("fromDate").value;
	var todate=document.getElementById("toDate").value;
	if(fromdate!="" && todate!="" && fromdate!=todate)
	{
		if(!checkFdateTdate(fromdate,todate))
		{
			document.getElementById("comparedatemessage").style.display="block";
			window.scroll(0,0);
			return false;
		}
	}
	else
	{
		document.getElementById("comparedatemessage").style.display="none";
		return true;
	}
}
</script>
</head>
<span align="center" style="display:none" id="comparedatemessage">
  <li>
     <font size="2" color="red"><b>
		From Date should be less then To Date.
	</b></font>
  </li>
</span>
<body>
<s:form theme="simple" name="userAggregatePOCForm" action="userAggregatePOC">
<div><div><b>User Aggregate Report</b></div>
<div class="subheadsmallnew"><span class="subheadnew">Search Criteria</span></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="4%" class="bluebox">&nbsp;</td>
	      	<td width="21%" class="bluebox">From Date</td>
		  <s:date name="fromDate" var="cdFormat" format="dd/MM/yyyy"/>
		  <td width="24%" class="bluebox"><s:textfield id="fromDate" name="fromDate" value="%{cdFormat}" onfocus="javascript:vDateType='3';" onkeyup="DateFormat(this,this.value,event,false,'3')"/><a href="javascript:show_calendar('forms[0].fromDate');" onmouseover="window.status='Date Picker';return true;"  onmouseout="window.status='';return true;"  ><img src="${pageContext.request.contextPath}/images/calendaricon.gif" alt="Date" width="18" height="18" border="0" align="absmiddle" /></a><div class="highlight2" style="width:80px">DD/MM/YYYY</div></td>
	      	<td width="21%" class="bluebox">To Date</td>
	      	<s:date name="toDate" var="cdFormat1" format="dd/MM/yyyy"/>
		<td width="30%" class="bluebox"><s:textfield id="toDate" name="toDate" value="%{cdFormat1}" onfocus="javascript:vDateType='3';" onkeyup="DateFormat(this,this.value,event,false,'3')"/><a href="javascript:show_calendar('forms[0].toDate');" onmouseover="window.status='Date Picker';return true;"  onmouseout="window.status='';return true;"  ><img src="${pageContext.request.contextPath}/images/calendaricon.gif" alt="Date" width="18" height="18" border="0" align="absmiddle" /></a><div class="highlight2" style="width:80px">DD/MM/YYYY</div></td>
	</tr>
</table>
<br>
</div>
    <div class="buttonbottom">
      <label><s:submit type="submit" cssClass="buttonsubmit" id="button" value="Search" method="search" onclick="return validate();"/></label>&nbsp;
      <label><s:submit type="submit" cssClass="button" value="Reset" method="reset"/></label>&nbsp;
      <logic:empty name="results">
      	<input name="closebutton" type="button" class="button" id="closebutton" value="Close" onclick="window.close();"/>
      </logic:empty>
</div>
<logic:notEmpty name="searchResult">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="tablebottom">
<div align="center">		
<display:table name="searchResult" uid="currentRow" pagesize = "20" style="border:1px;width:100%;empty-cells:show;border-collapse:collapse;" export="false" requestURI="" varTotals="pageTotal">
<display:column headerClass="bluebgheadtd" class="blueborderfortd" title="Sl.No" style="width:3%;text-align:center"><s:property value="%{#attr.currentRow_rowNum+ (page-1)*pageSize}"/></display:column>
<display:column headerClass="bluebgheadtd" class="blueborderfortd" title="User Name" style="width:10%;text-align:center" property="userName" />
<display:column headerClass="bluebgheadtd" class="blueborderfortd" title="Amount Collected (in KSH)" style="width:10%;text-align:center" property="amount" format="{0, number, #,##0.00}" total="true" />
<display:footer>
	<td class="reportrowheader">&nbsp;</td>
	<td class="reportrowheader" align="right"><b>Total:</b></td>	
  	<td class="reportrowheader" align="center"><b>${pageTotal.column3}</b></td>
  </display:footer>
</display:table>
	
</table>
</logic:notEmpty>
<logic:empty name="searchResult">
	<s:if test="target=='searchresult'">
	
		<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="tablebottom">
		<tr> 
			<div>&nbsp;</div>
			<div class="subheadnew">No Records Found</div>
		</tr>
		</table>
	
	</s:if>
</logic:empty>


</s:form>
</body>

	

