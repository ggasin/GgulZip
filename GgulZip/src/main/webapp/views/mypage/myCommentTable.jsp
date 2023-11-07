<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="tab-pane fade profile-edit pt-3" id="profile-comment">
		<div id="myComment-header">
			<div class="flexDiv">
				<h5 class="card-title">내가 쓴 댓글</h5>
				<div class="search">
				  <input type="text" class="search-input" id="myCommentSearchInput" placeholder="내용으로 검색">
				  <img class="search-icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
			</div>
			<div class="flexDiv">
				<button id="showMyCommentChkBoxBtn" class="btn btn-primary " style="display:none">선택</button>
				<button id="clearMyCommentChkBoxBtn" class="btn btn-secondary" style="display:none">선택 해제</button>
				<button id="deleteMyCommentBtn" class="btn btn-danger" style="display:none">삭제</button>	
			</div>
		</div>
		
	      	<div class="table-container">
		      <table class="table table-dark table-hover myTable" id="myCommentTable">
					<colgroup>
					      <col width="5%" />
					      <col width="10%" />
					      <col width="30%" />
					      <col width="10%" />
					      <col width="10%" />
					      <col width="10%" />
					</colgroup>
					<thead>
						
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>내용</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>원글 제목</th>

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