<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Image Filter</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
        canvas {
            border : black 1px solid;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <canvas id="canvas" width="400" height="400"></canvas>
    <input id="loadButton" type="file" accept="image/*">
    
    <button id="filterButton1">Filter1</button>
    <button id="filterButton2">Filter2</button>
    <button id="filterButton3">Filter3</button>
    <button id="filterButton4">Filter4</button>
    <button id="save">save</button>
	<script src="filter.js"></script>
</body>

<a href="URL" onclick="window.open(this.href, '_blank', 'width=가로사이즈px,height=세로사이즈px,toolbars=no,scrollbars=no'); return false;">완전 간단하게 팝업 띄우기!!</a>

</html>