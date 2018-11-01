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
<title> Join </title>
</head>
<body>

    <h1> 회원가입 </h1>
    <form action="JOIN_CHECK.jsp" method="post" onsubmit="return input_check_func()">
    <table border="3" bgcolor ="skyblue">
        <tr>
            <th> id </th> <td bgcolor ="skyblue"> <input id="JOIN_id" name="JOIN_id"> </td>
        </tr>
        <tr>
            <th> pw </th> <td bgcolor ="skyblue"> <input id="JOIN_pw" name="JOIN_pw" type="password"> </td>
        </tr>
        <tr>
            <th> 이름 </th> <td bgcolor ="skyblue"> <input id="JOIN_name" name="JOIN_name"> </td>
        </tr>
        <tr>
            <th> 생년월일 </th> <td bgcolor ="skyblue"> <input id="JOIN_birth" name="JOIN_birth"> </td>
        </tr>
        <tr>
        <th> 이메일 </th> <td bgcolor ="skyblue"> <input id="JOIN_email" name="JOIN_email" type="email"> </td>
        </tr>
        <tr>
            <th> 우편번호 </th> <td bgcolor ="skyblue"> <input id="JOIN_zipcode" name="JOIN_zipcode"> </td>
        </tr>
        <tr>
            <th> 주소 </th> <td bgcolor ="skyblue"> <input id="JOIN_address1" name="JOIN_address1"> </td>
        </tr>
        <tr>
            <th> 상세주소 </th> <td bgcolor ="skyblue"> <input id="JOIN_address2" name="JOIN_address2"> </td>
        </tr>
        <tr>
            <th> 전화번호 </th> <td bgcolor ="skyblue"> <input id="JOIN_phone" name="JOIN_phone" type="tel"> </td>
        </tr>
        <tr>
            <th> 관심분야 </th> <td> <input id="JOIN_interest" name="JOIN_interest"> </td>
        </tr>
    </table>
    <button> 가입하기 </button> <input id="reset" name="reset" type="reset" value="초기화">
    </form>

    <script>
    // input_check_func는 회원가입에 필요한 3가지 문항을 전부다 채워 넣었는지 check 해준다
    // 이는 form onsubmit에 의해 발동되며 return 값이 false 일 경우 페이지의 데이터가 action= 좌표로 넘어가지 않게된다
    function input_check_func() {
        var id = document.getElementById('JOIN_id').value;
        var pw = document.getElementById('JOIN_pw').value;
        var birth = document.getElementById('JOIN_birth').value;
        var email = document.getElementById('JOIN_email').value;
        var zipcode = document.getElementById('JOIN_zipcode').value;
        var address1 = document.getElementById('JOIN_address1').value;
        var address2 = document.getElementById('JOIN_address2').value;
        var phone = document.getElementById('JOIN_phone').value;
        var interest = document.getElementById('JOIN_interest').value;

        if(id == null || pw == null || birth == null || email == null || zipcode == null || address1 == null || address2 == null || phone == null || interest == null ||
         id == ""   || pw == ""  || birth == "" || email == "" || zipcode == "" || address1 == "" || address2 == "" || phone == "" || interest == "" ||  ) {
            alert("빠짐없이 채워주십시오.");
            return false;
        } else {
            // 모든조건이 충족되면 true를 반환한다 이는 현재 페이지의 정보를 action= 좌표로 넘긴다는것을 의미
            return true;
        }
    }
    </script>

</body>
</html>
