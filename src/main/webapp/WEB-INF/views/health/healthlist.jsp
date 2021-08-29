<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.modal-content {
	position: relative;
	top: 210px;
	width: 925px;
	left: -164px;
	height: 850px;
}

.table{
border-bottom: 1px #ddd solid;
}
</style>

<table class="table">
	<tr>
		<th>No</th>
		<th>제목</th>
		<th>요청수</th>
		<th>조회수</th>
		<th>세부 카테고리</th>
		<th>지역</th>
		<th>매칭여부</th>
		<th>작성일자</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.healthseq}</td>

			<td>
			<a onclick="fnModuleInfo('${dto.healthseq}')" style="cursor:pointer;" title="상세보기" >
			${dto.subject}
			<c:if test="${not empty dto.img }">
				📷
			</c:if>
			
			</a>
			</td>
			<td >${dto.requestcnt}</td>
			<td>${dto.viewcnt}</td>
			<td>${dto.subcategory}</td>
			<td>${dto.address}</td>
			<td>
			<c:if test="${dto.matching eq 'n' }"> 진행중 </c:if>
			<c:if test="${dto.matching eq 'y' }"> 완료 </c:if>
			</td>
			<td style="font-size: 12px;">${dto.regdate}</td>
		</tr>
	</c:forEach>
</table>
<div>

	<button type="button" class="btn btn-default" style="float: right;"
		onclick="location.href='/helpme/health/main.action';">돌아가기</button>
</div>


<!-- Moa Modal Button -->
<!-- <a onclick="fnModuleInfo()">  </a> -->

<!-- Moa Modal-->
<div class="modal fade" id="MoaModal" tabindex="-1" role="dialog"
	aria-labelledby="historyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document"
		style="position: static;">
		<div class="modal-content"></div>
	</div>
</div>

<br><br><br><br>




<script>
	/*모달*/
	function fnModuleInfo(seq) {
		$('#MoaModal .modal-content').load("/helpme/health/healthview.action?healthseq=" + seq);
		$('#MoaModal').modal();

	}
</script>