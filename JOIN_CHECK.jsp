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
<title> JoinCheck </title>
</head>
<body>

    <%
        // JOIN.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다
        String his_id     = request.getParameter("JOIN_id");
        String his_pw     = request.getParameter("JOIN_pw");
        String his_name= request.getParameter("JOIN_name");
        String his_birth = request.getParameter("JOIN_birth");
        String his_email = request.getParameter("JOIN_email");
        String his_zipcode = request.getParameter("JOIN_zipcode");
        String his_address1 = request.getParameter("JOIN_address1");
        String his_address2 = request.getParameter("JOIN_address2");
        String his_phone = request.getParameter("JOIN_phone");
        String his_interest = request.getParameter("JOIN_interest");

//birth email zipcode address1/2 phone interest
        try {
            // 드라이버 로딩
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver);

            // 관리자 Login
            String url = "jdbc:mysql://localhost:3306/shop";
            String id = "root";
            String pw = "mysql password ";

            // 연결
            // INSERT 해달라 USERTABLE에
            // id, pw, name 라는 필드를 가진
            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
            String sql = "INSERT INTO member(userid, username, password, birthday, email, zipcode, address1, address2, mobilephone, interest, regedate) VALUES ('" + his_id +
                    "','" + his_name +
                    "','" + his_pw +
                    "','" + his_birth +
                    "','" + his_email +
                    "','" + his_zipcode +
                    "','" + his_address1 +
                    "','" + his_address2 +
                    "','" + his_phone +
                    "','" + his_interest +
                    "', curdate())";
            st.executeUpdate(sql);

            // 회원가입에 성공하였으면 첫 페이지로 보낸다
            response.sendRedirect("main.jsp");

        } catch (Exception e) {
            out.println("DB 연동 실패");
            out.println(e.toString());
        }
    %>

</body>
</html>
