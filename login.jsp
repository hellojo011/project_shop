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
<title> Login </title>
</head>
<body>
    <%
        // 현재 로그인된 아이디가 없다면 (= session에 저장된 id가 없다면)
        if(session.getAttribute("id") == null) {
            %>
            <h3> 로그인 페이지 </h1>
            <img src="wel.jpg">
            <br /> <form action="logincheck.jsp" method="post">
            <br  />
            <table border="2">
              <tr>
                <td bgcolor ="skyblue">아이디</td>
                <td><input name="input_id" type="text" maxlength="50"></td>
              </tr>
              <tr>
                <td bgcolor ="skyblue">비밀번호</td>
                <td><input name="input_pw" type="password" maxlength="50"></td>
              </tr>
            </table>
            <hr>
            <button> 로그인 </button>
            </form>
            <hr>
            <button onClick="location.href='JOIN.jsp'"> 회원가입 </button>
            <%
        }
        // 현재 로그인된 아이디가 있다면 (= session에 저장된 id가 있다면)
        else {
            out.print(session.getAttribute("name") + " 님 환영합니다");
            %>
            <h1> 로그인 페이지 </h1>
            <br /> <form action="LOGOUT.jsp" method="post">
            <br />
            <br /> <button> 로그아웃 </button>
            <br />
            <br /> </form>
            <br /> <button onClick="location.href='CHANGEPROFILE.jsp'"> 개인정보 변경</button>
            <%
        }
    %>


</body>
</html>
