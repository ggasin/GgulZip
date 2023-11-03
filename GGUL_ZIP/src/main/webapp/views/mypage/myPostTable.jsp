<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 내 내가 쓴 글 탭 클릭시 나오는 테이블</title>
</head>
<body>
	<div class="tab-pane fade profile-edit pt-3" id="profile-post">
		<div id="my-post-header">
			<h5 class="card-title">내가 좋아요 한 글</h5>
		</div>
		
	      	<div class="table-container">
		      <table class="table table-dark table-hover myTable" id="myPostTable">
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