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
<title> 상품 수정 </title>
</head>
<body>

    <h1> 상품 수정 </h1>

    <%

    try {
    String pro_name="";
        String pro_price="";
        String pro_company="";
        String pro_status="";
        String pro_content="";
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
         String num = request.getParameter("num");

        Statement st = conn.createStatement();
        // 내가 입려한 id와 pw 값이 DB안에 있는지 확인한다
        String sql = "SELECT * FROM products WHERE num='" + num + "'";
        //st.executeUpdate(sql);
        ResultSet rs = st.executeQuery(sql);

        // isLogin 은 로그인 확인 유무를 위한 변수
        while(rs.next()) {
            pro_name=rs.getString("name");
            pro_price=rs.getString("price");
            pro_company=rs.getString("company");
            pro_status=rs.getString("status");
            pro_content=rs.getString("content");
        }%>
        <form action="edit_products_complete.jsp" method="post" enctype="multipart/form-data" onsubmit="return input_check_func()">
    <table border="1">
        <tr>
            <th> 상품명 </th> <td> <input id="pro_num" name="pro_num" value="<% out.print(num);%>" type="hidden"> <input id="pro_name" name="pro_name" value="<% out.print(pro_name);%>"> </td>
        </tr>
        <tr>
            <th> 가격 </th> <td> <input id="pro_price" name="pro_price" value="<%out.print(pro_price);%>"> </td>
        </tr>
        <tr>
            <th> 제조사 </th> <td> <input id="pro_company" name="pro_company" value="<%out.print(pro_company);%>"> </td>
        </tr>
        <tr>
            <th> 이미지파일 </th> <td> <input id="pro_file" name="pro_file" type="file"> </td>
        </tr>
        <tr>
            <th> 판매상태 </th> <td> <select id="pro_status" name="pro_status">
                <option value="판매중">판매중</option>
                <option value="품절">품절</option>
                <option value="판매중지">판매중지</option>
            </select>
            </td>
        </tr>
        <tr>
            <th>  상품설명 </th> <td> <textarea id="pro_content" name="pro_content" type="textbox" rows="10" cols="60"><%out.print(pro_content);%></textarea> </td>
    </table>
    <button> 수정완료 </button> <input id="reset" name="reset" type="reset" value="초기화">
    </form>

    <script>
    // input_check_func는 회원가입에 필요한 3가지 문항을 전부다 채워 넣었는지 check 해준다
    // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
    function input_check_func() {
        var name = document.getElementById('pro_name').value;
        var price = document.getElementById('pro_price').value;
        var status = document.getElementById('pro_status').value;
        var content = document.getElementById('pro_content').value;

        if(name == null || price == null || status == null || content == null || name == ""   || price == ""  || status == "" || content == ""  ) {
            alert("빠짐없이 채워주십시오.");
            return false;
        } else {
            // 모든조건이 충족되면 true를 반환한다 이는 현재 페이지의 정보를 action= 좌표로 넘긴다는것을 의미
            return true;
        }
    }
    </script>
        <%
    } catch (Exception e) {
        out.println("DB 연동 실패");
        out.println(e.toString());
    }
    %>




</body>
</html>
