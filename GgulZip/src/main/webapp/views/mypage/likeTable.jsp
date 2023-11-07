<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 내 좋아요 탭 클릭시 나오는 테이블</title>
</head>
<body>
	<div class="tab-pane fade profile-edit pt-3" id="profile-like">
		<div id="like-header">
			<div class="flexDiv">
				<h5 class="card-title">좋아요 한 글</h5>
				<div class="search">
				  <input type="text" class="search-input" id="likeSearchInput" placeholder="제목으로 검색">
				  <img class="search-icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
			</div>
			<div class="flexDiv">
				<button id="showLikeChkBoxBtn" class="btn btn-primary" style="display:none;">선택</button>
				<button id="clearLikeChkBoxBtn" class="btn btn-secondary" style="display:none">선택 해제</button>
				<button id="deleteLikeBtn" class="btn btn-danger" style="display:none">삭제</button>	
			</div>
		</div>
		
	      	<div class="table-container">
		      <table class="table table-dark table-hover myTable" id="likeTable">
					<colgroup>
					      <col width="5%" />
					      <col width="10%" />
					      <col width="30%" />
					      <col width="10%" />
					      <col width="10%" />
					      <col width="15%" />
					</colgroup>
					<thead>
						
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>						
							<th>조회수</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
					
					</tbody>
					<tfoot>
					
					</tfoot>
				</table>
			</div>
	</div>
		 
</body>
</html>