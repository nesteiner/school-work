<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--核心标签--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:out value="Fuck you"></c:out>
<c:set var="salary" scope="session" value="${2000*2}"></c:set>
<c:out value="${salary}"/>

<c:catch var="exception">
    <% int x = 5 /0; %>
</c:catch>

<c:if test="${exception != null}">
    <p>异常为: ${exception},
        发生了异常：${exception.message}
    </p>
</c:if>

<c:if test="${salary > 2000}" var="result">
    <p>${salary}</p>
    <p>${result}</p>
</c:if>

<c:forEach var="i" begin="1" end="5">
    <p> Item <c:out value="${i}"></c:out> </p>
</c:forEach>

<%--try walk list--%>
<%@ page import="java.util.*" %>
<%
    List<Integer> list = new LinkedList<>();
    for(int i = 1; i <= 10; i += 1) {
        list.add(i);
    }

//    request.setAttribute("list", list);
%>

<c:out value="print list"></c:out>
<c:forEach var="i" items="${list}">
    <p>Item: <c:out value="${i}"></c:out></p>
</c:forEach>

<c:forTokens items="google,runoob,taobao" delims="," var="name">
    <c:out value="${name}"></c:out>
</c:forTokens>

<c:url var="myURL" value="main.jsp">
    <c:param name="name" value="Runoob"/>
    <c:param name="url" value="www.runoob.com"/>
</c:url>

<c:out value="${myURL}"/>

<%--<c:redirect url="http://www.runoob.com"/>--%>
<%--格式化标签--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%--SQL 标签--%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%--XML 标签--%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<%--JSTL 函数--%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
