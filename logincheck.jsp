<%@ page language="java"
    contentType="text/html; charset=utf8"
    pageEncoding="utf8"
    import="java.sql.*"%>
<%
    request.setCharacterEncoding("utf8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<title> Login_Check </title>
</head>
<body>

    <h1> 로그인 체크 페이지 </h1>

    <%
    try {
        // 드라이버 로딩
        String driver = "com.mysql.jdbc.Driver";
        Class.forName(driver);

        // 관리자 Login
        String url = "jdbc:mysql://localhost:3306/shop";
        String id = "root";
        String pw = "mysql password ";

        // 연결
        Connection conn = DriverManager.getConnection(url, id, pw);

         // sql 구사
         // 전 페이지인 LOGIN.jsp input에 입력한 값들을 변수에 담는다
         String user_id= request.getParameter("input_id");
         String user_pw= request.getParameter("input_pw");
         String user_name = "?";
         String uid = "";

        Statement st = conn.createStatement();
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        String sql = "SELECT * FROM member WHERE userid='" + user_id + "' AND password='" + user_pw + "'";
        //st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);

        // isLogin 은 로그인 확인 유무를 위한 변수
        Boolean isLogin = false;
        while(rs.next()) {
            // rs.next가 true 라면 = 정보가 있다
            isLogin = true;
            user_name=rs.getString("username");
            uid=rs.getString("id");
        }

        // DB에 내가 적은 정보가 있다면
        if(isLogin) {
            // 지금 로그인할 id와 pw를 session에 저장하고
            session.setAttribute("id", user_id);
            session.setAttribute("pw", user_pw);
            session.setAttribute("name", user_name);
            session.setAttribute("uid", uid);
            // 첫 페이지로 돌려보낸다
            response.sendRedirect("main.jsp");
        } else {
            // DB에 내가적은 정보가 없다면 경고창을 띄워준다
            %> <script> alert("로그인 실패"); history.go(-1); </script> <%
        }


    } catch (Exception e) {
        out.println("DB 연동 실패");
        out.println(e.toString());
    }
    %>

</body>
</html>
