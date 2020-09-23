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


<button type="button" id="writeBtn"> write </button>

<script type="text/javascript">
    $(document).ready(function(){
        $("#writeBtn").click(function(){
            location.href="${pageContext.request.contextPath}/write_form";
        })//click
    })//ready
</script>

</body>
</html>
