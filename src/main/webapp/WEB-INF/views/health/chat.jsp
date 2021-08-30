<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/main.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/myapp.css" />

<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/cookie.js"></script>
<style>
body {
	font-size: 16px;
	position: static;
}

.container {
	width: 500px;
}

#chatbox {
	position: relative;
	left: -210px;
}

#list {
	height: 300px;
	padding: 15px;
	overflow: auto;
}

h2 span {
	color: tomato;
}

h2 {
	text-align: center;
}

#helperinfo {
	position: relative;
	top: -510px;
	right: -290px;
}
#box {
height: 550px;
}
</style>

</head>
<body onload="msg();">
	<!-- 채팅창  -->
	<div id="box">
		<div class="container" id="chatbox">
			<h2 class="page-header">
				<span>${dto.name }</span> 님과 대화가 시작됩니다!
			</h2>

			<table class="table table-bordered">
				<tr>
					<td><input type="text" name="user" id="user"
						class="form-control" value="${userid}"></td>
					<td>
						<button type="button" class="btn btn-default" id="btnConnect"
							onclick="msg();">연결</button>
						<button type="button" class="btn btn-default" id="btnDisconnect"
							disabled>종료</button>
					</td>
				</tr>
				<tr>
					<td colspan="2"><div id="list"></div></td>
				</tr>
				<tr>
					<td colspan="2"><input type="text" name="msg" id="msg"
						placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
				</tr>
			</table>

		</div>

		<!-- 헬퍼 정보 -->
		<div class="container" id="helperinfo">
			<div data-v-0338a199="" class="profile-section col-lg-auto col-12">
				<div data-v-1fd279b0="" data-v-0338a199="" class="profile-body">
					<div data-v-07a949b5="" data-v-1fd279b0="" class="profile-overview">
						<div data-v-07a949b5="" class="info">
							<h1 data-v-07a949b5="" style="color: tomato;">${dto.name }</h1>
						</div>
					</div>
					<!---->
					<section data-v-1fd279b0="" id="about">
						<div data-v-55cc549a="" data-v-1fd279b0=""
							class="profile-introduce sticky-nav">
							<h2 data-v-55cc549a="">카테고리</h2>
							<div data-v-55cc549a="" class="introduce">
								<div data-v-62bd56ac="" data-v-55cc549a=""
									class="collapsed-text-line">
									<div data-v-62bd56ac="" class="wrapper" style="">
										<p data-v-62bd56ac="">${dto.category }</p>
									</div>
								</div>
							</div>
						</div>
						<div data-v-55cc549a="" data-v-1fd279b0=""
							class="profile-introduce sticky-nav">
							<h2 data-v-55cc549a="">한줄소개</h2>
							<div data-v-55cc549a="" class="introduce">
								<div data-v-62bd56ac="" data-v-55cc549a=""
									class="collapsed-text-line">
									<div data-v-62bd56ac="" class="wrapper" style="">
										<p data-v-62bd56ac="">DH Kim 고수의 사진 편집·보정, 스냅 촬영, 개인용 사진
											촬영, 영상 편집, 기업/상업용 영상 촬영, 개인용 영상 촬영, 기업/상업용 사진 촬영 서비스</p>
									</div>
								</div>
							</div>
						</div>
						<div data-v-30e22708="" data-v-1fd279b0=""
							class="profile-service-desc">
							<h2 data-v-30e22708="">연락처</h2>
							<div data-v-62bd56ac="" data-v-30e22708=""
								class="collapsed-text-line">
								<div data-v-62bd56ac="" class="wrapper" style="">
									<p data-v-62bd56ac="">${dto.tel }</p>
								</div>

							</div>
						</div>
						<div data-v-30e22708="" data-v-1fd279b0=""
							class="profile-service-desc">
							<h2 data-v-30e22708="">이메일</h2>
							<div data-v-62bd56ac="" data-v-30e22708=""
								class="collapsed-text-line">
								<div data-v-62bd56ac="" class="wrapper" style="">
									<p data-v-62bd56ac="">${dto.email }</p>
								</div>

							</div>
						</div>
					</section>
				</div>
			</div>
		</div>

	</div>
			<button type="button" class="btn btn-default" onclick="history.back()">목록으로 돌아가기</button>
			<button type="button"  style="float: right;" class="btn btn-primary"
			onclick="location.href='/helpme/health/main.action'">메인 화면으로 가기</button>

</body>


<script>
	//채팅 서버 주소
	let url = "ws://localhost:8030/helpme/health/chatserver";

	//웹소켓
	let ws;

	//연결하기
	/* $('#btnConnect').click(function() { */

	function msg() {
		//유저명 확인
		if ($('#user').val().trim() != '') {

			//연결
			ws = new WebSocket(url);

			//소켓 이벤트 매핑
			ws.onopen = function(evt) {
				//console.log('서버 연결 성공');
				print($('#user').val(), '입장했습니다.');

				//현재 사용자가 입장했다고 서버에게 통지(유저명 전달)
				// > 1#유저명
				ws.send('1#' + $('#user').val() + '#');

				$('#user').attr('readonly', true);
				$('#btnConnect').attr('disabled', true);
				$('#btnDisconnect').attr('disabled', false);
				$('#msg').attr('disabled', false);
				$('#msg').focus();
			};

			ws.onmessage = function(evt) {

				//print('', evt.data);
				console.log(evt.data);

				let index = evt.data.indexOf("#", 2);
				let no = evt.data.substring(0, 1);
				let user = evt.data.substring(2, index);
				let txt = evt.data.substring(index + 1);

				if (no == '1') {
					print2(user);
				} else if (no == '2') {
					print(user, txt);
				} else if (no == '3') {
					print3(user);
				}

				$('#list').scrollTop($('#list').prop('scrollHeight'));

			};

			ws.onclose = function(evt) {
				console.log('소켓이 닫힙니다.');
			};

			ws.onerror = function(evt) {
				console.log(evt.data);
			};

		} else {
			alert('유저명을 입력하세요.');
			$('#user').focus();
		}

	};

	function print(user, txt) {
		let temp = '';
		temp += '<div style="margin-bottom:3px;">';
		temp += '[' + user + '] ';
		temp += txt;
		temp += ' <span style="font-size:11px;color:#777;">'
				+ new Date().toLocaleTimeString() + '</span>';
		temp += '</div>';

		$('#list').append(temp);
	}

	function print2(user) {
		let temp = '';
		temp += '<div style="margin-bottom:3px;">';
		temp += "'" + user + "' 이(가) 접속했습니다.";
		temp += ' <span style="font-size:11px;color:#777;">'
				+ new Date().toLocaleTimeString() + '</span>';
		temp += '</div>';

		$('#list').append(temp);
	}

	function print3(user) {
		let temp = '';
		temp += '<div style="margin-bottom:3px;">';
		temp += "'" + user + "' 이(가) 종료했습니다.";
		temp += ' <span style="font-size:11px;color:#777;">'
				+ new Date().toLocaleTimeString() + '</span>';
		temp += '</div>';

		$('#list').append(temp);
	}

	//print('길동', '안녕하세요.');

	$('#user').keydown(function() {
		if (event.keyCode == 13) {
			$('#btnConnect').click();
		}
	});

	$('#msg').keydown(function() {
		if (event.keyCode == 13) {

			//서버에게 메시지 전달
			//2#유저명#메시지
			ws.send('2#' + $('#user').val() + '#' + $(this).val()); //서버에게
			print($('#user').val(), $(this).val()); //본인 대화창에

			$('#msg').val('');
			$('#msg').focus();

		}
	});

	$('#btnDisconnect').click(function() {
		ws.send('3#' + $('#user').val() + '#');
		ws.close();

		$('#user').attr('readonly', false);
		$('#user').val('');

		$('#btnConnect').attr('disabled', false);
		$('#btnDisconnect').attr('disabled', true);

		$('#msg').val('');
		$('#msg').attr('disabled', true);
	});
</script>

</html>












