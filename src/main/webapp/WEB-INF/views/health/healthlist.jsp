<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<table class="table">
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>요청수</th>
			<th>조회수</th>
			<th>작성일자</th>
			<th>매칭여부</th>
		</tr>
	<c:forEach items="${list }" var="dto">
		<tr>
			<td>${dto.healthseq}</td>

			<td><a href="">${dto.subject}</a></td>
			<td>${dto.requestcnt}</td>
			<td>${dto.viewcnt}</td>
			<td>${dto.regdate}</td>
			<td>${dto.matching }</td>
		</tr>
	</c:forEach>
</table>

<div>
	<button type="button" class="btn btn-default" style="float: right;"
		onclick="history.back();">돌아가기</button>
</div>
