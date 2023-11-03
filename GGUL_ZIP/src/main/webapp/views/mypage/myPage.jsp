<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>
<%

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../common/menubar.jsp" %>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Users / Profile - NiceAdmin Bootstrap Template</title>
<meta content="" name="description">
<meta content="" name="keywords">
	<!-- Favicons -->
	<link href="resources/assets/img/favicon.png" rel="icon">
	<link href="resources/assets/img/apple-touch-icon.png"
		rel="apple-touch-icon">
	
	<!-- Google Fonts -->
	<link href="https://fonts.gstatic.com" rel="preconnect">
	<link
		href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
		rel="stylesheet">

<!-- Template Main CSS File -->
<!-- <link href="../../resources/assets/css/style.css" rel="stylesheet"> -->



<style>
    :root {
  scroll-behavior: smooth;
}

body {
  font-family: "Open Sans", sans-serif;
  background: #f6f9ff;
  color: #444444;
}

a {
  color: #4154f1;
  text-decoration: none;
}

a:hover {
  color: #717ff5;
  text-decoration: none;
}

h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: "Nunito", sans-serif;
}

table>tbody tr:hover{
	cursor: pointer;
}

/*--------------------------------------------------------------
# Main
--------------------------------------------------------------*/
#main {
  margin-top: 60px; 
  padding: 60px;
  transition: all 0.3s;
}

@media (max-width: 1200px) {
  #main {
    padding: 20px;
  }
}

/*--------------------------------------------------------------
# Page Title
--------------------------------------------------------------*/
.pagetitle {
  margin-bottom: 10px;
}

.pagetitle h1 {
  font-size: 24px;
  margin-bottom: 0;
  font-weight: 600;
  color: #012970;
}



/* Card */
.card {
  margin-bottom: 30px;
  border: none;
  border-radius: 5px;
  box-shadow: 0px 0 30px rgba(1, 41, 112, 0.1);
}

.card-header,
.card-footer {
  border-color: #ebeef4;
  background-color: #fff;
  color: #798eb3;
  padding: 15px;
}

.card-title {
  padding: 20px 0 15px 0;
  font-size: 18px;
  font-weight: 900;
  color: #012970;
  font-family: "Poppins", sans-serif;
}

.card-title span {
  color: #899bbd;
  font-size: 14px;
  font-weight: 400;
}

.card-body {
  padding: 0 20px 20px 20px;
}

.card-img-overlay {
  background-color: rgba(255, 255, 255, 0.6);
}

/* Bordered Tabs */
.nav-tabs-bordered {
  border-bottom: 2px solid #ebeef4;
}

.nav-tabs-bordered .nav-link {
  margin-bottom: -2px;
  border: none;
  color: #2c384e;
}

.nav-tabs-bordered .nav-link:hover,
.nav-tabs-bordered .nav-link:focus {
  color: #FDD946;
}

.nav-tabs-bordered .nav-link.active {
  background-color: #fff;
  color: black;
  border-bottom: 2px solid #FDD946;
}


/*--------------------------------------------------------------
# Profie Page
--------------------------------------------------------------*/
.profile .profile-card img {
  max-width: 120px;
}

.profile .profile-card h2 {
  font-size: 24px;
  font-weight: 700;
  color: #2c384e;
  margin: 10px 0 0 0;
}

.profile .profile-card h3 {
  font-size: 18px;
}

.profile .profile-card .social-links a {
  font-size: 20px;
  display: inline-block;
  color: rgba(1, 41, 112, 0.5);
  line-height: 0;
  margin-right: 10px;
  transition: 0.3s;
}

.profile .profile-card .social-links a:hover {
  color: #012970;
}

.profile .profile-overview .row {
  margin-bottom: 20px;
  font-size: 15px;
}

.profile .profile-overview .card-title {
  color: #012970;
}

.profile .profile-overview .label {
  font-weight: 600;
  color: rgba(1, 41, 112, 0.6);
}

.profile .profile-edit label {
  font-weight: 600;
  color: rgba(1, 41, 112, 0.6);
}

.profile .profile-edit img {
  max-width: 120px;
}
/*--------------------------------------------------------------
# 테이블 뒤로가기 버튼
--------------------------------------------------------------*/
.back-btn{
	margin:20px;
}
#tableBackBtn{
	display:none;
}
/*--------------------------------------------------------------
# 테이블 스타일
--------------------------------------------------------------*/
.table-container {
            max-height: 600px;
            overflow-y: auto;
}
.myTable {
    border-collapse: collapse;
    width: 100%;
}
.myTable th, .myTable td{
    border: 1px solid black;
    padding: 8px;
    text-align: center;
}
.myTable>thead {
    position: sticky;
    top: 0;
    background-color: #f8f8f8;
}


</style>

</head>

<body>
	
	<!-- ======= Header ======= -->
	
	<main id="main" class="main">

		<div class="pagetitle">
			<h1>마이페이지</h1>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">
				<!--좌측 프로필,이름,이메일 보이는 구역-->
				<div class="col-xl-4">
					<div class="card">
						<div
							class="card-body profile-card pt-4 d-flex flex-column align-items-center">
							<img src="resources/assets/img/profile-img.jpg" alt="Profile"
								class="rounded-circle">
							<h2>이름 or 별명</h2>
							<br>
							<h3>이메일</h3>
							<div class="social-links mt-2">
								<a href="#" class="twitter"><i class="bi bi-twitter"></i></a> <a
									href="#" class="facebook"><i class="bi bi-facebook"></i></a> <a
									href="#" class="instagram"><i class="bi bi-instagram"></i></a>
								<a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
							</div>
						</div>
					</div>
				</div>
			
				
				<!--좌측 프로필,이름,이메일 보이는 구역 끝-->

				<div class="col-xl-8">
					<!--우측 card 구역 시작-->
					<div class="card">
						<div class="card-body pt-3">
							<!--탭 구역-->
							<ul class="nav nav-tabs nav-tabs-bordered">
								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#profile-info">내 정보</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-interest"
										id="interestPostTab">관심 글</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-like"
										id="likePostTab">내가 좋아요 한 글</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-post">내가 쓴 글</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-comment">내가 쓴 댓글</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-change-password">비밀번호 변경</button>
								</li>
							</ul>
							<!--탭 구역 끝-->

							<div class="tab-content pt-2">
								<!--내정보 내용 구역-->
								<div class="tab-pane fade show active profile-overview"
									id="profile-info">
									<h5 class="card-title">내 정보</h5>

									<div class="row mb-3">
										<label for="profileImage"
											class="col-md-4 col-lg-3 col-form-label">프로필</label>
										<div class="col-md-8 col-lg-9">
											<img src="resources/assets/img/profile-img.jpg" alt="Profile">
											<div class="pt-2">
												<!--프로필 사진 업로드 구현-->
												<!--부트스트랩에서 제공하는 업로드 버튼을 사용해서 file업로드를 구현하기 위해
                        file이란 id를 가진 input태그를 숨겨두고 label만 보이게 해둠. label 안에는 
                      부트스트랩에서 제공하는 업로드버튼형식의 div가 있고, div를 클릭하면 file창이 열림.-->
												<label for="file">
													<div class="btn btn-primary btn-sm"
														title="Upload new profile image">
														프로필 업로드
														<i class="bi bi-upload"></i>
													</div>
													
												</label> 
												<input type="file" name="file" id="file"
													style="display: none;"> 
													
											</div>
										</div>
									</div>

									<div class="row mb-3">
										<label for="userId" class="col-md-4 col-lg-3 col-form-label">아이디</label>
										<div class="col-md-8 col-lg-9">
											<input name="userId" type="text" class="form-control"
												id="userId" value="tmdalsa028">
										</div>
									</div>

									<div class="row mb-3">
										<label for="userId" class="col-md-4 col-lg-3 col-form-label">이름</label>
										<div class="col-md-8 col-lg-9">
											<input name="userName" type="text" class="form-control"
												id="userName" value="류승민">
										</div>
									</div>

									<div class="row mb-3">
										<label for="userNickName"
											class="col-md-4 col-lg-3 col-form-label">별명</label>
										<div class="col-md-8 col-lg-9">
											<input name="userNickName" type="text" class="form-control"
												id="userNickName" value="승꿀벌">
										</div>
									</div>

									<div class="row mb-3">
										<label for="email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
										<div class="col-md-8 col-lg-9">
											<input name="email" type="text" class="form-control"
												id="email" value="tmdalsa028@naver.com">
										</div>
									</div>

									<div class="row mb-3">
										<label for="enrollDate"
											class="col-md-4 col-lg-3 col-form-label">가입일</label>
										<div class="col-md-8 col-lg-9">
											<input name="enrollDate" type="text" class="form-control"
												id="enrollDate" value="2023-05-21">
										</div>
									</div>



									<div class="text-center">
										<button type="submit" class="btn btn-primary">Save
											Changes</button>
									</div>
									</form>

								</div>
								<!--내정보 내용 구역 끝-->

								<!--관심글 내용 구역-->
								<div class="tab-pane fade pt-3" id="profile-interest">
									<div id="interest-header">
										<h5 class="card-title">관심글</h5>
										
									</div>
									<button type="button" id="tableBackBtn" class="btn btn-dark back-btn">뒤로가기</button>
									<input type="hidden" id="currentFolderNo" value="0"> <!--현재 폴더 값 담아둘 hidden input태그 -->
									<div class="table-container">
										<table class="table table-dark table-hover myTable" id="interestTable">
											<colgroup>
											      <col width="5%" />
											      <col width="15%" />
											      <col width="40%" />
											      <col width="15%" />
											</colgroup>
											<thead>
												<tr>
													<th>번호</th>
													<th>분류</th>
													<th colspan='2'>제목</th>
													<th>수정일</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>

								</div>
								<!--관심글 내용 구역 끝-->


								<!--좋아요 내용 구역-->
								<%@include file="../mypage/likeTable.jsp" %>
								<!--좋아요 내용 구역 끝-->


								<!--내가 쓴 글 내용 구역-->
								<div class="tab-pane fade profile-edit pt-3" id="profile-post">

								</div>
								<!--내가 쓴 글 내용 구역 끝-->


								<!--내가 쓴 댓글 내용 구역-->
								<div class="tab-pane fade profile-edit pt-3"
									id="profile-comment"></div>
								<!--내가 쓴 댓글 내용 구역 끝-->


								<!--비밀번호 변경 내용 구역-->
								<div class="tab-pane fade pt-3" id="profile-change-password">
									<!-- 비밀번호 변경 Form -->
									<form>

										<div class="row mb-3">
											<label for="currentPassword"
												class="col-md-4 col-lg-3 col-form-label">현재 비밀번호</label>
											<div class="col-md-8 col-lg-9">
												<input name="password" type="password" class="form-control"
													id="currentPassword">
											</div>
										</div>

										<div class="row mb-3">
											<label for="newPassword"
												class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호</label>
											<div class="col-md-8 col-lg-9">
												<input name="newpassword" type="password"
													class="form-control" id="newPassword">
											</div>
										</div>

										<div class="row mb-3">
											<label for="renewPassword"
												class="col-md-4 col-lg-3 col-form-label">새로운 비밀번호 확인</label>
											<div class="col-md-8 col-lg-9">
												<input name="renewpassword" type="password"
													class="form-control" id="renewPassword">
											</div>
										</div>

										<div class="text-center">
											<button type="submit" class="btn btn-primary">비밀번호
												변경</button>
										</div>
									</form>
									<!--비밀번호 변경 내용 구역 끝-->

								</div>
							</div>
						</div>
						<!--우측 card 구역 끝-->
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- --------------------------------------------------------------
	# 관심글 관련 script 시작
	-------------------------------------------------------------- -->
	<script>
		//관심탭 클릭 이벤트 (관심글 모아둔 테이블에 최상위 폴더,게시글 보여주기)
		$("#interestPostTab").click(function(){
			//ajax를 이용하여 클릭된 폴더를 상위폴더로 취하는 폴더 리스트와
			//클릭된 폴더번호를 갖고있는 관심글 리스트를 가져올 리스트를 만들어 둔다.
			//db로부터 폴더/게시글을 조회해서 가져오기 전에 tbody 비우기
			$("#interestTable>tbody").empty();
			var fList = [];
			var iList = [];
			
			//최상단 폴더 불러오기
			$.ajax({
				url : "topFolder.fd",
				data :{ 
					//유저 번호 전달
					mno : "1"
				},
				async:false, //비동기처리를 순서대로 하기 위해 추가
				success : function(result){
					fList = result;
				},
				error : function(){
					console.log("실패");
				}
			});
			//최상단 게시글 불러오기
			$.ajax({
				url : "topInterst.in",
				data :{ 
					//유저 번호 전달
					mno : "1"
				},
				async:false, //비동기처리를 순서대로 하기 위해 추가
				success : function(result){
					iList = result;
				},
				error : function(){
					console.log("실패");
				}
			}); 
			//보여줄 폴더나 게시글이 존재한다면
			if(fList.length != 0 || iList.length !=0){
				for(var i=0; i<fList.length;i++){
					var tr = $("<tr></tr>");
					var folderNo = $("<th></th>").text(fList[i].folderNo);
					var classify = $("<td>폴더</td>");
					var folderName = $("<td colspan='2'></td>").text(fList[i].folderName);
					var folderImg = $("<img src='resources/assets/img/folder_icon.png'>");
					folderName.prepend(folderImg);
					var createDate = $("<td></td>").text(fList[i].createDate);
					tr.append(folderNo,classify,folderName,createDate);
					$("#interestTable>tbody").append(tr);					
				}
				for(var i=0; i<iList.length;i++){
					var tr = $("<tr></tr>");
					var postNo = $("<th></th>").text(iList[i].postNo);
					var classify = $("<td>게시글</td>");
					var title = $("<td colspan='2'></td>").text(iList[i].title);
					var postDate = $("<td></td>").text(iList[i].postDate);
					tr.append(postNo,classify,title,postDate);
					$("#interestTable>tbody").append(tr);
				}
			} else {
				//보여줄 폴더나 게시글이 존재하지 않는다면
				var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("관심 게시글이 존재하지 않습니다."));
				$("#interestTable>tbody").append(tr);
			}
		});
		
		//관심태그 내 테이블에 존재하는 행(폴더 또는 게시글) 클릭 이벤트
		$("#interestTable>tbody").on("click","tr",function(){
			//분류가 폴더일때는 하위폴더로 이동하도록
			if($(this).children().eq(1).text() == '폴더'){
				//ajax를 이용하여 클릭된 폴더를 상위폴더로 취하는 폴더 리스트와
				//클릭된 폴더번호를 갖고있는 관심글 리스트를 가져올 리스트를 만들어 둔다.
				var fList = [];
				var iList = [];
				
				//하위폴더에 존재하는 폴더 구현
				$.ajax({
				url : "subFolder.fd",
				data :{ 
					//폴더 번호 전달
					fno : $(this).children().first().text(),
					mno : "1"
				},
				async:false, //async false로 처리하면 순서대로 처리 가능.
				success : function(result){
					//미리 만들어둔 리스트에 일단 저장
					fList = result;
				},
				error : function(){
					console.log("실패");
				}
				});
				//하위폴더에 존재하는 게시글 구현
				$.ajax({
					url : "subInterst.in",
					data :{ 
						//유저 번호 전달
						mno : "1",
						fno : $(this).children().first().text()
					},
					async:false,
					success : function(result){
						//미리 만들어둔 리스트에 일단 저장
						iList = result;
					},
					error : function(){
						console.log("실패");
					}
				}); 
				
				if(fList.length != 0 || iList.length !=0){
					//폴더를 눌렀을때 보여줄 폴더나 게시글이 존재한다면 테이블 비우고 다시 채우기
					$("#interestTable>tbody").empty();
					//뒤로가기 버튼 보이게 하기
					$("#tableBackBtn").attr("style", "display:block;");
					//현재 클릭한 폴더번호를 저장해두기
					$("#currentFolderNo").val($(this).children().first().text());


					for(var i=0; i<fList.length;i++){
						var tr = $("<tr></tr>");
						var folderNo = $("<th></th>").text(fList[i].folderNo);
						var classify = $("<td>폴더</td>");
						var folderName = $("<td colspan='2'></td>").text(fList[i].folderName);
						var folderImg = $("<img src='resources/assets/img/folder_icon.png'>");
						folderName.prepend(folderImg);
						var createDate = $("<td></td>").text(fList[i].createDate);
						tr.append(folderNo,classify,folderName,createDate);
						$("#interestTable>tbody").append(tr);					
					}
					for(var i=0; i<iList.length;i++){
						var tr = $("<tr></tr>");
						var postNo = $("<th></th>").text(iList[i].postNo);
						var classify = $("<td>게시글</td>");
						var title = $("<td colspan='2'></td>").text(iList[i].title);
						var postDate = $("<td></td>").text(iList[i].postDate);
						tr.append(postNo,classify,title,postDate);
						$("#interestTable>tbody").append(tr);
					}
				} else {
					//폴더를 눌렀을때 보여줄 폴더나 게시글이 존재하지 않는다면
					alert("하위 폴더 또는 게시글이 존재하지 않습니다.");
				}
				
				
			} else {
				//분류가 게시판일때는 게시판 상세보기로 이동하도록
				$.ajax({
					url : "",
					data :{ 
						mno : "1",
						fno : $(this).children().first().text(),
					},
					success : function(result){
						
						
					},
					error : function(){
						console.log("실패");
					}
				});
				
			}
			
		});
		
		//뒤로가기 버튼 구현
		$("#tableBackBtn").click(function(){
			//ajax를 이용하여 클릭된 폴더를 상위폴더로 취하는 폴더 리스트와
			//클릭된 폴더번호를 갖고있는 관심글 리스트를 가져올 리스트를 만들어 둔다.
			//db로부터 폴더/게시글을 조회해서 가져오기 전에 tbody 비우기
			$("#interestTable>tbody").empty();
			//result 리스트를 담을 빈 리스트 준비. 담아서 한번에 처리하기 위함
			var fList = [];
			var iList = [];
			
			//현재 폴더 번호를 저장
			var cuFolderNo = $("#currentFolderNo").val();

			//상위폴더 리스트 가져오기
			$.ajax({
				url : "backFolder.fd",
				data :{ 
					//유저 번호
					mno : "1",
					//현재 폴더 번호 전달
					cuFolderNo : cuFolderNo
				},
				async:false, //비동기처리를 순서대로 하기 위해 추가
				success : function(result){
					fList = result;
					//현재 폴더 번호를 upFolderNo로 변경해주기. 뒤로가기할때 현재 폴더번호를 상위폴더번호로 변경하는 것.
					$("#currentFolderNo").val(fList[0].upFolderNo);
					if($("#currentFolderNo").val() == 0){
						//뒤로가기 버튼 안 보이게 하기
						$("#tableBackBtn").attr("style", "display:none;");
					}
	
					
				},
				error : function(){
					console.log("실패");
				}
			});
			//상위폴더에 있는 게시글 가져오기
			$.ajax({
				url : "backInterest.in",
				data :{ 
					//유저 번호
					mno : "1",
					//현재 폴더 번호 전달
					cuFolderNo : cuFolderNo
				},
				async:false, //비동기처리를 순서대로 하기 위해 추가
				success : function(result){
					iList = result;
				},
				error : function(){
					console.log("실패");
				}
			}); 
			
			//상위폴더로 갔을때 폴더나 게시글 둘중 하나라도 있다면
			if(fList.length != 0 || iList.length != 0){
				//폴더를 눌렀을때 보여줄 폴더나 게시글이 존재한다면 테이블 비우고 다시 채우기
				$("#interestTable>tbody").empty();

				for(var i=0; i<fList.length;i++){
					var tr = $("<tr></tr>");
					var folderNo = $("<th></th>").text(fList[i].folderNo);
					var classify = $("<td>폴더</td>");
					var folderName = $("<td colspan='2'></td>").text(fList[i].folderName);
					var folderImg = $("<img src='resources/assets/img/folder_icon.png'>");
					folderName.prepend(folderImg);
					var createDate = $("<td></td>").text(fList[i].createDate);
					tr.append(folderNo,classify,folderName,createDate);
					$("#interestTable>tbody").append(tr);					
				}
				for(var i=0; i<iList.length;i++){
					var tr = $("<tr></tr>");
					var postNo = $("<th></th>").text(iList[i].postNo);
					var classify = $("<td>게시글</td>");
					var title = $("<td colspan='2'></td>").text(iList[i].title);
					var postDate = $("<td></td>").text(iList[i].postDate);
					tr.append(postNo,classify,title,postDate);
					$("#interestTable>tbody").append(tr);
				}
			} else {
				//폴더를 눌렀을때 보여줄 폴더나 게시글이 존재하지 않는다면
				console.log("최상위 폴더");
				
			}
		});
	</script>
	<!-- --------------------------------------------------------------
	# 관심글 관련 script 끝
	-------------------------------------------------------------- -->
	<!-- --------------------------------------------------------------
	# 내가 좋아요한 글 관련 script 시작
	-------------------------------------------------------------- -->
	<script>
		//좋아요 탭 클릭 이벤트
		$("#likePostTab").click(function(){
			
			$.ajax({
				url: "likeList.ll",
				data:{
					currentPage:"1",
					mno:"1"
				},
				async:false, //비동기처리를 순서대로 하기 위해 추가
				success : function(result){
					$("#likeTable>tbody").empty();
					for(var i=0; i<result.length;i++){
						var tr = $("<tr></tr>");
						var postNo = $("<th scope='col'></th>").text(result[i].postNo);
						var category = $("<td scope='col'></td>").text(result[i].categoryNo);
						var title = $("<td scope='col'></td>").text(result[i].title);
						var writer = $("<td></td>").text(result[i].writerNo);
						var count = $("<td></td>").text(result[i].count);
						var date = $("<td></td>").text(result[i].enrollDate);
						tr.append(postNo,category,title,writer,count,date);
						$("#likeTable>tbody").append(tr);
					}
					for(var i=0;i<50;i++){
						var tr = $("<tr></tr>");
						var postNo = $("<th scope='col'></th>").text(i);
						var category = $("<td scope='col'></td>").text(i);
						var title = $("<td scope='col'></td>").text(i);
						var writer = $("<td></td>").text(i);
						var count = $("<td></td>").text(i);
						var date = $("<td></td>").text(i);
						tr.append(postNo,category,title,writer,count,date);
						$("#likeTable>tbody").append(tr);
					}
	
					
				},
				error : function(){
					console.log("실패");
				}
			}); 
			
			
			
		});

	
		//좋아요 한 게시글 tr 클릭 이벤트
		$("#likeTable>tbody").on("click","tr",function(){
			
		});
	</script>
	<!-- --------------------------------------------------------------
	# 내가 좋아요한 글 관련 script 끝
	-------------------------------------------------------------- -->
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights
			Reserved
		</div>
		<div class="credits">
			Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>





</body>

</html>