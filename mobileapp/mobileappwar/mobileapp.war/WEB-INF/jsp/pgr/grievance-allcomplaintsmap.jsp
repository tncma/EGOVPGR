<%@ page contentType="text/json" %>
<%@ taglib prefix="s" uri="/struts-tags" %>  
{
    "markers":[
    <s:iterator var="s" value="markerList" status="status">  
    {"latitude":<s:property value="%{latitude}" />,
    "longitude":<s:property value="%{longitude}" />,
    "colour":"<s:property value="%{colour}" />",
    "content":"<s:property value="%{content}" />",
     "title":"<s:property value="%{data}" />"
    }<s:if test="!#status.last">,</s:if>
    </s:iterator>       
    ]
  }
