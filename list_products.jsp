<%@ page contentType="text/html;charset=utf8" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sql:query var="rs" dataSource="jdbc/mydb">
select * from products;
</sql:query>

<html>
<head><title>상품 목록</title></head>
<body>
<h2>상품 목록</h3>
<table border=1>
<tr>
<th>상품번호</th><th>이미지 및 상품명</th><th>가격</th><th>제조사</th><th>판매량</th><th>판매상태</th><th>등록일자</th>
<%
if(session.getAttribute("uid") != null) {

String uid = (String)session.getAttribute("uid");

if(uid.equals("1")) {
            %>
            <th>관리자 도구 / <a href='./new_product.html'>상품추가</a></th>
            <%
        } else { %> 주문 <%}
        } else { %> 주문 <%}
            %>
</tr>

<c:forEach var="row" items="${rs.rows}">
<tr>
<td>${row.num}</td>
<td><img src="./upload/${row.p_image}" width="50px">${row.name}<br>${row.content}</td>
<td>${row.price}</td>
<td>${row.company}</td>
<td>${row.buy_num}</td>
<td>${row.status}</td>
<td>${row.created}</td>

<%
if(session.getAttribute("uid") != null) {
  String uid = (String)session.getAttribute("uid");
if(uid.equals("1")) {
            %>
            <td><a href="./edit_products.jsp?num=${row.num}">수정</a> <a href="./delete_products.jsp?num=${row.num}">삭제</a></td> <!--http://all-record.tistory.com/100-->
            <%
        } else { %>
        <td><a href="./order_products.jsp?num=${row.num}">주문</a> <a href="./cart_products.jsp?num=${row.num}">장바구니</a></td><%
        }
        }else { %>
        <td><a href="./order_products.jsp?num=${row.num}">주문</a> <a href="./cart_products.jsp?num=${row.num}">장바구니</a></td><%
        }
            %>
</tr>
</c:forEach>
</table>
<a href="./main.jsp">메인 화면으로</a>
</body>
</html>
