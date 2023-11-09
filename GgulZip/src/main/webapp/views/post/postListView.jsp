<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	  .rectangle {
	            width:100%;
	            height: 0.5px;
	           	background-color : black;
	        }
		      
		        
		.list-area > tbody tr:hover {
	        	background-color : rgb(255, 225, 77);
	        	cursor : pointer;
	       }

	
		@font-face {
			    font-family: 'SEBANG_Gothic_Bold';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
			    font-family: 'GmarketSansMedium';
		    	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}	    
	
	   .list-area {
        text-align: center; /* 테이블 셀 내용 가운데 정렬 */
        border-collapse: none; /* 테이블 셀 경계선 따로 그리기 */
	    }
	
	    .list-area th, .list-area td {
	        padding: 5.4px; /* 셀 내용과 경계선 사이 여백 추가 */
	    }
	
		.list-area, .list-area th, .list-area td {
		    border: none; /* 테이블 셀 경계선 모두 제거 */
		}
		
		.list-area tr {
			border-bottom : 1px solid lightgray;
		}
		
		.list-area th {
	        background-color : rgb(241, 205, 27);
		}
		
		footer{
		    border-top: 1px solid #e4e4e4;
		    background-color:#f8f9fa;
		    padding:1rem 0;
		    margin:1rem 0;
		}
		
		
		.footer-message{
		    font-weight: bold;
		    font-size:0.9rem;
		    color:#545e6f;
		    margin:0 0 0 0.6rem;
		}
		.footer-contact{
		    font-size:0.9rem;
		    color:#545e6f;
		    margin:0.6rem;
		}
		.footer-copyright{
		    font-size:0.9rem;
		    color:#545e6f;
		    margin:0.6rem;
		}	
		 footer {
        background-color: rgb(171, 171, 171);
        padding: 1rem 0;
        margin: 0;
	    }
	
	    /* 다음은 여백을 없애기 위한 추가 스타일입니다. */
	    body {
	        margin-bottom: 0;
	    }	
		
		.search_area {
	text-align: center;
	padding: 30px;
}

.search_area select {
	width: 150px;
	height: 30px;
	border: 0px;
}

.input_area {
	border: solid 1px #dadada;
	padding: 10px 10px 14px 10px;
	margin-right: 20px;
	background: white;
}

.input_area input {
	width: 250px;
	height: 30px;
	border: 0px;
}

.input_area input:focus, .search_area select:focus {
	outline: none;
}

.search_area button {
	width: 100px;
	height: 35px;
	border: 0px;
	color: white;
	background: #282A35;
	margin: 5px;
}
	 
	</style>
	
</head>
<body>
	<%@include file="/views/common/menubar.jsp" %>
	<!-- 상위폴더로 -->


	<div class="outer">
		<br><br>
		<div>
		    <h5 align="left" style="font-size: 28px; color: rgb(241, 205, 27); font-family: SEBANG_Gothic_Bold; display: inline-block; margin-left : 350px">
		        자유게시판
		    </h5>
		    <a href="insert.bo" class="btn btn-outline-warning" style="display: inline-block; margin-left: 800px;">글작성</a>
		</div>
		<br>
		
		<table class="list-area" align="center" border = "1">
			<thead style=" color: black; height:45px ;font-family: GmarketSansMedium; font-size : 17px">
				<tr>
					<th width="70">글번호</th>
					<th width="80">카테고리</th>
					<th width="250">제목</th>
					<th width="350">내용</th>
					<th width="60">조회수</th>
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
					    <td>${p.categoryName }</td>
					    <td style="font-weight: bold;">${p.title}</td>
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
			<div align="center">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <button disabled>이전</button>
                            </c:when>
                            <c:otherwise>
                                <button onclick="location.href='list.bo?currentPage=${pi.currentPage-1}'">이전</button>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
                            <button onclick="location.href='list.bo?currentPage=${i}'">${i}</button>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <button disabled>다음</button>
                            </c:when>
                            <c:otherwise>
                                <button onclick="location.href='list.bo?currentPage=${pi.currentPage+1}'">다음</button>
                            </c:otherwise>
                        </c:choose>
			</div>
			<br><br><br>
		</div>
		<div class="search_area">
			<form method="get" action="${contextPath }/pSearch.bo"> 
				<select id="searchCondition" name="searchCondition">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="nickname">닉네임</option>
					<option value="titlecontent">제목+내용</option>
				</select> <span class="input_area"> <input type="search" id="searchValue"
					name="searchValue">
				</span>
				<button type="submit">검색하기</button>
			</form>
		</div>
		
	   <footer style="background-color:rgb(230, 230, 230)">
		  <div class="inner">
		  	<nav>
			  	<a href = '' target = '_blank' style = "margin-left:10px">Blog</a> |
				<a href = 'https://github.com/ggasin/GgulZip' target = '_blank'>Github</a>
		  	</nav>
		    <div class="footer-message">GGZIP</div>
		    <div class="footer-contact">주소 : 서울특별시 영등포구 선유동2로 57 이레빌딩 지번 서울특별시 영등포구 양평동4가 2</div>
		    <div class="footer-contact">Contact : ggzip@fun-coding.org</div>
		    <div class="footer-copyright" style = "margin-top :-10px">Copyright 2020 All ⓒ rights reserved</div>
		  </div>
		</footer>
</body>


</html>
