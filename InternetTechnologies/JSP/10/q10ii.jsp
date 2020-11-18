<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>JSP Q10 II</title>
  </head>
  <body>
    <table>
      <tr>
        <td><c:out value="Hello ${a}" /></td>
      </tr>
      <tr>
        <td>You Have selected following favourite food/foods</td>
      </tr>
      <c:forEach items="${paramValues.options}" var="i">
        <c:if test="${ i=='Garments' }">
          <tr>
            <td><c:out value="->Garments" /></td>
          </tr>
        </c:if>
        <c:if test="${ i=='Foods' }">
          <tr>
            <td><c:out value="->Foods" /></td>
          </tr>
        </c:if>
        <c:if test="${ i=='Medicines' }">
          <tr>
            <td><c:out value="->Medicines" /></td>
          </tr>
        </c:if>
      </c:forEach>
    </table>
  </body>
</html>
