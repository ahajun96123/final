<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<title>유니스트 익명 채팅</title>
<script>
    notice = true;
    broadcast = true;
    
    var log = function(s) {
        var contentsDiv = document.getElementById(broadcast ? "all_chat" : "oo_chat");
        s = s.replace(/\(lshift\)/g, "&lt");
        s = s.replace(/\(rshift\)/g, "&gt");
        var msg = s.split('|');
        
        if (document.body.scrollTop === 0)
            myHeight = document.body.scrollHeight;
        var canScroll = false;
        if (document.body.scrollTop === document.body.scrollHeight - myHeight)
            canScroll = true;
        
        switch (msg[0]) {
            case "0":
                if (notice)
                    contentsDiv.innerHTML += ("<li class='notice'>" + msg[1] + "</li>");
            break;
            case "1":
                contentsDiv.innerHTML += ("<li class='my'><b>" + msg[1] + "</b><br />" + msg[2] + "</li>");
                if (!canScroll)
                    document.body.scrollTop = document.body.scrollHeight;
            break;
            case "2":
                contentsDiv.innerHTML += ("<li class='other'><b>" + msg[1] + "</b><br />" + msg[2] + "</li>");
            break;
            case "3":
                contentsDiv.innerHTML += ("<li class='notice'>" + msg[1] + "</li>");
            break;
        }
        if (canScroll) {
            document.body.scrollTop = document.body.scrollHeight;
        }
    }
    log.buffer = [];
    
    var send = function(msg) {
        if (msg !== "") {
            w.send(msg);
            document.getElementById("inputMessage").value = "";
        }
    }
    url = "ws://192.168.0.146:8040/hpot/broadcasting";
    w = new WebSocket(url);
 
    w.onopen = function() {
        log("0|접속을 시도합니다..");
    }
 
    w.onmessage = function(e) {
        log(e.data);
    }
 
    w.onclose = function(e) {
        log("0|접속 종료");
    }
 
    window.onload = function() {
        log(log.buffer.join("\n"));
 
        document.getElementById("sendButton").onclick = function() {
            var value = document.getElementById("inputMessage").value;
            var contentsDiv = document.getElementById(broadcast ? "all_chat" : "oo_chat");
            if (value === "@알림") {
                notice = notice ? false : true;
                contentsDiv.innerHTML += ("<li class='notice'>알림이 " + (notice ? "켜" : "꺼") + "졌습니다</li>");
            } else if (value === "@청소" || value === "@ㅊㅅ") {
                contentsDiv.innerHTML = "";
            } else if (value === "@ㅇㅇ" || value === "@일대일" || value === "@1:1") {
                contentsDiv.innerHTML += ("<li class='notice'>상단의 1:1채팅 탭을 눌러주세요!</li>");
            } else {
                send(value);
            }
            document.getElementById("inputMessage").value = "";
        }
        
        document.getElementById("tab1").onclick = function() {
            broadcast = true;
            send("@다같이놀자");
        }
        
        document.getElementById("tab2").onclick = function() {
            broadcast = false;
            var contentsDiv = document.getElementById("oo_chat");
            contentsDiv.innerHTML = "";
            send("@둘이놀자");
        }
        
        document.getElementById("inputMessage").onkeypress = function() {
            //alert(event.keyCode);
            if (event.keyCode == '13') {
                var value = document.getElementById("inputMessage").value;
                var contentsDiv = document.getElementById(broadcast ? "all_chat" : "oo_chat");
                if (value === "@알림") {
                    notice = notice ? false : true;
                    contentsDiv.innerHTML += ("<li class='notice'>알림이 " + (notice ? "켜" : "꺼") + "졌습니다</li>");
                } else if (value === "@청소" || value === "@ㅊㅅ") {
                    contentsDiv.innerHTML = "";
                } else if (value === "@ㅇㅇ" || value === "@일대일" || value === "@1:1") {
                    contentsDiv.innerHTML += ("<li class='notice'>상단의 1:1채팅 탭을 눌러주세요!</li>");
                } else {
                    send(value);
                }
                document.getElementById("inputMessage").value = "";
            }
        }
    }
</script>

<div id="wrap">
    <body>
        <div id="css_tabs">
            <input id="tab1" type="radio" name="tab" checked="checked" />
            <input id="tab2" type="radio" name="tab" />
            <label for="tab1">전체 채팅방</label>
            <label for="tab2">1:1 채팅</label>
            <div class="tab1_content">
                <div id="all_chat" class="chat">
                </div>
            </div>
            <div class="tab2_content">
                <div id="oo_chat" class="chat">
                </div>
            </div>
        </div>
    </body>
    <footer class="footer">
        <div>
            <input type="text" class="inputs" placeholder="할 말을 입력하세요." id="inputMessage">
        </div>
        <div>
            <button id="sendButton">전송</button>
        </div>
    </footer>
</div>