<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    

    #enroll-form table {margin:auto;}
    #enroll-form input {margin:5px;}
    
     @font-face {
            font-family: 'SEBANG_Gothic_Bold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        
       table input {
		    background-color: rgb(241, 241, 241);
		    border-radius: 5px; 
		    border : none;
		    width : 300px;
		    height :45px;
		}
		
		button[type="submit"],
		button[type="reset"] 
		{
		    background-color: rgb(255, 219, 41);
		    border :none; 
		   	width : 300px;
		    height :45px;
		    border-radius: 5px;
			margin-left: -70px;
		}
	
</style>
<head>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	
	<div align="center" style="margin-top:30px">
    <div style="display: flex; align-items: center; justify-content: center;">
        <h2 style="font-size: 48px; font-weight: bold; color: rgb(241, 205, 27); font-family: SEBANG_Gothic_Bold; display: inline;">꿀.zip&nbsp</h2>
        
	    </div>
	</div>
	<div class="outer">
        <br>
        <h2 align="center" style = "font-size:24px; margin-left:-280px">JOIN</h2>

        <form id="enroll-form" action="<%= request.getContextPath() %>/enrollForm.me" method="post">
        <!-- menubar.jsp 를 위에서 include 했기 때문에 contextPath 변수를 가져다 쓸 수 있다. -->

            <!-- 아이디, 비밀번호, 이름, 전화번호, 이메일, 주소, 취미 -->
            <table id = "join" style ="align :center;">
                <!-- (tr>td*3)*8 -->
                <tr><i class="bi bi-person-fill"></i>
                    <td><input type="text" id="enrollId" name="memberId" maxlength="12" required placeholder="아이디"></td>
                    <td><button type="button" onclick="idCheck();" style = "height:45px; 
                    border:none; background-color:rgb(255, 219, 41); border-radius: 5px;"><b>중복확인</b></button></td>
                </tr>
                <tr>
                    <td><input type="password" name="memberPwd" id="password1" maxlength="15" required placeholder="비밀번호"></td>
                    <td></td>
                </tr>
                <tr>
                    <td><input type="password" maxlength="15" id="password2" required placeholder="비밀번호 확인"></td> <!-- 단순 비교 확인 용도라 key 값을 부여 안해도 됨 -->
                    <td></td>
                </tr>
                <tr>
                    <td><input type="text" name="memberName" maxlength="6" required placeholder=이름></td>
                    <td></td>
                </tr>
				<tr>
                    <td><input type="text" maxlength="15" name="nickname" required placeholder="닉네임"></td> <!-- 단순 비교 확인 용도라 key 값을 부여 안해도 됨 -->
                    <td></td>
                </tr>
                <tr>
                    <td><input type="email" name="email" placeholder="이메일"></td>
                    <td></td>
                </tr>
            </table>
            
            <br><br>

            <div align="center" style = "margin-left : -50x; margin-top:-20px">
                <button type="submit" style ="margin-top : -40px" onclick="checkPw();" disabled ><b>회원가입</b></button><br>
                <button type="reset" style = "margin-top : 20px"><b>초기화</b></button>
            </div>

            <br><br>

        </form>
        <script>
        function idCheck() {
            var userId = $("#enrollId").val();

            $.ajax({
                url: "${pageContext.request.contextPath}/idCheck.me",
                data: { checkId: userId },
                success: function(result) {
                    if (result === 'NNNNN') {
                        alert('해당 아이디는 이미 존재하거나 탈퇴한 회원의 아이디입니다.');
                        $("#enrollId").select();
                    } else {
                        if (confirm('사용가능한 아이디입니다. 사용하시겠습니까?')) {
                            $("button[type=submit]").removeAttr("disabled");
                            $("#enrollId").prop("readonly", true);
                        } else {
                            $("#enrollId").focus();
                        }
                    }
                },
                error: function() {
                    console.log("통신실패");
                }
            });
        }
        
        function checkPw() {
			var p1 = document.getElementById('password1').value;
			var p2 = document.getElementById('password2').value;
			if (p1.length < 3) {
				alert("비밀번호는 4자리 이상이어야 합니다");
				return false;
			}
			
			if (p1 != p2) {
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
				return false;
			} else {
				return true;
			}
		}
        </script>
    </div>
</body>
</html>