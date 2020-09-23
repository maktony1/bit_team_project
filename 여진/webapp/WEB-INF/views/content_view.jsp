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

			<!-- 메인 컨텐츠  -->
			<div class="contentswrapper">
				<input type="hidden" name="bId" value="${content_view.bId}">
				<div id="leftbox">
					<!-- 사진들 -->
					<div class="photos">
						<c:forEach items="photo_list" var="photo">
						</c:forEach>
					</div>
					
					<p>제목</p>
					<p>조회수</p>
					<p>작성자id</p>
					<p>작성일</p>
					<p>내용</p>
					
					<!-- 세로 구분선 -->
					
					
					<!-- 댓글 출력 -->
					<div class="replys">
						<!-- 댓글 작성칸 -->
						<input type="text" placeholder="댓글을 입력하세요" name="reply">
						<button type="button" value="입력">
						<!-- 댓글 list -->
						댓글 list 출력
					</div>
				</div>
				
				<!-- 다른 게시글들을 출력함 -->
				<div id="other">
					searchResult.jsp 에 출력하던 것처럼 감싸기
				</div>
			</div>
	
</body>
</html>