<%@ taglib prefix="s" uri="/WEB-INF/struts-tags.tld"%>
<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<script>

 $('#loadmore').bind('click', function () {
 
  var pageNum=$("#pageNumber").val();
 var newpagenum= eval(pageNum)+eval(1);
  $("#pageNumber").val(newpagenum)
 getPaginatedData();});	
 
 
</script>
		<div data-role="content" style="padding: 10px" >									                    
				<s:if test="%{reportlist.size!=0}">
					<ul id="complaintul" data-filter="true" data-clear-btn="true" data-filter-placeholder="Filter Complaints" data-mini="true" data-role="listview" data-theme="d" data-divider-theme="b" data-add-back-btn="true" class="pageclass" data-inset="true">
					
						<s:iterator value="reportlist" status="status">		
			 					<li data-mini="true" data-role="list-divider"><s:property value="%{complaintno}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="%{date}"/></li>
								<li data-mini="true" data-icon="false"><a data-transition="none" data-ajax="false" href="/mobile/pgr/registerGrievance!viewComplaintDetails.action?complaintId=<s:property value="complaintid"/>"</a> 
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
						<s:if test="%{totalComplaintsSize<=5}">
						<div id="paginationdescription" align="center"><p>Showing <s:text name="totalComplaintsSize"></s:text> of <s:text name="totalComplaintsSize"></s:text></p></div>
						
					    </s:if>
					    <s:else>
					    <div id="paginationdescription" align="center"><p>Showing 5 of <s:text name="totalComplaintsSize"></s:text></p></div>
						<li  id="loadmore" ><a href="#"data-theme="b" data-role="button" data-mini="true" data-icon="false" >Load More......</a></li>
					   
					    </s:else>
					  
							<s:hidden id="pageNumber" name="pageNumber" value="%{pageNo}"/>
					        <s:hidden id="pagesiz" name="pagesiz" value="%{pageSize}"/>
						</s:if>	
						<s:else>
					     <p align="center"><strong>No Complaints Registered from this number <s:property value="%{ajaxPhoneNum}"/></strong></p>
						</s:else>
					
		     
		</div>

