<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#enroll-area>table {
	border: 1px solid white;
}

#enroll-area input, #enroll-area textarea {
	width: 100%;
	box-sizing: border-box;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>

	<div class="outer">
		<br>
		<h2 align="center">게시글 작성</h2>
		<br>

		<form action="${pageContext.request.contextPath}/RecommInsert.bo" method="post"
			id="enroll-area" enctype="multipart/form-data">
			<table align="center" border="1">
				<tr>
				<th width="70">카테고리</th>
				<td width="70">
					<select name="categoryNo">
						<option value="10">엔터테인먼트/예술</option>
						<option value="20">생활/노하우</option>
						<option value="30">쇼핑</option>
						<option value="40">취미/여가/여행</option>
						<option value="50">지식/교육</option>
						<option value="60">기타</option>
					</select>
				</td>
					<th width="70">제목</th>
					<td width="350"><input type="text" name="title" required></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3"><textarea name="content" rows="10"
					 		style="resize: none" required></textarea></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3"><input type="file">
					</td>
				</tr>
			</table>
			<br> <br>
			<div align="center">
				<button type="submit" onclick="${pageContext.request.contextPath}/'">글작성</button>
				<button type="reset">취소</button>
			</div>

		</form>

		<br> <br>
	</div>

	<script>
		function checkOtherOption(selectElement) {
			var otherCategoryDiv = document.getElementById("otherCategoryDiv");
			if (selectElement.value == "option6") {
				otherCategoryDiv.style.display = "block";
			} else {
				otherCategoryDiv.style.display = "none";
			}
		}
	</script>
</body>
</html>