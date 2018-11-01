<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
    body {text-align:center;}
</style>
<% request.setCharacterEncoding("UTF-8"); %>
<body>
    <h2><%= session.getAttribute("username") %>님이 선택한 상품목록</h2>
    <%
        ArrayList list = (ArrayList)session.getAttribute("productlist");
        if (list==null) out.println("선택한 상품이 없습니다.");
        else {
            for(Object product:list)
                out.println(product + "<br>");
        }
    %>
</body>
</html>
