<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {text-align:center;}
</style>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String product = request.getParameter("product");
    ArrayList list = (ArrayList)session.getAttribute("productlist");
    if (list==null) list = new ArrayList();
    list.add(product);
    session.setAttribute("productlist",list);
    out.println(product+"이(가) 추가되었습니다.");
    //response.sendRedirect("selProduct.jsp");
%>
<br>
<br>

  <input type="button" value="뒤로가" onclick="history.back(-1);">

</body>
</html>
