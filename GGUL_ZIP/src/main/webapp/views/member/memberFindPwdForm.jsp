<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer {
        background:skyblue;
        color:white;
        width:1000px;
        margin:auto; /* 가운데 자동 정렬 */
        margin-top:50px; /* 위로부터 50px 아래로 여백 만들기 */
    }

    #findId-form table {margin:auto;}
    #findId-form input {margin:5px;}
</style>
<body>

	<%@ include file="../common/menubar.jsp" %> 
	<!-- ../ : 현재 폴더로부터 한번 빠져나감 (즉, 현재 폴더로부터 한단계 상위폴더로 이동)  -->
	
	<div class="outer">

        <br>
        <h2 align="center">비밀번호 찾기</h2>

        <form id="findId-form" action="<%=contextPath %>/findPwd.me" method="post"> 
        <!-- menubar.jsp 를 위에서 include 했기 때문에 contextPath 변수를 가져다 쓸 수 있다. -->

            <!-- 아이디, 비밀번호, 이름, 전화번호, 이메일, 주소, 취미 -->
            <table>
                <!-- (tr>td*3)*8 -->
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" id="memberName" name="memberName" maxlength="12" placeholder="이름을 입력하세요" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" id="memberId" name="memberId" maxlength="12" placeholder="아이디를 입력하세요" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 이메일</td>
                    <td><input type="email" id="email" name="email" maxlength="15" placeholder="이메일을 입력하세요" required></td>
                    <td></td>
                </tr>
            </table>
            
            <br><br>

            <div align="center">
                <button type="submit" onclick="findPwd();">비밀번호 찾기</button>
                <button type="reset">초기화</button>
            </div>

            <br><br>

        </form>
        <script>
        	location.href="<%=contextPath%>/findPwd.me";
        </script>

   

    </div>
    
	
</body>
</html>