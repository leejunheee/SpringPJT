<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.image {
    width: 100%;
    height: 460px;
    background-repeat: no-repeat;
}
.emoji {
font-size: 20px;
margin-right: 5px;
cursor: pointer;
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
		<table class="table table-hover" id="tbl">
			<thead class="text-center">
				<tr class="content">
					<th class="text-center" style="width: 130px;">제목</th>
					<th class="text-center">내용</th>
					<th class="text-center" style="width: 110px;">세부 카테고리</th>
					<th class="text-center" style="width: 90px;">희망가격(원)</th>
					<th class="text-center" style="width: 100px;">매칭 여부</th>
					<th class="text-center" style="width: 65px;">수정</th>
				</tr>
				<tr class="content" >
					<td class="text-center">${dto.subject }</td>
					<td class="text-center">${dto.content }</td>
					<td class="text-center">${dto.subcategory }</td>
					<td class="text-center">${dto.price }</td>
					<td><c:if test="${dto.matching eq 'n' }"> 매칭 진행중 </c:if> <c:if
							test="${dto.matching eq 'y' }"> 매칭 완료 </c:if></td>
					<td class="text-center"><span class="emoji" title="edit" onclick="edit('${dto.healthseq}');">🛠</span></td>
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
	
	<button class="btn btn-primary" type="button" data-dismiss="modal"
		id="btnApply" onclick="location.href='/helpme/health/healthapply.action?healthseq=' +${dto.healthseq} ">신청서 작성(헬퍼용)</button>
	<button class="btn btn-danger" type="button" data-dismiss="modal"
		id="btnDel" onclick="delReq('${dto.healthseq}')">요청 취소(삭제하기)</button>
</div>


<script>
	
	
	// 요청서 삭제 
	function delReq(healthseq) {
		if (confirm("정말 요청서를 삭제 하시겠습니까??") == true) { //확인
			location.href = '/helpme/health/healthdel.action?healthseq=' + healthseq
			//해당 글번호를 받아서 전달 
			alert('삭제 완료.');
		} else { //취소
			return false;
		}
	}; 
	
	//요청서 수정 
	function edit(healthseq) {
	
		let tr = $(event.srcElement).parent().parent();
		
		let subject = tr.children().eq(0).text();
		tr.children().eq(0).html('');
		tr.children().eq(0).append('<input type="text" class="form-control" id="usubject" value ="' + subject +'">');
		
		let content = tr.children().eq(1).text();
		tr.children().eq(1).html('');
		tr.children().eq(1).append('<input type="text" class="form-control" id="ucontent" value ="' + content +'">');
		
	
		let price = tr.children().eq(3).text();
		tr.children().eq(3).html('');
		tr.children().eq(3).append('<input type="text" class="form-control" id="uprice" value ="' + price +'">');
		
		temp = tr.children().eq(5).html();
		td = tr.children().eq(5).html('');
		
		tr.children().eq(5).append(' <span style="cursor:pointer;" onclick="editok(' + healthseq +');">⭕️</span> ');
		tr.children().eq(5).append(' <span style="cursor:pointer;" onclick="restore();">❌</span> ');
		
	}
	
	function restore() {
		td.html('');
		td.html(temp);
		
		td.parent().children().eq(0).text($('#usubject').val());
		td.parent().children().eq(1).text($('#ucontent').val());
		td.parent().children().eq(3).text($('#uprice').val());
		
	}
	
	function editok(healthseq) {
		$.ajax({
			type: 'POST',
			url : '/helpme/health/healthedit.action',
			data : 'subject=' + $('#usubject').val() + '&content=' + $('#ucontent').val() + '&price=' + $('#uprice').val() + '&healthseq=' + healthseq,
			dataType : 'json',
			success: function(result) {
				if(result == 1) {
					restore();
				}
			},
			error : function(a,b,c) {
				console.log(a,b,c);
			}
		})
	}
	
</script>



