<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP Q3</title>
</head>
<body>
<form action="JSPQ3.jsp">
<c:if test="${param.submitted and empty param.name}">
<font color="Limegreen">
<c:out value="Null Value,Enter Again!" ></c:out></font>
</c:if>
<br>
Enter Your Name:<input type="text" name="name" value="${param.name }" ><br>
<c:if test="${param.submitted and empty param.id}">
<font color="Limegreen">
<c:out value="Null Value,Enter Again!"></c:out></font>
</c:if>
<br>
Enter D.O.B: <input type="date" name="id" value="${param.id }"  ><br>
<c:if test="${param.submitted and empty param.email}">
<font color="Limegreen">
<c:out value="Null Value,Enter Again!"></c:out></font>
</c:if>
<br>
Enter E-mail: <input type=text name="email" value="${param.email }"  ><br>
<c:if test="${param.submitted and empty param.gender}">
<font color="Limegreen">
<c:out value="Null Value,Enter Again!"></c:out></font>
</c:if>
<br>
Enter Gender:<br>
<c:choose>
<c:when test="${param.gender == 'f'}">
<input type="radio" name="gender" value="m">
<label for="m">Male</label><br>
<input type="radio" name="gender" value="f" checked>
<label for="f">Female</label><br>
</c:when>
<c:otherwise>
<input type="radio" name="gender" value="m" checked>
<label for="m">Male</label><br>
<input type="radio" name="gender" value="f">
<label for="f">Female</label><br>
</c:otherwise>
</c:choose>
	
	<c:if test="${param.submitted and empty param.lucky}">
<font color="Limegreen">
<c:out value="Null Value,Enter Again!"></c:out></font>
</c:if>
<br>
Enter Your Lucky Number:<input type=number name="lucky" value="${param.lucky}" ><br>

<c:forEach items="${paramValues.choices}" var="food">
<c:choose>
<c:when test="${food=='pizza' }">
<c:set var="pizzaSelected" value="true"/>
</c:when>
<c:when test="${food=='garlic' }">
<c:set var="garlicSelected" value="true"/>
</c:when>
<c:when test="${food=='pasta' }">
<c:set var="pastaSelected" value="true"/>
</c:when>
<c:when test="${food=='sandwich' }">
<c:set var="sandwichSelected" value="true"/>
</c:when>
</c:choose>
</c:forEach>
	
<h2>Select your Favorite Food:</h2><br>
	<input type="checkbox" name="choices" id="c1" value="pizza" ${pizzaSelected ? 'checked' :''}>
	<label for="c1">Pizza</label><br>
	<input type="checkbox" name="choices" id="c2" value="garlic" ${garlicSelected ? 'checked' :''}>
	<label for="c2">Garlic Bread</label><br>
	<input type="checkbox" name="choices" id="c3" value="pasta" ${pastaSelected ? 'checked' :''}>
	<label for="c3">Red Sauce Pasta</label><br>
	<input type="checkbox" name="choices" id="c4" value="sandwich" ${sandwichSelected ? 'checked' :''}>
	<label for="c4">Grill Sandwich</label><br>
	<input type="submit" name="submit" value="ENTER">
	<input type="hidden" name="submitted" value="true">
	
</form>


</body>
</html>