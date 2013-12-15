<%@ page contentType="text/json" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
{
"ResultSet": {
    "Result":[
    <s:iterator var="s" value="complainttypelist" status="status">  
    {"Id":"<s:property value="%{complaintTypeId}" />",
    "Description":"<s:property value="%{complaintTypeName}" />"
    }<s:if test="!#status.last">,</s:if>
    </s:iterator>       
    ]
  }
}