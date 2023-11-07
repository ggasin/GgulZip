<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.gz.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
//ContextRoot(ContextPath)를 꺼내놓기 (메소드를 이용하여)
String contextPath = request.getContextPath();
//로그인 정보 꺼내놓기 
//session객체에 loginUser 객체와 alertMsg 메세지를 담아놓음 
Member loginMember = (Member) session.getAttribute("loginMember");
String alertMsg = (String) session.getAttribute("alertMsg");
//로그인 전 menubar.jsp 로딩되면 loginUser == null
//로그인 후 menubar.jsp 로딩되면 로그인한 회원정보담긴 Member객체
//로그인 전 menubar.jsp 로딩되면 alertMsg == null
//로그인 후 menubar.jsp 로딩되면 alertMsg == 성공메세지 

//쿠키정보(쿠키 배열)
Cookie[] cookies = request.getCookies();

//쿠키배열에서 필요한 쿠키정보를 추출하기 
//반복으로 돌려서 해당 쿠키의 이름을 찾고 그 쿠키의 값을 담아두기 
String saveId = "";
if (cookies != null) {
	for (Cookie c : cookies) {

		if ((c.getName()).equals("memberId")) {
	saveId = c.getValue();
		}
	}
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<!-- Vendor CSS Files -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<!-- Vendor JS Files -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.outer {
	background-color: rgb(255, 225, 77);
	color: white;
	width: 1000px;
	margin: auto;
	margin-top: 50px;
}

.nav-area {
	background-color: rgb(255, 225, 77);
}

.menu {
	display: inline-block;
	height: 50px;
	width: 150px;
}

.menu a {
	text-decoration: none;
	color: black;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 100%;
	height: 100%;
	line-height: 50px;
}

.menu a:hover {
	background-color: rgb(204, 176, 32);;
}
</style>

</head>
<body>
	
	<!--jstl 방식으로 contextPath를 다시 선언해주어야 jstl방식으로 contextPath를 이용해야한다. -->
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<script>
		// script 내부에도 스크립틀릿과 같은 jsp요소를 쓸 수 있다.
		// 주의사항 : jsp가 먼저 읽히기 때문에 javascript 값을 java에 담을 수는 없다 (반대는 가능)
			
		var msg = '<%=alertMsg%>'; //이건 가능 (문자열 처리해주기[값자체로 나옴])
		
		//안되는것 : 자바스크립트에서 작성한것을 jsp(java)로 넘기기 
		/*
		var a = 10;
		
		<%//int ab = a;%>
		*/
		if(msg != 'null'){ //alertMsg가 null인경우 자바스크립트에 담길때 문자열이 되기때문에
						   //비교도 문자열로 비교해야함.
			alert(msg);
			//alertMsg를 session에서 지워주지않으면 계속 메세지가 나오기때문에 한번 띄우고 지우기 
			<%session.removeAttribute("alertMsg");%>
			
		}
		
		$(function(){
			
			//쿠키 아이디값 가져오기
			
			var saveId = "<%=saveId%>";
			
			if(saveId!=""){
				$("input[name=memberId]").val(saveId);
				$("input[name=saveId]").attr("checked",true);
			}
			
		});
		
		
	</script>


	<h1 align="center">Welcome Web Project</h1>

	<!--로그인 영역-->
	<div class="login-area">
		<!--로그인 전 후 화면 나누기 -->
		<!--로그인 전 -->
		<%
		if (loginMember == null) {
		%>
		<form action="<%=contextPath%>/login.me" id="login-form" method="post">
			<table>
				<tr>
					<th>아이디 :</th>
					<td><input type="text" name="memberId" required></td>
				</tr>
				<tr>
					<th>비밀번호 :</th>
					<td><input type="password" name="memberPwd" required></td>
				</tr>
				<tr>
					<td colspan="2">아이디저장 : <input type="checkbox" name="saveId">
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<button type="submit">로그인</button>
						<button type="button" onclick="enrollPage();">회원가입</button>
						<button type="button" onclick="findidPage();">아이디찾기</button>
						<button type="button" onclick="findpwPage();">비밀번호찾기</button>
					</th>
				</tr>

			</table>
		</form>
		<script>
        	function enrollPage(){
        		//아래와 같이 작성하면 디렉토리 구조가 노출이 되니 보안에 취약할 수 있다. 
        		//location.href="/jsp/views/member/memberEnrollForm.jsp";
        		//때문에 간단한 페이지 이동요청도 servlet을 거쳐서 요청에대한 응답페이지를 돌려받자.
        		console.log("회원가입 클릭");
        		location.href="<%=contextPath%>/enrollForm.me";
        		
        	}
        	
        	function findidPage() {
        		location.href="<%=contextPath%>/findId.me";
        	}
        
        	function findpwPage() {
        		location.href="<%=contextPath%>/findPwd.me";
			}
		</script>

		<%
		} else {
		%>
		<!--로그인 후 화면-->
		<div id="user-info">
			<b><%=loginMember.getNickname()%>님 환영합니다.</b>
			<div align="center">
				<a href="<%=contextPath%>/myPage.me">마이페이지</a> <a
					href="<%=contextPath%>/logout.me">로그아웃</a>
			</div>
		</div>
		<%
		}
		%>
	</div>
	<br clear="both">
	<!--float 해제 -->

	<br>

	<div class="nav-area" align="center">
		<div class="menu" id="boardMenu">
			<a href="#">게시판</a>
			<div class="submenu">
				<a href="${pageContext.request.contextPath}/list.bo?currentPage=1">일반게시판</a>
				<a href="${pageContext.request.contextPath}/RecommList.bo">추천
					게시판</a> <a href="${pageContext.request.contextPath}/FreeList.bo">자유
					게시판</a>
			</div>
		</div>
		<div class="menu">
			<a href="${pageContext.request.contextPath}/list.no">공지사항</a>
		</div>
		<div class="menu">
				<a href="${pageContext.request.contextPath}/list.ph">사진게시판</a>
			</div>
		<div class="menu">
			<a href="${contextPath}/category.ad">카테고리수정</a>
			<a href="${contextPath}/selectUser.ad?currentPage=1">관리자페이지</a>
		</div>
	</div>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const boardMenu = document.getElementById('boardMenu');

			boardMenu.addEventListener('click', function() {
				boardMenu.classList.toggle('active');
			});

			window.addEventListener('click', function(event) {
				if (!event.target.matches('#boardMenu')) {
					boardMenu.classList.remove('active');
				}
			});
		});
	</script>

</body>
</html>