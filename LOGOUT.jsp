<%@ page language="java"
    contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<%
    request.setCharacterEncoding("euc-kr");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title> Logout </title>
</head>
<body>

    <%
    // 로그아웃 버튼을 누르면 오게되는 곳인데
    // session을 재시작해서 저장된 정보를 날린다
    session.invalidate();
    // 그리고 다시 main.jsp로 돌아가게 한다
    response.sendRedirect("main.jsp"); 
    %>

</body>
</html>
