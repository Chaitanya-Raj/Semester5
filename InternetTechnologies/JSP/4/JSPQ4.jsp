<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Q4</title>
</head>
<body>
	<c:set var="now" value="<%=new java.util.Date()%>"></c:set>
	<fmt:formatDate  type="time" value="${now}"/>
	<fmt:formatDate var="hrs" pattern="H" value="${now}"/>
	<br>
	${hrs}
	<br>
	<c:choose>
		<c:when test="${hrs<12 }">
		Good Morning! 	${param.n1 }
		</c:when>
		<c:when test="${hrs>=12 && hrs<18 }">
		Good Afternoon! 	${param.n1 }
		</c:when>
		<c:otherwise>
		Good Evening! 	${param.n1 }
		</c:otherwise>
	</c:choose>
	
</body>
</html>