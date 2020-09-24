<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="search-again">
	<form action="${pageContext.request.contextPath}/search">
		<input type="text" name="searchWord" id="search" value="${searchWord}">
		<button type="submit">search</button>
	</form>
</div>
<hr/>

			<!-- 메인 컨텐츠  -->
			<div class="contentswrapper">
				<input type="hidden" name="board_count" value="${content_view.board_count}">
				<div id="leftbox" style="float:left">
					<!-- 사진들 -->
					<div class="photos">
						<c:forEach items="photo_list" var="photo">
						</c:forEach>
					</div>
					
					<p>${content_view.title}</p>
					<p>${content_view.member_id}</p>
					<p>${content_view.dates}</p>
					<p>${content_view.hit}</p>
					<p>${content_view.contents}</p>
				</div>
					<!-- 중간 구분선 -->		
			 		<div style="width:5%; height:650px; border-left:3px solid purple;position: absolute;left: 50%;margin-left: -3px;">
					</div>

				<!-- 댓글 출력 -->
				<div id="rightbox"style="float:right">				
					<div>
						<!-- 댓글 작성칸 -->
						<input type="text" placeholder="댓글을 입력하세요" name="reply"/>
						<button type="button" value="입력">댓글작성</button>
						<!-- 댓글 list -->
						댓글 list 출력
					</div>
				</div>
				
			</div>
			
<%-- 			<!-- 아래쪽에 다른 게시글들을 출력함 -->
		<div id="other" style="float:bottom">
			<table border="1">
					<tr>
						<td>주소</td>
						<td>x좌표</td>
						<td>y좌표</td>
					</tr>
					<c:forEach items="${boardlist}" var="vo">
					<tr>
						<td class="location">${vo.address}</td>
						<td class="lat">${vo.lat}</td>
						<td class="lng">${vo.lng}</td>
					</tr>
					</c:forEach>
			</table>
		</div> --%>
	
</body>
</html>