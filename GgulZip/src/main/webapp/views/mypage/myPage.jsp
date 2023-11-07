<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList"%>

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

table>tbody tr .title:hover{
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
.myTable th{
    border: 1px solid black;
    padding: 8px;
    text-align: center;
}
.myTable td{
    border: 1px solid black;
    padding: 8px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    max-width: 100px;
    text-align: center;
}
.myTable td.title{
	text-align:left;
}
.myTable>thead {
    position: sticky;
    top: 0;
    background-color: #f8f8f8;
}
.myTable>tfoot{
	text-align:center;
}
/*체크박스를 포함한 td 스타일 설정(가운데 정렬)*/
.tdForChkBox {
	text-align: center;
	vertical-align: middle;
	height: 100%;
}

/*--------------------------------------------------------------
# 각 테이블 위 헤더 스타일
--------------------------------------------------------------*/
#interest-header,#like-header,#myPost-header,#myComment-header{
	display: flex;
	align-items: center;
	width: 100%;
	justify-content: space-between;
}
.flexDiv{
align-items: center;
	display: flex;
}
.flexDiv button{
	margin-left: 10px;
}

/*--------------------------------------------------------------
# 마이페이지 검색창 스타일
--------------------------------------------------------------*/
.search {
    position: relative;
    width: 300px;
    }

.search-input {
  width: 100%;
  height: 35px;
  border: 1px solid #012970;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
  margin-left:20px;
}

.search-icon {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 5px;
  
  margin: 0;
}
</style>

</head>

<body>
	
	<!-- 정보 수정 후 alsertMsg받아서 처리 -->
   	<c:if test="${not empty alertMsg}">
    	<script>
    		alert(alertMsg);
    	</script>
    	<c:set var="alertMsg" value="" />
    </c:if>
	<!-- ======= Header ======= -->
	
	<main id="main" class="main">
		<div class="pagetitle">
			<h1>마이페이지</h1>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">
				<!--좌측 프로필,이름,이메일 보이는 구역-->
				<div class="col-xl-3">
					<div class="card">
						<div
							class="card-body profile-card pt-4 d-flex flex-column align-items-center">
							<img src="resources/assets/img/profile-img.jpg" alt="Profile"
								class="rounded-circle">
							<h2>${loginMember.nickname}</h2>
							<br>
							<h3>${loginMember.email}</h3>
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
				
				<!--우측 card 구역 시작-->
				<div class="col-xl-8">	
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
										data-bs-target="#profile-post"
										id="myPostTab">내가 쓴 글</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-comment"
										id="myCommentTab">내가 쓴 댓글</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-change-password"
										id="changePwdTab">비밀번호 변경</button>
								</li>
								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-change-password"
										id="deleteMemberTab">회원 탈퇴</button>
								</li>
							</ul>
							<!--탭 구역 끝-->
							
							<div class="tab-content pt-2">
								<!--내정보/정보변경 내용 구역-->
								
								
									<div class="tab-pane fade show active profile-overview"
										id="profile-info">
										<form action="${contextPath}/memUpdate.my" method="post">
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
													id="userId" value="${loginMember.memberId}" readonly>
											</div>
										</div>
	
										<div class="row mb-3">
											<label for="userId" class="col-md-4 col-lg-3 col-form-label">이름</label>
											<div class="col-md-8 col-lg-9">
												<input name="userName" type="text" class="form-control"
													id="userName" value="${loginMember.memberName}">
											</div>
										</div>
	
										<div class="row mb-3">
											<label for="userNickName"
												class="col-md-4 col-lg-3 col-form-label">별명</label>
											<div class="col-md-8 col-lg-9">
												<input name="userNickName" type="text" class="form-control"
													id="userNickName" value="${loginMember.nickname}">
											</div>
										</div>
	
										<div class="row mb-3">
											<label for="email" class="col-md-4 col-lg-3 col-form-label">이메일</label>
											<div class="col-md-8 col-lg-9">
												<input name="email" type="email" class="form-control"
													id="email" value="${loginMember.email}">
											</div>
										</div>
	
										<div class="row mb-3">
											<label for="enrollDate"
												class="col-md-4 col-lg-3 col-form-label">가입일</label>
											<div class="col-md-8 col-lg-9">
												
												<input name="enrollDate" type="text" class="form-control"
													id="enrollDate" value="${loginMember.enrolldate}" readonly>
											</div>
										</div>
	
	
	
										<div class="text-center">
											<button type="submit" id="memUpdateBtn" class="btn btn-primary">수정 완료</button>
										</div>
									
										</form>
									</div>
								
								<!--내정보 내용 구역 끝-->

								<!--관심글 내용 구역-->
								<%@include file="../mypage/interestTable.jsp" %>
								<!--관심글 내용 구역 끝-->
								
								<!--좋아요 내용 구역-->
								<%@include file="../mypage/likeTable.jsp" %>
								<!--좋아요 내용 구역 끝-->

								<!--내가 쓴 글 내용 구역-->
								<%@include file="../mypage/myPostTable.jsp" %>
								<!--내가 쓴 글 내용 구역 끝-->

								<!--내가 쓴 댓글 내용 구역-->
								<%@include file="../mypage/myCommentTable.jsp" %>
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
								</div>
								<!--비밀번호 변경 내용 구역 끝-->
							</div>
						</div>
						

					</div>
				</div>
				<!--우측 card 구역 끝-->
			</div>
			<!------------------------관심글 태그 관련 스크립트 시작------------------------------------>
			<script>
				
				//관심탭 클릭 이벤트 (관심글 모아둔 테이블에 최상위 폴더,게시글 보여주기)
				$("#interestPostTab").click(function(){
				    //ajax를 이용하여 클릭된 폴더를 상위폴더로 취하는 폴더 리스트와
				    //클릭된 폴더번호를 갖고있는 관심글 리스트를 가져올 리스트를 만들어 둔다.
				    //db로부터 폴더/게시글을 조회해서 가져오기 전에 tbody tfoot 비우기
				    resetTable();
				    hideInterestHeaderBtn();
				    $("#tableBackBtn").attr("style", "display:none;");
				    
				    //폴더 리스트 / 게시글 리스트
				    var fList = [];
				    var pList = [];
				    
				    
				    //최상단 폴더 불러오기
				    $.ajax({
				        url : "topFolder.fd",
				        data :{ 
				            //유저 번호 전달
				            mno : "${loginMember.memberNo}"
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
				            mno : "${loginMember.memberNo}"
				        },
				        async:false, //비동기처리를 순서대로 하기 위해 추가
				        success : function(result){
				            pList = result;
				        },
				        error : function(){
				            console.log("실패");
				        }
				    }); 
				    //보여줄 폴더나 게시글이 존재한다면		
				    if(fList.length != 0 || pList.length !=0){
				    	$('#showInterestChkBoxBtn').attr('style','display:block');
				        appendFolderToTable(fList);
				        appendPostToTable(pList);
				    } else {
				        //보여줄 폴더나 게시글이 존재하지 않는다면
				        $('#showInterestChkBoxBtn').attr('style','display:none');
				        var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("관심 게시글이 존재하지 않습니다."));
				        $("#interestTable>tfoot").append(tr);
				    }
				});
	
				//관심태그 내 테이블에 존재하는 행 내 제목(폴더 또는 게시글) 클릭 이벤트
				$("#interestTable>tbody").on("click","tr td.title",function(){
					var parentTr = $(this).closest('tr');
				    //분류가 폴더일때는 하위폴더로 이동하도록
				    if(parentTr.children().eq(1).text() == '폴더'){
				        //ajax를 이용하여 클릭된 폴더를 상위폴더로 취하는 폴더 리스트와
				        //클릭된 폴더번호를 갖고있는 관심글 리스트를 가져올 리스트를 만들어 둔다.
				        var fList = [];
				        var pList = [];
				        
				        //하위폴더에 존재하는 폴더 구현
				        $.ajax({
				        url : "subFolder.fd",
				        data :{ 
				            //폴더 번호 전달
				            fno : parentTr.children().first().text(),
				            mno : "${loginMember.memberNo}"
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
				                mno : "${loginMember.memberNo}",
				                fno : parentTr.children().first().text()
				            },
				            async:false,
				            success : function(result){
				                //미리 만들어둔 리스트에 일단 저장
				                pList = result;
				            },
				            error : function(){
				                console.log("실패");
				            }
				        }); 
				        
				        
			            //폴더를 눌렀을때 보여줄 폴더나 게시글이 존재한다면 테이블 비우고 다시 채우기
			            resetTable();
			            hideInterestHeaderBtn();
			            //뒤로가기 버튼 보이게 하기
			            $("#tableBackBtn").attr("style", "display:inline-block;");
			            //현재 클릭한 폴더번호를 저장해두기
			            $("#currentFolderNo").val(parentTr.children().first().text());
			            console.log($("#currentFolderNo").val());

			          	//보여줄 폴더나 게시글이 존재한다면		
					    if(fList.length != 0 || pList.length !=0){
					    	$('#showInterestChkBoxBtn').attr('style','display:block');
					        appendFolderToTable(fList);
					        appendPostToTable(pList);
					    } else {
					        //보여줄 폴더나 게시글이 존재하지 않는다면
					        $('#showInterestChkBoxBtn').attr('style','display:none');
					        var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("관심 게시글이 존재하지 않습니다."));
					        $("#interestTable>tfoot").append(tr);
					    }
				        
				        
				        
				    } else {
				        //분류가 게시판일때는 게시판 상세보기로 이동하도록
				        $.ajax({
				            url : "",
				            data :{ 
				                mno : "${loginMember.memberNo}",
				                fno : parentTr.children().first().text(),
				            },
				            success : function(result){
   
				            },
				            error : function(){
				                console.log("실패");
				            }
				        });
				        
				    }
				    
				});
	
				//관심글 폴더 구조 뒤로가기 버튼 구현
				$("#tableBackBtn").click(function(){
				    //ajax를 이용하여 클릭된 폴더를 상위폴더로 취하는 폴더 리스트와
				    //클릭된 폴더번호를 갖고있는 관심글 리스트를 가져올 리스트를 만들어 둔다.
				    //db로부터 폴더/게시글을 조회해서 가져오기 전에 tbody tfoot 비우기
				    resetTable();
				    hideInterestHeaderBtn();
				    //result 리스트를 담을 빈 리스트 준비. 담아서 한번에 처리하기 위함
				    var fList = [];
				    var pList = [];
				    
				    //현재 폴더 번호를 저장
				    var cuFolderNo = $("#currentFolderNo").val();
	
				    //상위폴더 리스트 가져오기
				    $.ajax({
				        url : "backFolder.fd",
				        data :{ 
				            //유저 번호
				            mno : "${loginMember.memberNo}",
				            //현재 폴더 번호 전달
				            cuFolderNo : cuFolderNo
				        },
				        async:false, //비동기처리를 순서대로 하기 위해 추가
				        success : function(result){
				            fList = result;
				            //현재 폴더 번호를 upFolderNo로 변경해주기. 뒤로가기할때 현재 폴더번호를 상위폴더번호로 변경하는 것.
				            $("#currentFolderNo").val(fList[0].upFolderNo);
				            console.log($("#currentFolderNo").val());
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
				            mno : "${loginMember.memberNo}",
				            //현재 폴더 번호 전달
				            cuFolderNo : cuFolderNo
				        },
				        async:false, //비동기처리를 순서대로 하기 위해 추가
				        success : function(result){
				            pList = result;
				        },
				        error : function(){
				            console.log("실패");
				        }
				    }); 
				    
				    //상위폴더로 갔을때 폴더나 게시글 둘중 하나라도 있다면
				    if(fList.length != 0 || pList.length != 0){
				        //폴더를 눌렀을때 보여줄 폴더나 게시글이 존재한다면 테이블 비우고 다시 채우기
				        resetTable();
				        appendFolderToTable(fList);
				        appendPostToTable(pList);
				    }
				});
				
				
				//관심글 테이블 체크박스 생성하는 버튼
				$('#showInterestChkBoxBtn').click(function() {
					showInterestHeaderBtn();
					//interestTable안에 interestChkBox라는 클래스이름을 가진 요소가 없으면 체크박스 추가
					if ($('#interestTable').find('.interestChkBox').length === 0) {
						$('#interestTable thead tr').append('<th class="chkBoxTh">선택</th>');
						$('#interestTable tbody tr').each(function() {
		                    $(this).append('<td class="tdForChkBox"><input type="checkbox" name="" class="interestChkBox"></td>');
		            	});
		            }
		        });

				//관심글 테이블 체크박스 제거하는 버튼
		        $('#clearInterestChkBoxBtn').click(function() {
		        	hideInterestHeaderBtn();
		            $('#interestTable tbody tr .interestChkBox').parents('td').remove();
		            $('#interestTable thead tr .chkBoxTh').remove();
		        });
		    	
				//관심글 삭제 
				$('#deleteInterestBtn').click(function(){
					if($(".interestChkBox:checked").length>0){
						if(confirm("정말로 삭제하시겠습니까?\n폴더를 삭제하시면 폴더 내 데이터는 전부 삭제됩니다.")){
							//체크된 폴더 번호를 담을 배열과 게시글 번호를 담을 배열
							var folderNoArr = [];
							var postNoArr = [];
							//interestChkBox라는 클래스이름을 가진 chkBox중 체크 된것들 반복
							$(".interestChkBox:checked").each(function(index,element){
								//체크된 체크박스에서 가장 가까운 tr요소의 2번째 td자식요소가 분류값을 가지고 있고, 그 이름이 폴더라면
								if($(element).closest('tr').find('td:nth-child(2)').text() == '폴더'){
									//폴더 배열에 폴더번호를 넣는다.
									folderNoArr.push($(element).closest('tr').find('th:first-child').text());
								}else{
									//아니라면 게시글 번호 배열에 번호 넣기.
									postNoArr.push($(element).closest('tr').find('th:first-child').text());
								}								
							});
							
							$.ajax({
								url:"interestDelete.my",
								data:{
									mno : "${loginMember.memberNo}",
									folderNoArr: folderNoArr,
									postNoArr : postNoArr
								},
							
								
								async : false,
								success : function(result){
									console.log("통신 성공");
									if(result == "success"){
										$("#interestPostTab").click();
										alert("삭제 성공");
										hideInterestHeaderBtn();
										
									}else {
										alert("삭제 실패");
									}
								},
								error : function(){
									console.log("통신 실패");
								}
							});
						}	
					} else {
						alert("삭제할 폴더 혹은 게시글을 선택해주세요.");
					}	
				});
				
				
				//검색창 입력 이벤트
				$(function () {
					var timeout = null; // 타이핑이 멈춘 후 대기 시간을 저장할 변수
					
					$("#interestSearchInput").keyup(function(){
					   clearTimeout(timeout); // 기존 타이머를 취소
					
					   timeout = setTimeout(function () {
							// 1초 이후에 실행할 함수를 여기에 작성
							console.log($("#interestSearchInput").val());
							var inputData = $("#interestSearchInput").val();
							if(inputData == ""){
								$("#interestPostTab").click();
							} else {
								$.ajax({
									url:"searchInterest.my",
									data:{
										inputData: inputData,
										mno:"${loginMember.memberNo}"
									},
									success:function(result){
										if(result.length !=0){
											resetTable();
											appendPostToTable(result);
										} else{
											resetTable();
											//보여줄 폴더나 게시글이 존재하지 않는다면
									        $('#showInterestChkBoxBtn').attr('style','display:none');
									        var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("검색결과에 일치하는 관심 게시글이 존재하지 않습니다."));
									        $("#interestTable>tfoot").append(tr);
										}
										
									},
									error:function(){
										
									}
								});
							}
					   }, 800);
					 });
			    });
				
				//폴더 추가 버튼
				$("#addFolderBtn").click(function(){
					if($("addFolderInput").val() != ""){
						$.ajax({
							url:"addFolder.my",
							data : {
								mno : "${loginMember.memberNo}",
								folderName: $("#addFolderInput").val(),
								currentFolderNo: $("#currentFolderNo").val()
							},
							success : function(result){
								if(result === "success"){
									alert("폴더 추가 완료");
									$("#interestPostTab").click();
									
								}else {
									alert("폴더 추가 실패");
								}
							},
							error : function(){
								
							}
						
						});
					} else {
						alert("폴더이름이 입력되지 않았습니다.");
					}
					
				});
				
				//조회해온 폴더 리스트를 table에 뿌려주는 함수
				function appendFolderToTable(fList){
					for(var i=0; i<fList.length;i++){
			            var tr = $("<tr></tr>");
			            var folderNo = $("<th></th>").text(fList[i].folderNo);
			            var classify = $("<td>폴더</td>");
			            var folderName = $("<td colspan='2' class='title'></td>").text(fList[i].folderName);
			            var folderImg = $("<img src='resources/assets/img/folder_icon.png'>");
			            folderName.prepend(folderImg);
			            var createDate = $("<td></td>").text(fList[i].createDate);
			            tr.append(folderNo,classify,folderName,createDate);
			            $("#interestTable>tbody").append(tr);					
			        }
				}
				//조회해온 게시물 리스트를 table에 뿌려주는 함수
				function appendPostToTable(pList){
					for(var i=0; i<pList.length;i++){
						var tr = $("<tr></tr>");
			            var postNo = $("<th></th>").text(pList[i].postNo);
			            var classify = $("<td>게시글</td>");
			            var title = $("<td colspan='2' class='title'></td>").text(pList[i].title);
			            var postDate = $("<td></td>").text(pList[i].postDate);
			            tr.append(postNo,classify,title,postDate);
			            $("#interestTable>tbody").append(tr);				
			        }
				}
				
				//tbody,thead, '선택' th 비우는 함수
				function resetTable(){
					console.log("zdzd");
					$("#interestTable>tbody").empty();
				    $("#interestTable>tfoot").empty();
				    $('#interestTable thead tr .chkBoxTh').remove();
				}
				//삭제,선택해제 버튼 숨기기
				function hideInterestHeaderBtn(){
					$('#deleteInterestBtn').attr('style','display:none');
		        	$('#clearInterestChkBoxBtn').attr('style','display:none');
				}
				//삭제,선택해제 버튼 보이기
				function showInterestHeaderBtn(){
					
					$('#deleteInterestBtn').attr('style','display:block');
					$('#clearInterestChkBoxBtn').attr('style','display:block');
				}
			</script>
			<!------------------------관심글 태그 관련 스크립트 끝------------------------------------>
			<!------------------------좋아요 태그 관련 스크립트 시작----------------------------------->
			<script>
				
				//좋아요 탭 클릭 이벤트
				$("#likePostTab").click(function(){
				    $.ajax({
				        url: "likeList.ll",
				        data:{
				            mno:"${loginMember.memberNo}"
				        },
				        success : function(result){
				        	//탭 클릭시 좋아요 테이블을 일단 비우기(비우지 않으면 다른 탭 갔다가 다시 좋아요 탭을 누르면 tr이 쌓임.)
				            resetLikeTable();
				            removeLikeChkThDeleteClearBtn();
							 
				            //비운 다음 db에 접근해서 가져온 result값들로 채우기
				            if(result.length > 0){
				            	$('#showLikeChkBoxBtn').attr('style','display:block');
				            	appendLikePostToTable(result);
				            } else{
				            	//내가 좋아요 한 게시글이 존재하지 않는다면
				            	$('#showLikeChkBoxBtn').attr('style','display:none');
				                var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("내가 쓴 게시글이 존재하지 않습니다."));
				                $("#likeTable>tfoot").append(tr);
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
				
				//좋아요 테이블 체크박스 생성하는 버튼
				$('#showLikeChkBoxBtn').click(function() {
					$('#deleteLikeBtn').attr('style','display:block');
					$('#clearLikeChkBoxBtn').attr('style','display:block');
					//LikeTable안에 LikeChkBox라는 클래스이름을 가진 요소가 없으면 체크박스 추가
					if ($('#likeTable').find('.likeChkBox').length === 0) {
						$('#likeTable thead tr').append('<th class="chkBoxTh">선택</th>');
						$('#likeTable tbody tr').each(function() {
		                    $(this).append('<td class="tdForChkBox"><input type="checkbox" name="" class="likeChkBox"></td>');
		            	});
		            }
		        });
				
				//좋아요 테이블 체크박스 제거하는 버튼
		        $('#clearLikeChkBoxBtn').click(function() {
		            $('#likeTable tbody tr .likeChkBox').parents('td').remove();
		            removeLikeChkThDeleteClearBtn();
		        });
		    	
				//좋아요 삭제 
				$('#deleteLikeBtn').click(function(){
					if($(".likeChkBox:checked").length>0){
						if(confirm("정말로 삭제하시겠습니까?")){
							//체크된 게시글 번호를 담을 배열
							var postNoArr = [];
							//likeChkBox라는 클래스이름을 가진 chkBox중 체크 된것들 반복
							$(".likeChkBox:checked").each(function(index,element){
									postNoArr.push($(element).closest('tr').find('th:first-child').text());
								
							});
							
							$.ajax({
								url:"likeDelete.my",
								data:{
									mno : "${loginMember.memberNo}",
									postNoArr : postNoArr
								},
							
								async : false,
								success : function(result){
									console.log("통신 성공");
									if(result == "success"){
										$("#likePostTab").click();
										alert("삭제 성공");
										removeChkThDeleteClearBtn();
										
									}else {
										alert("삭제 실패");
									}
								},
								error : function(){
									console.log("통신 실패");
								}
							});
						} 
					}else {
						alert("삭제할 게시글을 선택해주세요.");
					}	
				});
				
				//검색창 입력 이벤트
				$(function () {
					var timeout = null; // 타이핑이 멈춘 후 대기 시간을 저장할 변수
					
					$("#likeSearchInput").keyup(function(){
					   clearTimeout(timeout); // 기존 타이머를 취소
					
					   timeout = setTimeout(function () {
							// 1초 이후에 실행할 함수를 여기에 작성
							console.log($("#likeSearchInput").val());
							var inputData = $("#likeSearchInput").val();
							if(inputData == ""){
								$("#likePostTab").click();
							} else {
								$.ajax({
									url:"searchLike.my",
									data:{
										inputData: inputData,
										mno:"${loginMember.memberNo}"
									},
									success:function(result){
										resetLikeTable();
										removeLikeChkThDeleteClearBtn();
										if(result.length !=0){
											//탭 클릭시 좋아요 테이블을 일단 비우기(비우지 않으면 다른 탭 갔다가 다시 좋아요 탭을 누르면 tr이 쌓임.)
											appendLikePostToTable(result);
										} else{

											//보여줄 폴더나 게시글이 존재하지 않는다면
									        $('#showLikeChkBoxBtn').attr('style','display:none');
									        var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("검색결과에 일치하는 좋아요한 게시글이 존재하지 않습니다."));
									        $("#likeTable>tfoot").append(tr);
										}
										
									},
									error:function(){
										
									}
								});
							}
					   }, 800);
					 });
			    }); 
				
				//테이블에 좋아요 글 넣는 반복문 함수
				function appendLikePostToTable(result){
					for(var i=0; i<result.length;i++){
		                var tr = $("<tr></tr>");
		                var postNo = $("<th></th>").text(result[i].postNo);
		                var category = $("<td ></td>").text(result[i].categoryNo);
		                var title = $("<td class='title'></td>").text(result[i].title);
		                var count = $("<td></td>").text(result[i].count);
		                var writer = $("<td></td>").text(result[i].writerNo);
		                var date = $("<td></td>").text(result[i].enrollDate);
		                tr.append(postNo,category,title,writer,count,date);
		                $("#likeTable>tbody").append(tr);
		            }
				}
				
				//삭제버튼, 선택해제버튼, 테이블 내 '선택' th 숨기기 (탭 이동이 있을 시 없애지 않으면 남아있음)
				function removeLikeChkThDeleteClearBtn(){
					$('#deleteLikeBtn').attr('style','display:none');
					$('#clearLikeChkBoxBtn').attr('style','display:none');
					$('#likeTable thead tr .chkBoxTh').remove();
				}
				function resetLikeTable(){
					$("#likeTable>tbody").empty();
		            $("#likeTable>tfoot").empty();
				}
			</script>
			
			<!------------------------좋아요 태그 관련 스크립트 끝------------------------------------>
			<!------------------------내가 쓴 글 태그 관련 스크립트 시작------------------------------------>
			<script>
				$("#myPostTab").click(function(){   
				    $.ajax({
				        url: "myPostList.my",
				        data:{
				            mno:"${loginMember.memberNo}"
				        },
				        success : function(result){
				        	resetMyPostTable();
				        	removeMyPostChkThDeleteClearBtn();
				            //내가 쓴 게시글이 존재한다면
				            if(result.length>0){
				            	$('#showMyPostChkBoxBtn').attr('style','display:block');
				            	appendMyPostToTable(result);
				            } else {
				            	//내가 쓴 게시글이 존재하지 않는다면
				            	$('#showMyPostChkBoxBtn').attr('style','display:none');
				                var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("내가 쓴 게시글이 존재하지 않습니다."));
				                $("#myPostTable>tfoot").append(tr);
				            }
				            
				        
				        },
				        error : function(){
				            console.log("실패");
				        }
				    });
				});
				//내가 쓴 글 테이블 체크박스 생성하는 버튼
				$('#showMyPostChkBoxBtn').click(function() {
					//숨겨져 있던 삭제,선택해제 버튼 보이기
					$('#deleteMyPostBtn').attr('style','display:block');
					$('#clearMyPostChkBoxBtn').attr('style','display:block');
					//LikeTable안에 LikeChkBox라는 클래스이름을 가진 요소가 없으면 체크박스 추가
					if ($('#myPostTable').find('.myPostChkBox').length === 0) {
						$('#myPostTable thead tr').append('<th class="chkBoxTh">선택</th>');
						$('#myPostTable tbody tr').each(function() {
		                    $(this).append('<td class="tdForChkBox"><input type="checkbox" name="" class="myPostChkBox"></td>');
		            	});
		            }
		        });
				
				//내가 쓴 글 테이블 체크박스 제거하는 버튼
		        $('#clearMyPostChkBoxBtn').click(function() {
		            $('#myPostTable tbody tr .myPostChkBox').parents('td').remove();
		            removeMyPostChkThDeleteClearBtn();
		        });
		    	
				//내가 쓴 글 삭제 
				$('#deleteMyPostBtn').click(function(){
					if($(".myPostChkBox:checked").length>0){
						if(confirm("정말로 삭제하시겠습니까?")){
							//체크된 게시글 번호를 담을 배열
							var postNoArr = [];
							//likeChkBox라는 클래스이름을 가진 chkBox중 체크 된것들 반복
							$(".myPostChkBox:checked").each(function(index,element){
									postNoArr.push($(element).closest('tr').find('th:first-child').text());
								
							});
							
							$.ajax({
								url:"myPostDelete.my",
								data:{
									mno : "${loginMember.memberNo}",
									postNoArr : postNoArr
								},
							
								async : false,
								success : function(result){
									console.log("통신 성공");
									if(result == "success"){
										$("#myPostTab").click();
										alert("삭제 성공");
										removeMyPostChkThDeleteClearBtn();
										
									}else {
										alert("삭제 실패");
									}
								},
								error : function(){
									console.log("통신 실패");
								}
							});
						} 
					}else {
						alert("삭제할 게시글을 선택해주세요.");
					}	
				});
				//검색창 입력 이벤트
				$(function () {
					var timeout = null; // 타이핑이 멈춘 후 대기 시간을 저장할 변수
					
					$("#myPostSearchInput").keyup(function(){
					   clearTimeout(timeout); // 기존 타이머를 취소
					
					   timeout = setTimeout(function () {
							// 1초 이후에 실행할 함수를 여기에 작성
							console.log($("#myPostSearchInput").val());
							var inputData = $("#myPostSearchInput").val();
							if(inputData == ""){
								$("#myPostTab").click();
							} else {
								$.ajax({
									url:"searchMyPost.my",
									data:{
										inputData: inputData,
										mno:"${loginMember.memberNo}"
									},
									success:function(result){
										resetMyPostTable();
										removeMyPostChkThDeleteClearBtn();
										if(result.length !=0){
											appendMyPostToTable(result);
										} else{
											//보여줄 폴더나 게시글이 존재하지 않는다면
									        $('#showMyPostChkBoxBtn').attr('style','display:none');
									        var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("검색결과에 일치하는 게시글이 존재하지 않습니다."));
									        $("#myPostTable>tfoot").append(tr);
										}
										
									},
									error:function(){
										console.log("통신 실패");
									}
								});
							}
					   }, 800);
					 });
			    }); 
				//테이블에 글 넣는 반복문 함수
				function appendMyPostToTable(result){
					for(var i=0; i<result.length;i++){
		                var tr = $("<tr></tr>");
		                var postNo = $("<th></th>").text(result[i].postNo);
		                var category = $("<td></td>").text(result[i].categoryNo);
		                var title = $("<td class='title'></td>").text(result[i].title);
		                var count = $("<td></td>").text(result[i].count);
		                var writer = $("<td></td>").text(result[i].writerNo);
		                var date = $("<td></td>").text(result[i].enrollDate);
		                tr.append(postNo,category,title,writer,count,date);
		                $("#myPostTable>tbody").append(tr);
	            	}
				}
				
				//삭제버튼, 선택해제버튼, 테이블 내 '선택' th 숨기기 (탭 이동이 있을 시 없애지 않으면 남아있음)
				function removeMyPostChkThDeleteClearBtn(){
					$('#myPostTable thead tr .chkBoxTh').remove();
		            $('#deleteMyPostBtn').attr('style','display:none');
					$('#clearMyPostChkBoxBtn').attr('style','display:none');
				}
				
				//테이블 비우기
				function resetMyPostTable(){
					 $("#myPostTable>tbody").empty();
			         $("#myPostTable>tfoot").empty();
				}
				</script>
			<!------------------------내가 쓴 글 태그 관련 스크립트 끝------------------------------------>
			<!------------------------내가 쓴 글 태그 관련 스크립트 끝------------------------------------>
			
			<!------------------------내가 쓴 댓글 태그 관련 스크립트 시작------------------------------------>
			<script>
				$("#myCommentTab").click(function(){   
				    $.ajax({
				        url: "myCommentList.my",
				        data:{
				            mno: "${loginMember.memberNo}"
				        },
				        success : function(result){
				        	resetCommentTable();
				        	removeCommentChkThDeleteClearBtn();	            
				            //내가 쓴 게시글이 존재한다면
				            if(result.length>0){
				            	$('#showMyCommentChkBoxBtn').attr('style','display:block');
				            	appendToCommentTable(result);
				            } else {
				            	//내가 쓴 게시글이 존재하지 않는다면
				            	$('#showMyCommentChkBoxBtn').attr('style','display:none');
				                var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("내가 쓴 댓글이 존재하지 않습니다."));
				                $("#myCommentTable>tfoot").append(tr);
				            }
				            
				        
				        },
				        error : function(){
				            console.log("실패");
				        }
				    });  
				});
				//내가 쓴 댓글 테이블 체크박스 생성하는 버튼
				$('#showMyCommentChkBoxBtn').click(function() {
					$('#deleteMyCommentBtn').attr('style','display:block');
					$('#clearMyCommentChkBoxBtn').attr('style','display:block');
					//LikeTable안에 LikeChkBox라는 클래스이름을 가진 요소가 없으면 체크박스 추가
					if ($('#myCommentTable').find('.myCommentChkBox').length === 0) {
						$('#myCommentTable thead tr').append('<th class="chkBoxTh">선택</th>');
						$('#myCommentTable tbody tr').each(function() {
		                    $(this).append('<td class="tdForChkBox"><input type="checkbox" name="" class="myCommentChkBox"></td>');
		            	});
		            }
		        });
				
				//내가 쓴 댓글 테이블 체크박스 제거하는 버튼
		        $('#clearMyCommentChkBoxBtn').click(function() {
		            $('#myCommentTable tbody tr .myCommentChkBox').parents('td').remove();
		            removeCommentChkThDeleteClearBtn();
		        });
		    	
				//내가 쓴 댓글 삭제 
				$('#deleteMyCommentBtn').click(function(){
					if($(".myCommentChkBox:checked").length>0){
						if(confirm("정말로 삭제하시겠습니까?")){
							//체크된 게시글 번호를 담을 배열
							var commentNoArr = [];
							//likeChkBox라는 클래스이름을 가진 chkBox중 체크 된것들 반복
							$(".myCommentChkBox:checked").each(function(index,element){
								commentNoArr.push($(element).closest('tr').find('th:first-child').text());
							});
							
							$.ajax({
								url:"myCommentDelete.my",
								data:{
									mno : "${loginMember.memberNo}",
									commentNoArr : commentNoArr
								},
							
								async : false,
								success : function(result){
									console.log("통신 성공");
									if(result == "success"){
										$("#myCommentTab").click();
										alert("삭제 성공");
										removeCommentChkThDeleteClearBtn();
										
									}else {
										alert("삭제 실패");
									}
								},
								error : function(){
									console.log("통신 실패");
								}
							});
						} 
					}else {
						alert("삭제할 댓글을 선택해주세요.");
					}	
				});
				
				//검색창 입력 이벤트
				$(function () {
					var timeout = null; // 타이핑이 멈춘 후 대기 시간을 저장할 변수
					
					$("#myCommentSearchInput").keyup(function(){
					   clearTimeout(timeout); // 기존 타이머를 취소
					
					   timeout = setTimeout(function () {
							// 1초 이후에 실행할 함수를 여기에 작성
							console.log($("#myCommentSearchInput").val());
							var inputData = $("#myCommentSearchInput").val();
							if(inputData == ""){
								$("#myCommentTab").click();
							} else {
								$.ajax({
									url:"searchMyComment.my",
									data:{
										inputData: inputData,
										mno:"${loginMember.memberNo}"
									},
									success:function(result){
										resetCommentTable();
										removeCommentChkThDeleteClearBtn();
										if(result.length !=0){
											appendToCommentTable(result);
										} else{
											//보여줄 폴더나 게시글이 존재하지 않는다면
									        $('#showMyCommentChkBoxBtn').attr('style','display:none');
									        var tr = $("<tr></tr>").append($("<td colspan='6'></td>").text("검색결과에 일치하는 댓글이 존재하지 않습니다."));
									        $("#myCommentTable>tfoot").append(tr);
										}
										
									},
									error:function(){
										console.log("통신 실패");
									}
								});
							}
					   }, 800);
					 });
			    }); 
				//테이블에 댓글 넣는 반복문 함수
				function appendToCommentTable(result){
					for(var i=0; i<result.length;i++){
		                var tr = $("<tr></tr>");
		                var commentNo = $("<th></th>").text(result[i].commentNo);
		                var category = $("<td></td>").text(result[i].categoryName);
		                var content = $("<td class='title'></td>").text(result[i].content);
		                var writer = $("<td></td>").text(result[i].writerNo);
		                var date = $("<td></td>").text(result[i].commentDate);
		                var postTitle = $("<td></td>").text(result[i].postTitle);
		                tr.append(commentNo,category,content,writer,date,postTitle);
		                $("#myCommentTable>tbody").append(tr);
	            	}
				}
				
				//삭제버튼, 선택해제버튼, 테이블 내 '선택' th 숨기기 (탭 이동이 있을 시 없애지 않으면 남아있음)
				function removeCommentChkThDeleteClearBtn(){
					$('#myCommentTable thead tr .chkBoxTh').remove();
		            $('#deleteMyCommentBtn').attr('style','display:none');
					$('#clearMyCommentChkBoxBtn').attr('style','display:none');
				}
				//테이블 비우기
				function resetCommentTable(){
					 $("#myCommentTable>tbody").empty();
			         $("#myCommentTable>tfoot").empty();
				}
			</script>
			<!------------------------내가 쓴 댓글 태그 관련 스크립트 끝------------------------------------>
			
		</section>

	</main>
	
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