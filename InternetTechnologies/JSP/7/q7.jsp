<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="all"
uri="/WEB-INF/tlds/program7"%>

<!DOCTYPE html>
<html>
  <head>
    <title>JSP Q7</title>
  </head>
  <body>
    <all:substring
      end="${param.end}"
      input="${param.input}"
      start="${param.start}"
    ></all:substring>
  </body>
</html>
