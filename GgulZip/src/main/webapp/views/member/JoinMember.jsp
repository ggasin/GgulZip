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

    #enroll-form table {margin:auto;}
    #enroll-form input {margin:5px;}
</style>
<body>

	<%@ include file="../common/menubar.jsp" %> 
	<!-- ../ : 현재 폴더로부터 한번 빠져나감 (즉, 현재 폴더로부터 한단계 상위폴더로 이동)  -->
	
	<div class="outer">

        <br>
        <h2 align="center">회원가입</h2>

        <form id="enroll-form" action="<%=contextPath%>/enrollForm.me" method="post"> 
        <!-- menubar.jsp 를 위에서 include 했기 때문에 contextPath 변수를 가져다 쓸 수 있다. -->

            <!-- 아이디, 비밀번호, 이름, 전화번호, 이메일, 주소, 취미 -->
            <table>
                <!-- (tr>td*3)*8 -->
                <tr>
                    <td>* 아이디</td>
                    <td><input type="text" id="enrollId" name="memberId" maxlength="12" required></td>
                    <td><button type="button" onclick="idCheck();">중복확인</button></td>
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="memberPwd" maxlength="15" required></td>
                    <td></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" maxlength="15" required></td> <!-- 단순 비교 확인 용도라 key 값을 부여 안해도 됨 -->
                    <td></td>
                </tr>
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="memberName" maxlength="6" required></td>
                    <td></td>
                </tr>
				<tr>
                    <td>* 닉네임</td>
                    <td><input type="text" maxlength="15" name="nickname" required></td> <!-- 단순 비교 확인 용도라 key 값을 부여 안해도 됨 -->
                    <td></td>
                </tr>
                <tr>
                    <td>&nbsp;&nbsp;이메일</td>
                    <td><input type="email" name="email"></td>
                    <td></td>
                </tr>
            </table>
            
            <br><br>

            <div align="center">
                <button type="submit" disabled>회원가입</button>
                <button type="reset">초기화</button>
            </div>

            <br><br>

        </form>
        
        
        
        <script>
			function idCheck(){
				//사용자가 입력한 아이디값을 추출하여 데이터베이스에서 해당 아이디가 존재하는지 
				//조회후 존재한다면 다시 입력할 수 있도록 
				//존재하지 않는다면 사용 가능하도록 처리하기 
				
				var userId = $("#enrollId").val();
				
				
				$.ajax({
					
					url : "idCheck.me",
					data : {checkId : userId},
					success : function(result){
						
						if(result =='NNNNN'){
							alert('해당 아이디는 이미 존재하거나 탈퇴한 회원의 아이디입니다.');
							$("#enrollId").select();
						}else{//사용가능 
							//기존에 disabled되어있던 회원가입 버튼을 사용가능하게 바꾸고 
							//id값을 변경할수없도록 readonly처리를 해주기 
							if(confirm('사용가능한 아이디입니다. 사용하시겠습니까?')){
								$("button[type=submit]").removeAttr("disabled");//버튼 비활성화 제거하기 
								$("#enrollId").attr("readonly",true);//아이디 입력란 읽기전용으로 변경
							}else{
								$("#enrollId").focus();
							}
						}
						
					},
					error : function(){
						console.log("통신실패");
					}
					
				});
					
				
			}        
        
        </script>
        

    </div>
    
	
</body>
</html>