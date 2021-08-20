<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도와줘 헬퍼</title>
<tiles:insertAttribute name="asset" />

<style>
.img-header {
	background-image: url(https://dmmj3ljielax6.cloudfront.net/upload/requestForm/df092d5a-88e2-4549-9565-e9de88d6d62e.jpg);
	margin-top: 100px;
	object-fit: cover;
	width: 100vw;
	height: 370px;
	overflow: hidden;
}

.img-header h1 {
	color: white;
	padding: 150px;
}

#searchbox {
	/* position: relative; */
	width: 350px;
	height: 40px;
	border-radius: 5px;
}

#search {
	position: relative;
	left: 195px;
	top: -250px;
}

#searchbtn {
	position: relative;
	left: -4px;
	height: 38px;
	background-color: #01c7ae;
    color: white;
    border-color: #252121;
}
</style>
</head>
<body>
	<div class="img-header">

		<h1>건강/미용</h1>



	</div>



	<tiles:insertAttribute name="header" />
	<section class="main-section" style="position: static;">
		<div id="search">
			<input type="text" id="searchbox" placeholder="어떤 분야의 전문가를 찾으시나요?">
			<span> <button type="button" class="btn btn-default"
				 id="searchbtn">
				 <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyMCIgaGVpZ2h0PSIyMCIgdmlld0JveD0iMCAwIDIwIDIwIj4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPHBhdGggZmlsbD0iI0Q4RDhEOCIgZmlsbC1vcGFjaXR5PSIwIiBkPSJNMCAwaDE4djE4SDB6Ii8+CiAgICAgICAgPHBhdGggZmlsbD0iI0ZGRkZGRiIgZD0iTTE0Ljk0NCAxMy44ODdsNC44MzcgNC44MzhhLjc0Ny43NDcgMCAxIDEtMS4wNTYgMS4wNTZsLTQuODM4LTQuODM3YTguNDU4IDguNDU4IDAgMSAxIDEuMDU3LTEuMDU3em0tMS41MDUtLjU2M2E2Ljk2NCA2Ljk2NCAwIDEgMC0uMTE0LjExNC43NTUuNzU1IDAgMCAxIC4xMTQtLjExNHoiLz4KICAgIDwvZz4KPC9zdmc+Cg==" class="search-icon" data-v-d914393c="">
				 고수 찾기
				 </button>
			</span>
		</div>
		<tiles:insertAttribute name="content" />
		<hr>
		<tiles:insertAttribute name="inner" />
	</section>

	<tiles:insertAttribute name="footer" />
</body>
</html>
