<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- =========================================main에서 가져옴================================================= -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css?ver=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- Our Custom CSS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- ========================================================================================== -->
<meta charset="UTF-8">
<title>허니팟 채팅방</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body style="background-color: #dcdcdc">
	<div class="container">
		<%@include file="./topui.jsp"%>
		<div style="width: 1920px; height: 1080px;">
			<div style="width: 260px; height: 100%; float: left;">
				<%@include file="./sidebar.jsp"%>
			</div>
			<div style="height: 50px;">
				<h4><i class="fa fa-comments"></i> 실시간 채팅</h4>
			</div>
			<fieldset>
				<div id="container">
					<textarea class="form-control form-rounded" id="messageWindow"
						style="width: 800px" rows="30" cols="100" readonly="true"></textarea>
					<div class="selfbtn" style="width: 800px;">
						<button id="newMessage" class="btn btn-secondary"
							style="width: 100%; display: none;" onclick="showNM()"></button>
					</div>
					<div class="input-group" style="width: 800px">
						<input type="text" class="form-control" id="inputMessage">
						<button class="btn btn-dark" type="submit" onclick="send()">send</button>
					</div>
				</div>
			</fieldset>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {

		$("#sendBtn").click(function() {

			sendMessage();

			$('#message').val('')

		});

		$("#inputMessage").keydown(function(key) {
			if (key.keyCode == 13) {// 엔터
				send();
				$('#inputMessage').val('')
			}
		});
	});
</script>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket("ws://192.168.0.146:8040/hpot/broadcasting");
	var inputMessage = document.getElementById("inputMessage");
	var elem = document.getElementById('messageWindow');
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event);
	};
	webSocket.onmessage = function(event) {
		onMessage(event);
	};
	function onMessage(event) {
		var top = elem.scrollTop;
		var height = elem.scrollHeight;
		console.log(top);
		console.log(height);
		if (height != 444 && (top + 444 != height)) {
			console.log("오긴온다");
			var messageBlock = document.getElementById('newMessage');
			$('#newMessage').html(event.data);
			messageBlock.style.display = "block";
		}
		if (top + 444 == height) {
			textarea.value += event.data + "\n";
			elem.scrollTop = elem.scrollHeight;
		} else {
			textarea.value += event.data + "\n";
		}
	}
	function showNM() {
		document.getElementById('newMessage').style.display = "none";
		elem.scrollTop = elem.scrollHeight;
	}
	function onOpen(event) {
		textarea.value += "연결 성공\n";
		webSocket.send("'${sessionScope.id}'님이 입장하셨습니다.qsd");
	}
	function onError(event) {
		alert(event.data);
	}
	function send() {
		if (inputMessage.value == "") {
		} else {
			var massage = "${sessionScope.id} : " + inputMessage.value;
			textarea.value += "나 : " + inputMessage.value + "\n";
			webSocket.send(massage);
			inputMessage.value = "";
			var elem = document.getElementById('messageWindow');
			elem.scrollTop = elem.scrollHeight;
		}
	}
	window.setInterval(function() {
		if (elem.scrollTop + 444 == elem.scrollHeight) {
			document.getElementById('newMessage').style.display = "none";
		}
	}, 0);
	//     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
	/* window.setInterval(function() {
		var elem = document.getElementById('messageWindow');
		elem.scrollTop = elem.scrollHeight;
	}, 0); */
</script>
</html>