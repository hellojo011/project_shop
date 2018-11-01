<%@ page language="java"
    contentType="text/html; charset=utf8"
    pageEncoding="utf8"
    import="java.sql.*"%>
    <%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%@ page import="java.util.*" %>

<%@ page import="java.io.*" %>
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

        String savePath=application.getRealPath("upload");;   // 저장할 디렉토리 (절대경로)
        String fileName="";
        String originFileName="";
        int sizeLimit = 5 * 1024 * 1024 ;      // 파일업로드 용량 제한.. 10Mb
        String new_name="";
        String new_price     ="";
        String new_company ="";
        String new_status ="";
        String new_content ="";
             try{

                           MultipartRequest multi = new MultipartRequest(request, savePath,sizeLimit,"utf8",new DefaultFileRenamePolicy());

                           fileName= multi.getFilesystemName("pro_file");


                           originFileName = multi.getOriginalFileName("pro_file");
                           if(fileName != null) {

                                        fileName=new String(fileName.getBytes("ISO-8859-1"),"utf8");

                           } // end if
                            new_name = multi.getParameter("pro_name");
                            new_price = multi.getParameter("pro_price");
                            new_company = multi.getParameter("pro_company");
                            new_status = multi.getParameter("pro_status");
                            new_content=multi.getParameter("pro_content");

             } catch(Exception e) {

                           out.print(e.getMessage());

             }
        // JOIN.jsp input 에서 입력한 회원가입에 필요한 값들을 변수에 담아준다


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
            String sql = "INSERT INTO products(name, price, company, p_image, buy_num, status, content, created) VALUES ('" + new_name +
                    "'," + new_price +
                    ",'" + new_company +
                    "','" + fileName +
                    "',0,'" + new_status +
                    "','" + new_content +
                    "', curdate())";
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
