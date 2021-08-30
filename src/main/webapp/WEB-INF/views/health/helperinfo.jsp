<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.image {
	width: 200px;
	height: 200px;
	background-repeat: no-repeat;
	background-size: contain;
}

.emoji {
	font-size: 20px;
	margin-right: 5px;
	cursor: pointer;
}

h2 {
	text-align: center;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- histoty Modal-->
<div class="modal-header">
	<h5 class="modal-title" id="historyModalLabel">헬퍼 정보 상세보기</h5>
	<button class="close" type="button" data-dismiss="modal"
		aria-label="Close">
		<span>❌</span>
	</button>
</div>
<div class="modal-body">
	<div class="table-responsive">
		<div class="container"></div>
		<table class="table table-hover" id="tbl">
			<thead class="text-center">
				<tr class="content">
					<th class="text-center" style="width: 130px;">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center" style="width: 110px;">세부 카테고리</th>
					<th class="text-center" style="width: 110px;">희망가격(원)</th>
					<th class="text-center" style="width: 100px;">희망 날짜</th>
				</tr>
				<tr class="content">
					<td class="text-center">${dto.id }</td>
					<td class="text-center">${dto.name }</td>
					<td class="text-center">${dto.subcategory }</td>
					<td class="text-center">${dto.tel }</td>
					<td class="text-center">${dto.email }</td>
				</tr>
			</thead>

		</table>
		
	</div>

</div>

<div class="modal-footer">
	<button class="btn btn-default" type="button" data-dismiss="modal"
		style="float: left;"
		onclick="location.href='/helpme/health/healthlist.action'">닫기</button>


</div>



<script>
	
</script>



