<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심글 테이블</title>
<style>
	.modal-body input{
		width:100%;
		height:100%;
		border-width: 0;
	}
</style>
</head>
<body>
	<div class="tab-pane fade pt-3" id="profile-interest">
		<div id="interest-header">
			<div class="flexDiv">
				<h5 class="card-title">관심글</h5>
				<div class="search">
				  <input type="text" class="search-input" id="interestSearchInput" placeholder="제목으로 검색">
				  <img class="search-icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</div>
			</div>
			
			<div class="flexDiv">
				<button id="goAddFolderModal" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addFolderModal">폴더 추가</button>
				<button id="showInterestChkBoxBtn" class="btn btn-primary">선택</button>
				<button id="clearInterestChkBoxBtn" class="btn btn-secondary" style="display:none">선택 해제</button>
				<button id="deleteInterestBtn" class="btn btn-danger" style="display:none">삭제</button>	
			</div>
						
		</div>
		<button type="button" id="tableBackBtn" class="btn btn-dark back-btn">뒤로가기</button>
		 <!--현재 폴더 값 담아둘 hidden input태그 -->
		<input type="hidden" id="currentFolderNo" value="0">
		<div class="table-container">
			<table class="table table-dark table-hover myTable" id="interestTable">
				<colgroup>
				      <col width="10%" />
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
				<tfoot>
				</tfoot>
			</table>
		</div>
		
		<!-- 폴더 추가 모달창 -->
		<div class="modal fade" id="addFolderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <input type="text" id="addFolderInput" placeholder="폴더 이름 입력">
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="addFolderBtn" data-bs-dismiss="modal">폴더 추가</button>
		      </div>
		    </div>
		  </div>
		</div>
	</div>
</body>
</html>