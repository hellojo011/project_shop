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
        String pro_num     = request.getParameter("num");

//birth email zipcode address1/2 phone interest
        try {
            // 드라이버 로딩
            String driver = "com.mysql.jdbc.Driver";
            Class.forName(driver);

            // 관리자 Login
            String url = "jdbc:mysql://localhost:3306/shop";
            String id = "root";
            String pw = "mysql password";

            Connection conn = DriverManager.getConnection(url, id, pw);
            Statement st = conn.createStatement();
            String sql = "update products set buy_num = buy_num+1 WHERE num=" + pro_num;
            st.executeUpdate(sql);

            // 회원가입에 성공하였으면 첫 페이지로 보낸다
            response.sendRedirect("list_products.jsp");

        } catch (Exception e) {
            out.println("DB 연동 실패");
            out.println(e.toString());
        }
    %>
</body>
</html>
