<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%@include file="../common/menubar.jsp"%>
	<div align="center">
		<h4>정지회원 관리</h4>
	</div>
	<br>
	<br>
	<div>
		<div>
			<div>
				<div>
					<form action="${contextPath}/updateDisable.ad" method="post">
						<table class="table">
							<thead>
								<tr style="text-align: center;">
									<th>회원 아이디</th>
									<th>회원 이름</th>
									<th>이메일</th>
									<th>가입일</th>
									<th>정지사유</th>
									<th> </th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty dlist}">
										<tr>
											<td colspan='5' align='center'><h5>목록이 없습니다.</h5></td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach items="${dlist}" var="d">
											<input type="hidden" name="memberNo2" value="${d.memberNo}">
											<tr style="text-align: center">
												<td>${d.memberId}</td>
												<td>${d.memberName}</td>
												<td>${d.email}</td>
												<td>${d.enrolldate}</td>
												<td><input type="text" name="reason2"
													value="${d.reason}" placeholder="정지사유 입력"></td>
												<td><button type="submit">수정</button></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>