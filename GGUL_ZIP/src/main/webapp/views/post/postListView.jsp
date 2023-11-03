<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.list-area > tbody tr:hover {
        	background-color : rgb(255, 225, 77);
        	cursor : pointer;
       }

</style>
</head>
<body>
	<!-- 상위폴더로 -->
	<div class="outer">
		<br>
		<h2 align="center">자유게시판</h2>
		<div>
			<a href = "insert.bo" class = "btn btn-info">글작성</a>
		</div>
		<br><br>
		<table class="list-area" align="center">
			<thead style="background-color: rgb(255, 225, 77); color: black; height:40px">
				<tr>
					<th width="70">글번호</th>
					<th width="70">카테고리</th>
					<th width="250">제목</th>
					<th width="350">내용</th>
					<th width="50">조회수</th>
					<th width="100">작성자</th>
					<th width="100">작성일</th>
				</tr>
			</thead>
			<tbody>
				<!-- 리스트가 비어있는 경우  -->
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan = '7'> 게시글이 없습니다 </td>
						</tr>
					</c:when>
					<c:otherwise>
					<!-- 목록이 존재하는경우 -->
					<c:forEach items = "${list}" var = "p">
						<tr>
							<td>${p.postNo }</td>
							<td>${p.categoryNo }</td>
							<td>${p.title }</td>
							<td>${p.content }</td>
							<td>${p.count }</td>
							<td>${p.nickname}</td>
							<td>${p.postDate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
				</c:choose>
				</tbody>
			</table>	
			
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
			<script>
			$(function(){
				$(".list-area>tbody>tr").click(function(){
				
					location.href = "detail.bo?postNo="+$(this).children().eq(0).text();
				});

			});
			</script>
			
			<br>
			<!-- 페이징바 -->
		<div align="center" class="paging-area">
	
		<!-- 페이징버튼 -->
		<c:forEach var="i" begin="${pi.startPage}" end="${pi.endPage}">
		    <button onclick="location.href='list.bo?currentPage=${i}'">${i}</button>
		</c:forEach>
		
		<!-- 이전버튼 -->
		<c:choose>
		    <c:when test="${pi.currentPage eq 1}">
		        <button disabled>이전</button>
		    </c:when>
		    <c:otherwise>
		        <button onclick="location.href='list.bo?currentPage=${pi.currentPage-1}'">이전</button>
		    </c:otherwise>
		</c:choose>
		
		<!-- 다음버튼 -->
		<c:choose>
		    <c:when test="${pi.currentPage eq pi.maxPage}">
		        <button disabled>다음</button>
		    </c:when>
		    <c:otherwise>
		        <button onclick="location.href='list.bo?currentPage=${pi.currentPage+1}'">다음</button>
		    </c:otherwise>
		</c:choose>
		</div>
		<br>
		<br>
			
		</div>
	
	</body>
	</html>