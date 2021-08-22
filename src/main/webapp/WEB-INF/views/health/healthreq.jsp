<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
[type=text], [type=email], [type=url], select, textarea {
	display: block;
	padding: .5rem;
	background: transparent;
	vertical-align: middle;
	width: 100%;
	max-width: 100%;
	border: 1px solid #cdcdcd;
	border-radius: 4px;
	font-size: .95rem;
}

[type=text]:focus, [type=email]:focus, [type=url]:focus, select:focus,
	textarea:focus {
	outline: none;
	border: 1px solid #1E6BD6;
}

select {
	-webkit-appearance: none;
	-moz-appearance: none;
	background:
		url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABIAAAAJCAYAAAA/33wPAAAAvklEQVQoFY2QMQqEMBBFv7ERa/EMXkGw11K8QbDXzuN4BHv7QO6ifUgj7v4UAdlVM8Uwf+b9YZJISnlqrfEUZVlinucnBGKaJgghbiHOyLyFKIoCbdvecpyReYvo/Ma2bajrGtbaC58kCdZ1RZ7nl/4/4d5EsO/7nzl7IUtodBexMMagaRrs+06JLMvcNWmaOv2W/C/TMAyD58dxROgSmvxFFMdxoOs6lliWBXEcuzokXRbRoJRyvqqqQvye+QDMDz1D6yuj9wAAAABJRU5ErkJggg==)
		100% no-repeat;
	line-height: 2
}

label {
	font-weight: 600;
	font-size: .9rem;
	display: block;
	margin: .5rem 0;
}

/* Other */
* {
	box-sizing: border-box;
}

html {
	-webkit-font-smoothing: antialiased;
	padding: 1rem;
}

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
}



</style>

<div class="container">
	<form>
		<label for="name">Name</label>
		 <input type="text" id="name"placeholder="Name"> 
		 <label for="email">Email</label>
		  <input type="email" id="email" placeholder="Email Address"> 
		  <label for="gender">하위 카테고리</label> 
		 	 <select id="gender">
				<option value="male">헤어</option>
				<option value="female">퍼스널트레이닝</option>
				<option value="female">심리검사</option>
				<option value="female">네일</option>
				<option value="female">성인상담</option>
				<option value="female">필라테스</option>
			</select> <label for="message">Message</label>
		<textarea id="message" cols="30" rows="10" placeholder="Message"></textarea>
		<input type="submit" value="Submit">
	</form>
</div>