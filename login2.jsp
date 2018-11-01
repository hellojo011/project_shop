<%@ page language="java"
    contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%
    request.setCharacterEncoding("utf8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title> Login</title>
</head>
<style>
  body{text-align:content;}
</style>
<body>
  <h2>로그인</h2>
  <form name ="form1" method="post" action = "selProduct.jsp">
    <input type ="text" name = "username">
    <input type ="submit" value = "로그인">
  </form>
</body>
</html>
