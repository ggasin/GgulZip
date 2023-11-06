<%@page import="com.gz.admin.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String alertMsg = (String)session.getAttribute("alertMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/style.css" rel="stylesheet" type="text/css">

<link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet" type="text/css">
<link href="resources/boxicons/css/boxicons.min.css" rel="stylesheet"
	type="text/css">
<link href="resources/quill/quill.snow.css" rel="stylesheet"
	type="text/css">
<link href="resources/quill/quill.bubble.css" rel="stylesheet"
	type="text/css">
<link href="resources/remixicon/remixicon.css" rel="stylesheet"
	type="text/css">
<link href="resources/simple-datatables/style.css" rel="stylesheet"
	type="text/css">



<title>Insert title here</title>

</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<!-- ======= Header ======= -->
	<header id="header" class="header fixed-top d-flex align-items-center">

		<div class="d-flex align-items-center justify-content-between">
			<a href="index.html" class="logo d-flex align-items-center"> <img
				src="assets/img/logo.png" alt=""> <span
				class="d-none d-lg-block">NiceAdmin</span>
			</a> <i class="bi bi-list toggle-sidebar-btn"></i>
		</div>
		<!-- End Logo -->

		<div class="search-bar">
			<form class="search-form d-flex align-items-center" method="POST"
				action="#">
				<input type="text" name="query" placeholder="Search"
					title="Enter search keyword">
				<button type="submit" title="Search">
					<i class="bi bi-search"></i>
				</button>
			</form>
		</div>
		<!-- End Search Bar -->

		<nav class="header-nav ms-auto">
			<ul class="d-flex align-items-center">

				<li class="nav-item d-block d-lg-none"><a
					class="nav-link nav-icon search-bar-toggle " href="#"> <i
						class="bi bi-search"></i>
				</a></li>
				<!-- End Search Icon-->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i class="bi bi-bell"></i>
						<span class="badge bg-primary badge-number">4</span>
				</a> <!-- End Notification Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
						<li class="dropdown-header">You have 4 new notifications <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-exclamation-circle text-warning"></i>
							<div>
								<h4>Lorem Ipsum</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>30 min. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-x-circle text-danger"></i>
							<div>
								<h4>Atque rerum nesciunt</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>1 hr. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-check-circle text-success"></i>
							<div>
								<h4>Sit rerum fuga</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>2 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="notification-item"><i
							class="bi bi-info-circle text-primary"></i>
							<div>
								<h4>Dicta reprehenderit</h4>
								<p>Quae dolorem earum veritatis oditseno</p>
								<p>4 hrs. ago</p>
							</div></li>

						<li>
							<hr class="dropdown-divider">
						</li>
						<li class="dropdown-footer"><a href="#">Show all
								notifications</a></li>

					</ul> <!-- End Notification Dropdown Items --></li>
				<!-- End Notification Nav -->

				<li class="nav-item dropdown"><a class="nav-link nav-icon"
					href="#" data-bs-toggle="dropdown"> <i
						class="bi bi-chat-left-text"></i> <span
						class="badge bg-success badge-number">3</span>
				</a> <!-- End Messages Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow messages">
						<li class="dropdown-header">You have 3 new messages <a
							href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View
									all</span></a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-1.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Maria Hudson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>4 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-2.jpg" alt="" class="rounded-circle">
								<div>
									<h4>Anna Nelson</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>6 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="message-item"><a href="#"> <img
								src="assets/img/messages-3.jpg" alt="" class="rounded-circle">
								<div>
									<h4>David Muldon</h4>
									<p>Velit asperiores et ducimus soluta repudiandae labore
										officia est ut...</p>
									<p>8 hrs. ago</p>
								</div>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li class="dropdown-footer"><a href="#">Show all messages</a>
						</li>

					</ul> <!-- End Messages Dropdown Items --></li>
				<!-- End Messages Nav -->

				<li class="nav-item dropdown pe-3"><a
					class="nav-link nav-profile d-flex align-items-center pe-0"
					href="#" data-bs-toggle="dropdown"> <img
						src="assets/img/profile-img.jpg" alt="Profile"
						class="rounded-circle"> <span
						class="d-none d-md-block dropdown-toggle ps-2">K. Anderson</span>
				</a> <!-- End Profile Iamge Icon -->

					<ul
						class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
						<li class="dropdown-header">
							<h6>Kevin Anderson</h6> <span>Web Designer</span>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-person"></i> <span>My
									Profile</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="users-profile.html"> <i class="bi bi-gear"></i> <span>Account
									Settings</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="pages-faq.html"> <i class="bi bi-question-circle"></i>
								<span>Need Help?</span>
						</a></li>
						<li>
							<hr class="dropdown-divider">
						</li>

						<li><a class="dropdown-item d-flex align-items-center"
							href="#"> <i class="bi bi-box-arrow-right"></i> <span>Sign
									Out</span>
						</a></li>

					</ul> <!-- End Profile Dropdown Items --></li>
				<!-- End Profile Nav -->

			</ul>
		</nav>
		<!-- End Icons Navigation -->

	</header>
	<!-- End Header -->

	<!-- ======= Sidebar ======= -->
	<aside id="sidebar" class="sidebar">

		<ul class="sidebar-nav" id="sidebar-nav">

			<li class="nav-item"><a class="nav-link " href="index.html">
					<i class="bi bi-grid"></i> <span>카테고리관리</span>
			</a></li>
			<!-- End Dashboard Nav -->

			<li class="nav-item">
				<ul id="components-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="components-alerts.html"> <i
							class="bi bi-circle"></i><span>Alerts</span>
					</a></li>
					<li><a href="components-accordion.html"> <i
							class="bi bi-circle"></i><span>Accordion</span>
					</a></li>

				</ul>
			</li>
			<!-- End Components Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-journal-text"></i><span></span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="forms-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="forms-elements.html"> <i class="bi bi-circle"></i><span>Form
								Elements</span>
					</a></li>
					<li><a href="forms-layouts.html"> <i class="bi bi-circle"></i><span>Form
								Layouts</span>
					</a></li>

				</ul></li>
			<!-- End Forms Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-layout-text-window-reverse"></i><span>Tables</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="tables-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="tables-general.html"> <i class="bi bi-circle"></i><span>General
								Tables</span>
					</a></li>
					<li><a href="tables-data.html"> <i class="bi bi-circle"></i><span>Data
								Tables</span>
					</a></li>
				</ul></li>
			<!-- End Tables Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#">
					<i class="bi bi-gem"></i><span>Icons</span><i
					class="bi bi-chevron-down ms-auto"></i>
			</a>
				<ul id="icons-nav" class="nav-content collapse "
					data-bs-parent="#sidebar-nav">
					<li><a href="icons-bootstrap.html"> <i
							class="bi bi-circle"></i><span>Bootstrap Icons</span>
					</a></li>
					<li><a href="icons-remix.html"> <i class="bi bi-circle"></i><span>Remix
								Icons</span>
					</a></li>
					<li><a href="icons-boxicons.html"> <i class="bi bi-circle"></i><span>Boxicons</span>
					</a></li>
				</ul></li>
			<!-- End Icons Nav -->

			<li class="nav-heading">Pages</li>



			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-login.html"> <i class="bi bi-box-arrow-in-right"></i>
					<span>Login</span>
			</a></li>
			<!-- End Login Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-error-404.html"> <i class="bi bi-dash-circle"></i> <span>Error
						404</span>
			</a></li>
			<!-- End Error 404 Page Nav -->

			<li class="nav-item"><a class="nav-link collapsed"
				href="pages-blank.html"> <i class="bi bi-file-earmark"></i> <span>Blank</span>
			</a></li>
			<!-- End Blank Page Nav -->

		</ul>

	</aside>
	<!-- End Sidebar-->

	<main id="main" class="main">

		<div class="pagetitle">
			<h1>카테고리 관리</h1>
			<nav></nav>
		</div>
		<!-- End Page Title -->
		<div class="row">
			<!-- Left side columns -->
			<div class="col-lg-8">
				<div class="row"></div>
				<div class="card recent-sales overflow-auto">
					<div class="card-body">
						<table class="table table-borderless datatable">
							<thead>
							
								<tr style="text-align: center;">
									<th scope="col">카테고리 번호</th>
									<th scope="col">카테고리 이름</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty clist}">
										<tr>
											<td colspan='2'>카테고리 목록이 없습니다.</td>
										</tr>
									</c:when>
								</c:choose>
								<c:forEach items="${clist}" var="c">
									<tr style="text-align: center">
										<td><input type="text" name="no2" value="${c.categoryNo}" style="width:50px;text-align:center;" readonly></td>
										<td><input type="text" name="name2" value="${c.categoryName}" style="width:130px;text-align:center;"></td>
										<td>
											<input type="button" onclick="updateCategory(this);" value="수정">
											</td> 
										<td><input type="button" onclick="deleteCategory(this);" value="삭제"></td>
									</tr>
								</c:forEach>
							</tbody>
								<form action="../${contextPath}/insertCategory.ad" method="post">
									<tr style="text-align: center;">
										<td><input type="text" name="no"  placeholder="No" style="width:50px;text-align:center;"></td>
										<td><input type="text" name="name" placeholder="카테고리 이름" style="width:130px;text-align:center;"></td>
										<td><button type="submit">추가</button></td>
									</tr>
								</form>	
						</table>
						<script>
							//카테고리 수정 function
							function updateCategory(uCategory){
								var updateNo = $(uCategory).parent().siblings().eq(0).children().val();
								var updateName = $(uCategory).parent().siblings().eq(1).children().val();
								
								let f = document.createElement('form');
								
								let obj;
								obj = document.createElement('input');
								obj.setAttribute('type','hidden');
								obj.setAttribute('name','no2');
								obj.setAttribute('value',updateNo);
								
								let obj2;
								obj2 = document.createElement('input');
								obj2.setAttribute('type','hidden');
								obj2.setAttribute('name','name2');
								obj2.setAttribute('value',updateName);
								
								f.appendChild(obj);
								f.appendChild(obj2);
								f.setAttribute('method','post');
								f.setAttribute('action','updateCategory.ad');
								document.body.appendChild(f);
								f.submit();
							}
							
							//카테고리 삭제 function
							function deleteCategory(dCategory){
								var deleteNo = $(dCategory).parent().siblings().eq(0).children().val();
								var deleteName = $(dCategory).parent().siblings().eq(1).children().val();
								
								let f = document.createElement('form');
								
								let obj;
								obj = document.createElement('input');
								obj.setAttribute('type','hidden');
								obj.setAttribute('name','no2');
								obj.setAttribute('value',deleteNo);
								
								let obj2;
								obj2 = document.createElement('input');
								obj2.setAttribute('type','hidden');
								obj2.setAttribute('name','name2');
								obj2.setAttribute('value',deleteName);
								
								f.appendChild(obj);
								f.appendChild(obj2);
								f.setAttribute('method','post');
								f.setAttribute('action','deleteCategory.ad');
								document.body.appendChild(f);
								f.submit();															
							}
						</script>
					</div>
				</div>
			</div>
		</div>
	</main>
</body>
</html>
