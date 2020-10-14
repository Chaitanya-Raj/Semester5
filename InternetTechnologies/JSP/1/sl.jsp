<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP 1</title>
</head>
<body>

<form action="sl.jsp" method="post">
<h4>Enter Number of Rows:</h4>
<input type="text" name="r" />
<input type="submit" value="Enter" />
</form>
<%! int num,i,j;   %>
	<%
		if(request.getParameter("r")!=null)
		{
			num=Integer.parseInt(request.getParameter("r"));
	%>
			<H1> Pattern:  <%=num%>  </H1> 
			<%
				for(i=1; i<=num; i++)
				{
					for(j=1; j<=i; j++)
					{
			%>
					<%=j%>
				<%
					}
				%>
				<br/>
		<%
			}
		%>
	<%
	}
%>
</body>
</html>