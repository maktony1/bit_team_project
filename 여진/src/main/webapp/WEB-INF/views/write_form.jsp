<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<form enctype="multipart/form-data" action="${pageContext.request.contextPath }/write_form" method="post">  
        <div class="row"> 
            <div class="col-md-6"> 
            <div class="form-group"> 
            <label for="writer">작성자</label> 
            <input type="text" class="form-control" name="writer" id="writer" value="${sessionScope.memberVO.memberName }" readonly> 
            </div> 
            </div>
            <input type="hidden" id="id" name="id" value="${sessionScope.memberVO.id }">
        </div> 
        
        <div class="form-group" style="margin-right: 70px"> 
        <label for="title">글제목</label> 
        <input type="text" class="form-control" name ="title" id="title" value="" required="required"> 
        </div> 
        
        <div class="form-group" style="margin-right: 70px"> 
        <label for="content">글내용</label> 
        <textarea class="form-control" rows="10" name="content" id="content" required="required"></textarea> 
        </div>
        
 
        <div class="form-group"> 
        <label for="File">첨부파일 1</label> 
        <input type="file" name="file[0]"> 
        </div> 
        <div class="form-group"> 
        <label for="File">첨부파일 2</label> 
        <input type="file" name="file[1]"> 
        </div> 
        <div class="form-group"> 
        <label for="File">첨부파일 3</label> 
        <input type="file" name="file[2]"> 
        </div> 
        
        <div class="center-block" style='width:400px' align="center"> 
        <input type="submit" class="btn btn-info" value="등록하기" style="background-color: #2dcb73">&nbsp;&nbsp;
        <input type="reset" class="btn btn-info"  value="다시쓰기" style="background-color: #2dcb73">&nbsp;&nbsp;
        <input type="button" class="btn btn-info"  value="취소" id="cancelBtn" style="background-color: #2dcb73">
        </div>
</form> 

</body>
</html>
