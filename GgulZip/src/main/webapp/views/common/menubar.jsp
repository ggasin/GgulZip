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

	@font-face {
		    font-family: 'SEBANG_Gothic_Bold';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
	#login-form button {
		border-radius: 5px;
	    background-color:rgb(255, 219, 41);
		border : none;
 	}
 	
 	  .rectangle {
	            width:100%;
	            height: 0.5px;
	           	background-color : black;
	        }
		      
 	
 	/* 드롭다운 스타일*/
	 .nav_main {
	    font-weight: 900;
	    font-size: 1.1rem;
	    display: flex;
	    flex-direction: row;
	    justify-content: flex-start;
	    position: absolute;
	    top: 0;
	    left: 0;
	    right: 0;
	    z-index: 1;
	}
	
	.nav_item {
	    position: relative;
	    flex: 0 0 auto;
	    margin-left: 5rem;
	    padding-top: 2rem;
	    padding-bottom: 1rem;
	}
	
	.nav_item > a {
	  color: #000000;
	  text-decoration: none;
	  position: relative;
	  display: inline-block;
	}
	
	.nav_item > a:after {
	  content: '';
	  position: absolute;
	  left: 50%;
	  top: -2px;
	  width: 0;
	  height: 2px;
	  background-color: #000000;
	  transition: width 0.2s ease-in-out;
	  transform: translateX(-50%);
	}
	
	.nav_item:hover > a:after {
	  width: 100%;
	}
	
	.dropdown_main {
	    margin: 0;
	    display: block;
	    position: absolute;
	    z-index: 1;
	    background-color: #fffafa;
	    justify-content: center;
	    align-items: center;
	    border-radius: 3px;
	    top: 3.9rem;
	    right: 0rem;
	    width: 11rem;
	    border: 1px solid rgb(99, 96, 96);
	    box-shadow: 0 40px 40px rgb(0 0 0 /6%);
	    opacity: 0;
	    visibility: hidden;
	    transform: translateY(-10px);
	    transition: transform 0.3s;
	}
	
	.dropdown_main a {
	  display: block;
	  color: #000000;
	  font-weight: 400;
	  font-size: 1rem;
	  text-align: left;
	  text-decoration: none;
	}
	
	.dropdown_main a div{
	  padding: 0.5rem 0rem 0.5rem 0.5rem;
	}
	
	.dropdown_king:hover .dropdown_main {
	  opacity: 1;
	  visibility: visible;
	  transform: translateY(0);
	}
	
	.dropdown_main a:hover {
	  background-color: #c9cac9;
	}
	

</style>

</head>
<body>
	<!--jstl 방식으로 contextPath를 다시 선언해주어야 jstl방식으로 contextPath를 이용해야한다. -->
	<c:set var="contextPath" value="${pageContext.request.contextPath }" />
	<!-- 회원 탈퇴시 받을 메시지 확인 -->
	<c:if test="${not empty sessionScope.deleteMemAlert}">
    	<script>
    		alert("${sessionScope.deleteMemAlert}");
    		<c:remove var="deleteMemAlert" scope="session" />
    	</script>
    </c:if>
	
	<script>

		var msg = '<%=alertMsg%>'; //이건 가능 (문자열 처리해주기[값자체로 나옴])
		

		if(msg != 'null'){ 
			alert(msg);
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

	<div align = "center">
		<br>
		<h2 id="home" style="font-size: 48px; font-weight: bold; color: rgb(241, 205, 27); font-family: SEBANG_Gothic_Bold; display: inline;">
		    꿀.zip
		</h2>
		<img src="views/img/bee.png" alt="Bee Image" width="50" height="50" style="display: inline; margin-top :-15px">
	</div>
	<div class="login-button" style="text-align: right;">	
        <c:choose>
            <c:when test="${empty loginMember}">
                <button onclick='window.location.href = "<%=request.getContextPath()%>/views/member/Login.jsp";' 
                    style="border: none; background: none; margin-right: 10px;">로그인</button>
                <button onclick='window.location.href = "<%=request.getContextPath()%>/views/member/memberEnrollForm.jsp";' 
                    style="border: none; background: none; margin-right: 20px;">회원가입</button>
            </c:when>
            <c:otherwise>
                <!-- 로그인된 경우에 대한 내용을 여기에 추가하세요 (예: 로그아웃 버튼 또는 사용자 정보) -->
            </c:otherwise>
        </c:choose>
    </div>
	
		<!--로그인 전 후 화면 나누기 -->
		<!--로그인 전 -->
		<%
		if (loginMember == null) {
		%>
	

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
				<div style="text-align: right; font-size : 18px">
				    <b><%=loginMember.getNickname()%>님 환영합니다. &nbsp</b>
				</div>			
				<div align="right">
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


	<div class="rectangle" style = "margin-top : 20px"></div>
	</div>

	<div class="container nav_main text-center" style="padding-top: 10px;">
	  <!-- 1번 메뉴 링크 -->
	  <div class="nav_item">
	    <a href="#">공지사항</a>
	  </div>
	
	  <div class="dropdown_king nav_item">
	    <a href="#">게시판</a>
	    <div class="dropdown_main">
	      <a href="${pageContext.request.contextPath}/list.bo?currentPage=1">
	        <div>
	        	추천게시판
	        </div>
	      </a>
	      <a href="#">
	        <div>
	        	자유게시판
	        </div>
	      </a>
	      <a href="#">
	        <div>
	        	꿀팁게시판
	        </div>
	      </a>
	    </div>
	  </div>

	  <div class="nav_item">
	    <a href="#">신고/건의</a>
	  </div>
	  <div class="nav_item">
			<a href="${contextPath}/disable.ad">정지회원</a>
		</div>
		 <div class="nav_item">
			<a href="${contextPath}/category.ad">카테고리수정</a>
		</div>
		 <div class="nav_item">
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

	<script>
    document.getElementById("home").addEventListener("click", function() {
        // 클릭 이벤트 처리
        window.location.href = "<%=contextPath%>/index.jsp"; // 원하는 페이지로 이동
    });
	</script>
</body>
</html>