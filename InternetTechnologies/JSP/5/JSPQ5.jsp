<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%> <%@ taglib prefix="c" uri =
"http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fn" uri =
"http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>JSP Q5</title>
  </head>
  <body>
    <c:if test="${param.choice=='odd' }">
      <c:set var="str" value="${param.string }" />
      <c:set var="flag" value="1" />
      <c:forEach var="j" begin="0" end="${fn:length(str)-1 }" step="2">
        <c:set var="check" value="${fn:substring(str,j,j+1) }" />
        <c:if
          test="${check!='a' and check!='e' and check!='i' and check!='o' and check!='u'}"
        >
          <c:set var="flag" value="0" />
        </c:if>
      </c:forEach>
      <c:if test="${flag=='0' }">
        <c:out value="You lose" />
      </c:if>
      <c:if test="${flag=='1' }">
        <c:out value="You win" />
      </c:if>
    </c:if>
    <c:if test="${param.choice=='even' }">
      <c:set var="str" value="${param.string }" />
      <c:set var="flag" value="1" />
      <c:forEach var="j" begin="1" end="${fn:length(str)-1 }" step="2">
        <c:set var="check" value="${fn:substring(str,j,j+1) }" />
        <c:if
          test="${check!='a' and check!='e' and check!='i' and check!='o' and check!='u'}"
        >
          <c:set var="flag" value="0" />
        </c:if>
      </c:forEach>
      <c:if test="${flag=='0' }">
        <c:out value="You lose" />
      </c:if>
      <c:if test="${flag=='1' }">
        <c:out value="You win" />
      </c:if>
    </c:if>
  </body>
</html>
