<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>JSP Q10 I</title>
  </head>
  <body>
    <c:set var="a" value="${param.input}" scope="session" />
    <c:out value="Hello ${a}" />
    <form action="q10ii.jsp" method="post">
      <table>
        <tr>
          <td>Please choose the products you want to buy</td>
        </tr>
        <tr>
          <td>
            <input type="checkbox" name="options" value="Garments"
            ${Garmentsselected ? 'checked':'' }>Garments
          </td>
        </tr>
        <tr>
          <td>
            <input type="checkbox" name="options" value="Foods" ${Foodsselected
            ? 'checked':'' }>Foods
          </td>
        </tr>
        <tr>
          <td>
            <input type="checkbox" name="options" value="Medicines"
            ${Medicinesselected ? 'checked':'' }>Medicines
          </td>
        </tr>
        <tr>
          <td><input type="submit" value="submit" /></td>
        </tr>
      </table>
    </form>
  </body>
</html>
