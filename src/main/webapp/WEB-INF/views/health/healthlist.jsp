<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.modal-content {
	position: relative;
	top: 210px;
	width: 925px;
	left: -164px;
	height: 900px;
}
</style>

<table class="table">
	<tr>
		<th>No</th>
		<th>제목</th>
		<th>요청수</th>
		<th>조회수</th>
		<th>세부 카테고리</th>
		<th>작성일자</th>
		<th>매칭여부</th>
	</tr>
	<c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.healthseq}</td>

			<td><a href="">${dto.subject}</a></td>
			<td>${dto.requestcnt}</td>
			<td>${dto.viewcnt}</td>
			<td>${dto.subcategory}</td>
			<td>${dto.regdate}</td>
			<td>
			<c:if test="${dto.matching eq 'n' }"> 매칭 진행중 </c:if>
			<c:if test="${dto.matching eq 'y' }"> 매칭 완료 </c:if>
			</td>
		</tr>
	</c:forEach>
</table>

<!-- Moa Modal Button -->
<a onclick="fnModuleInfo()"> 12312312312 </a>

<!-- Moa Modal-->
<div class="modal fade" id="MoaModal" tabindex="-1" role="dialog"
	aria-labelledby="historyModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-xl" role="document"
		style="position: static;">
		<div class="modal-content"></div>
	</div>
</div>


<div>

	<button type="button" class="btn btn-default" style="float: right;"
		onclick="history.back();">돌아가기</button>
</div>




<script>
	/*모달*/
	function fnModuleInfo() {
		$('#MoaModal .modal-content').load("/helpme/health/healthview.action");
		$('#MoaModal').modal();

	}
</script>