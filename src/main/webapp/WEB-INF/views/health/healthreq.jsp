<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>



.container {
	max-width: 600px;
	margin: 0 auto;
	padding: 0 1rem;
}

/* Button */
[type=submit] {
	display: inline-block;
	vertical-align: middle;
	white-space: nowrap;
	cursor: pointer;
	margin: .25rem 0;
	padding: .5rem 1rem;
	border: 1px solid #01c7ae;
	border-radius: 6px;
	background: #01c7ae;
	color: white;
	font-weight: 600;
	text-decoration: none;
	font-family: sans-serif;
	font-size: .95rem;
	height: 35px;
	
}

#subcategory{
    height: 36px;
    width: 155px;
}
</style>



<form method="POST" action="/spring/addok.memo">
	<table class="table table-bordered">
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" class="form-control"
				autocomplete="off" required></td>
			<th>하위카테고리</th>
			<td><select id="subcategory">
					<option value="hair">헤어</option>
					<option value="pt">퍼스널트레이닝</option>
					<option value="psytest">심리검사</option>
					<option value="nail">네일</option>
					<option value="adultcounseling">성인상담</option>
					<option value="pilates">필라테스</option>
			</select></td>
		</tr>
		<tr>
			<th>메모</th>
			<td><input type="text" name="memo" class="form-control" required></td>
		</tr>
		<tr>
			<th>분류</th>
			<td><input type="text" name="category" class="form-control"
				required></td>
		</tr>

	</table>

	<div>
		<button type="submit" class="btn btn-default" style="font-size: 13px;">요청서 제출</button>
		<button type="button" class="btn btn-default" style="float: right;"
			onclick="location.href='/spring/list.memo';" >돌아가기</button>
	</div>

</form>