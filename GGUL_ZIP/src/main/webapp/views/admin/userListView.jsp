<%@page import="com.gz.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

  
  <link href="resources/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" type="text/css">
  <link href="resources/boxicons/css/boxicons.min.css" rel="stylesheet" type="text/css">
  <link href="resources/quill/quill.snow.css" rel="stylesheet" type="text/css">
  <link href="resources/quill/quill.bubble.css" rel="stylesheet" type="text/css">
  <link href="resources/remixicon/remixicon.css" rel="stylesheet" type="text/css">
  <link href="resources/simple-datatables/style.css" rel="stylesheet" type="text/css">



<title>Insert title here</title>

</head>
<body>
	<%@include file="../common/menubar.jsp" %>
  <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">NiceAdmin</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->
    <nav class="header-nav ms-auto">
  </header><!-- End Header -->

  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="index.html">
          <i class="bi bi-grid"></i>
          <span>관리자 메뉴</span>
        </a>
      </li><!-- End Dashboard Nav --> []

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
        <li>
          <i class="bi bi-menu-button-wide">
          	<a href="${contextPath}/category.ad"><span>카테고리 수정</span></a>
          </i>
          </li>
          <i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>Alerts</span>
            </a>
          </li>
          <li>
            <a href="components-accordion.html">
              <i class="bi bi-circle"></i><span>Accordion</span>
            </a>
          </li>
          
        </ul>
      </li><!-- End Components Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i><span></span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
      </li><!-- End Forms Nav -->
    </ul>

  </aside><!-- End Sidebar-->

  <main id="main" class="main">

    <div class="pagetitle">
      <h1>회원정보 관리</h1>
    </div><!-- End Page Title -->
      <div class="row">
        <!-- Left side columns -->
        <div class="col-lg-8">
          </div>
            <div class="col-12">
              <div class="card recent-sales overflow-auto">
                <div class="card-body">
							<table class="table table-borderless datatable">
								<thead>
									<tr style="text-align: center;">
										<th scope="col" width="60px">번호</th>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">닉네임</th>
										<th scope="col">이메일</th>
										<th scope="col">회원<br>등급</th>
										<th scope="col">가입일</th>
										<th scope="col">계정<br>상태</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${empty list}">
											<tr>
												<td colspan='9' align="center">사용자가 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${list}" var="m">
												<tr style="text-align: center;">
													<td>${m.memberNo}</td>
													<td>${m.memberId}</td>
													<td>${m.memberName}</td>
													<td>${m.nickname}</td>
													<td>${m.email}</td>
													<td><select id="grade" name="grade">
															<option>${m.grade}</option>
															<option>
																<c:choose>
																	<c:when test="${m.grade == '관리자'}">일반회원</c:when>
																	<c:otherwise>관리자</c:otherwise>
																</c:choose>
															</option>
													</select></td>
													<td>${m.enrolldate}</td>
													<td><select id="status" name="status">
															<option>${m.status}</option>
															<option>
																<c:choose>
																	<c:when test="${m.status == 'Y'}">N</c:when>
																	<c:otherwise>Y</c:otherwise>
																</c:choose>
															</option>
													</select></td>
													<td><input type="button" value="수정" onclick="updateAdmin(this);"></td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- 수정 스크립트 -->
							<script>
								function updateAdmin(upAdmin){
									console.log($(upAdmin).closest('tr').find('td:first-child').text());
									console.log($(upAdmin).closest('tr').find("#grade option:selected").val());
									console.log($(upAdmin).closest('tr').find("#status option:selected").val());
									
									var updateNo = $(upAdmin).closest('tr').find('td:first-child').text(); //memberNo
									var updateGrade = $(upAdmin).closest('tr').find("#grade option:selected").val(); //grade select 박스
									var updateStatus = $(upAdmin).closest('tr').find("#status option:selected").val(); //status select 박스
									
									let f = document.createElement('form');
									
									let updateNo1;
									updateNo1 = document.createElement('input');
									updateNo1.setAttribute('type','hidden');
									updateNo1.setAttribute('name','memberNo');
									updateNo1.setAttribute('value',updateNo);
									
									let updateGrade2;
									updateGrade2 = document.createElement('input');
									updateGrade2.setAttribute('type','hidden');
									updateGrade2.setAttribute('name','grade');
									updateGrade2.setAttribute('value',updateGrade);

									let updateStatus3;
									updateStatus3 = document.createElement('input');
									updateStatus3.setAttribute('type','hidden');
									updateStatus3.setAttribute('name','status');
									updateStatus3.setAttribute('value',updateStatus);
									
									f.appendChild(updateNo1);
									f.appendChild(updateGrade2);
									f.appendChild(updateStatus3);
									f.setAttribute('method','post');
									f.setAttribute('action','update.ad');
									document.body.appendChild(f);
									f.submit();
										
								}
								
							</script>
							
					<!-- 페이징바 -->
                    <div align="center">
                    	<c:choose>
                    		<c:when test="${pi.currentPage eq 1}">
                    			<button disabled>이전</button>
                    		</c:when>
                    		<c:otherwise>
                    			<button onclick="location.href='selectUser.ad?currentPage=${pi.currentPage-1}'">이전</button>
                    		</c:otherwise>
                    	</c:choose>
                    	<c:forEach var="i" begin="${pi.startPage}" end ="${pi.endPage}">
                    		<button onclick="location.href='selectUser.ad?currentPage=${i}'">${i}</button>
                    	</c:forEach>
                    	<c:choose>
                    		<c:when test="${pi.currentPage eq pi.maxPage}">
                    			<button disabled>다음</button>
                    		</c:when>
                    		<c:otherwise>
                    			<button onclick="location.href='selectUser.ad?currentPage=${pi.currentPage+1}'">다음</button>
                    		</c:otherwise>
                    	</c:choose>
                    </div>
                </div>
              </div>
            </div><!-- End Recent Sales -->
          </div>
        <!-- Right side columns -->
        <div class="col-lg-4"></div>
</body>
</html>
