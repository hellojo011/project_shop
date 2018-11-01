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
<title> M_Market </title>
</head>
  <body>
    <table style="width : 90%">
      <tr>
        <td style="font-size : 24px">M_Market</td>
      </tr>
    </table>
    <%
      String log="";
      if(session.getAttribute("id") == null)
      {
            log = "<a href = 'login.jsp'>로그인</a>";
      }else{
            log = "<a href = 'LOGOUT.jsp'>로그아웃</a>";
      }

      String mem ="";
      String root =(String)session.getAttribute("id");
      String test = null;

      if(("1234".equals(root)))
      {
        mem = "<a href ='new_product.html'>상품 정보</a>";
      }else if(root == null)
      {
        mem = "<a href ='JOIN.jsp'>회원가입</a>";
      }else
      {
        mem = "<a href ='edit.jsp'>정보 수정</a>";
      }

      if(session.getAttribute("id") != null)
        out.print(session.getAttribute("name") + " 님 환영합니다");

    %>
    <table style="width : 90%">
      <tr style="background-color :#F7BE01; text-align:content;">
        <td><%=log%></td>
        <td><%=mem%></td>
        <td><a href="list_products.jsp">상품 목록</td>
        <td>장바구니</td>
      </tr>
    </table>
    <img src="show.jpg" width="90%">
  </body>

</html>
