<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Ques 2</title>
</head>
<body>
<%!float n2,n1,total=0;%>
<%!String op="";%>
<%
  if(request.getParameter("num1")!=null && request.getParameter("num2")!=null)
  {
	  n1=Integer.parseInt(request.getParameter("num1"));
	  n2=Integer.parseInt(request.getParameter("num2"));
	  op=request.getParameter("r1");
	%>
   <h1>First Number : <%=n1%></h1>
   <h1>Second Number : <%=n2%></h1>
   <%
     if(op.equals("a"))
     {
    	 
    	total=n1+n2;   
     }
   %>
    <%
     if(op.equals("s"))
     {
    	  if(n1>n2)
    	  {  
    	   total=n1-n2;
          }
    	  else
    		   total=n2-n1;
     }
    %>
     <%
      if(op.equals("m"))
      {
    	   total=n1*n2;
      }
     %>
     <h1>Result : <%=total%></h1>
     <%
      }
    %>
</body>
</html>