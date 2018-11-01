<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    body {text-align:center;}
</style>
</head>
<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    session.setAttribute("username", username);
%>
<body>
    <H2>상품 선택</H2>
    <%= username %>님이 로그인한 상태입니다.

    <form name="form2" method="post" action="addProduct.jsp">
        <select name="product">
            <option>웹프로그래밍 책</option>
            <option>Java프로그래밍 책</option>
            <option>C프로그래밍 책</option>
        </select>
        <input type="submit" value="추가 " />
    </form>
    <a href="checkOut.jsp">결재</a>
</body>
</html>
