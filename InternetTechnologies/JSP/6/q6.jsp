<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="all"
uri="/WEB-INF/tlds/custom" %>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>JSP Q6</title>
  </head>
  <body>
    <all:hello name="${param.name}" /><br /><br />
    <all:choco texture="${param.choc}" />
  </body>
</html>
