<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.image {
    width: 100%;
    height: 460px;
    background-repeat: no-repeat;
}
</style>
<!-- histoty Modal-->
<div class="modal-header">
	<h5 class="modal-title" id="historyModalLabel">요청서 상세보기</h5>
	<button class="close" type="button" data-dismiss="modal"
		aria-label="Close">
		<span>❌</span>
	</button>
</div>
<div class="modal-body">
	<div class="table-responsive">
		<div class="container"></div>
		<table class="table table-hover">
			<thead class="text-center">
				<tr class="content">
					<th class="text-center">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center">세부 카테고리</th>
					<th class="text-center">희망가격</th>
					<th class="text-center">매칭 여부</th>
				</tr>
				<tr class="content">
					<td class="text-center">${dto.subject }</td>
					<td class="text-center">${dto.content }</td>
					<td class="text-center">${dto.subcategory }</td>
					<td class="text-center">${dto.price }원</td>
					<td><c:if test="${dto.matching eq 'n' }"> 매칭 진행중 </c:if> <c:if
							test="${dto.matching eq 'y' }"> 매칭 완료 </c:if></td>
				</tr>
			</thead>

		</table>
		<c:if test="${not empty dto.img }">
		<div class="image" style="background-image: url(${dto.img});"></div>
		</c:if>
	</div>

</div>
<div class="modal-footer">
	<button class="btn btn-default" type="button" data-dismiss="modal"
		style="float: left;">닫기</button>
	<button class="btn btn-danger" type="button" data-dismiss="modal"
		id="btnDel" onclick="delReq('${dto.healthseq}')">요청 취소(삭제하기)</button>
</div>


<script>
	

	function delReq(healthseq) {
		if (confirm("정말 요청서를 삭제 하시겠습니까??") == true) { //확인
			location.href = '/helpme/health/healthdel.action?healthseq=' + healthseq
			//해당 글번호를 받아서 전달 
			
			alert('삭제 완료.');

		} else { //취소

			return false;

		}

	}
</script>



