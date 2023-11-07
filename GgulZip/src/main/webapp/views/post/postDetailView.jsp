<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .outer table{
   		border-color:black;
   		color : black;	
   	}
	 
	@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	
	@font-face {
	    font-family: 'GmarketSansMedium';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
	    font-weight: 700;
	    font-style: normal;
	}
	
	  table#detail-area th,
	  table#detail-area td {
	    padding: 5px 0; /* 위아래 여백을 조절하려면 해당 값을 조정하세요 */
	  }

	.btn {
		width : 80px;
		height : 40px;
	}
</style>
</head>
<body>
   <%@ include file="/views/common/menubar.jsp" %>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
   
   <div class="outer">
      <br><br>
      <h2 align="left" style = "margin-left:450px; font-size:24px; font-family:TheJamsil5Bold">${p.title }</h2>
      <br>
      <table id="detail-area" align="center" style="margin-left: 480px;">
         <tr>
            <th width="70">번호</th>
            <td width="10">${p.postNo }</td>
            <th width="100">카테고리</th>
            <td width="70">${p.categoryName }</td>
         </tr>
         <tr style="border-bottom: 1px solid black;">
            <th>작성자</th>
            <td width = "100">${p.nickname}</td>
            <th>조회수</th>
            <td>${p.count }</td>
            <th >작성일</th>
            <td width="200">${p.postDate}</td>
         </tr>
         <tr style="border-bottom: 1px solid black;">
            <th>내용</th>
            <td colspan="5">
               <p style="height:200px; white-space:pre;">${p.content}</p>  
            </td>
            <th>사진</th>
            <td colspan="5">
              <img src="${p.refBno}" alt="사진">
            </td>
         </tr>
         <tr style="border-bottom: 1px solid black;">
            <th width ="100">좋아요 <i class="bi bi-suit-heart-fill" style="color: rgb(241, 205, 27);"></i>&nbsp</th>
            <td>${p.likeCount}</td>
            <th width ="100">관심&nbsp<i class="bi bi-bookmark" style="color: rgb(241, 205, 27);"></i></th>
            <td>${p.interestCount}</td>
         </tr>
      </table>
      <br>
       
      <button class="btn" style = "background-color:rgb(241, 205, 27); margin-left : 950px"><i class="bi bi-heart-fill"></i></button>
      <button class="btn" style = "background-color:rgb(241, 205, 27)"><i class="bi bi-bookmarks-fill"></i></button>
      
      <br><br>
      
      
      <div id ="reply-area">
      	<table border = "1" align = "center">
      		<thead>
      			<tr>
      				<th>댓글작성</th>
      				<td>
      					<textarea id="commentContent" rows="3" cols="50"></textarea>
      				</td>
      				<td><button onclick = "insertComment();">댓글작성</button></td>
      			</tr>
      		</thead>
      		<tbody>
      			<tr>
      				<td>작성자</td>
      				<td>내용</td>
      				<td>작성일</td>
      			</tr>
      		</tbody>
      	</table>
      </div>
		
		<script>
		$(function(){
			selectCommentList();	
		});
		
			function selectCommentList(){  // 댓글목록 조회 함수
				$.ajax ({
					url:"commentList.po",
					data : {postNo : ${p.postNo}},
					success : function(result){
						
						var str = "";
						
						for(var i in result){
							str += "<tr>"
								+ "<td>" + result[i].content + "</td>"
								+ "<td>" + result[i].writerNo + "</td>"
								+ "<td>" + result[i].commentDate + "</td>"
								+ "</tr>";
						}
					$("#reply-area tbody").html(str);
					
					},
					error : function(){
						console.log("통신오류")
					}
				});
			}
		
			
			function insertComment(){
				
				$.ajax({
				    url: "insertComment.po",
				    data: {
				        content: $("#commentContent").val(),
				        postNo: ${p.postNo}
				    },
				    type: "post",
				    success: function (result) {
				        if (result > 0) {
				            alert("댓글 작성 성공");
				            // 추가된 댓글 목록 재조회 등 필요한 동작을 수행
				        	$("#CommentContent").val("");
				        } else {
				            console.log("댓글 작성 실패");
				        }
				    },
				    error: function () {
				        console.log("통신 오류");
				    }
				});
			}
		</script>

   </div>
</body>
</html>