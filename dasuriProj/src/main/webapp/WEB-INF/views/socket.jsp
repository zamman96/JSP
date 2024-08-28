<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Client</title>
    <style>
        #messages {
            border: 1px solid #ccc;
            height: 200px;
            overflow-y: scroll;
            margin-top: 10px;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1>Hello Client!</h1>
    <b>접속 상태 : </b><span id="socketStatus">연결 중</span><br/>
    
    <input type="text" id="sendMessage" placeholder="메시지를 입력하세요"/>
    <button onclick="send()">Send</button>
    
    <div id="messages"></div> <!-- 메시지 표시 영역 -->

    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        var socket = null;

        document.addEventListener("DOMContentLoaded", function(){
            var sock = new SockJS('/echo');
            socket = sock;

            sock.onopen = onOpen;
            sock.onmessage = onMessage; // 서버로부터 메시지를 수신
            sock.onclose = onClose;
        });

        function send() {
            var msg = document.getElementById("sendMessage").value;
            if (msg.trim() === "") return; // 빈 메시지 전송 방지
             socket.send("Client : "+msg); // 메시지를 서버로 전송
            // 클라이언트가 보낸 메시지를 표시
//             var messagesDiv = document.getElementById("messages");
//             messagesDiv.innerHTML += "<div>" + msg + " (" + getNowString() + ")</div>";
            messagesDiv.scrollTop = messagesDiv.scrollHeight; // 스크롤을 아래로
            document.getElementById("sendMessage").value = ""; // 입력 필드 초기화
        }

        function onMessage(evt) {
            var messagesDiv = document.getElementById("messages");
            messagesDiv.innerHTML += "<div>" + evt.data + " (" + getNowString() + ")</div>"; // 관리자가 보낸 메시지 표시
            messagesDiv.scrollTop = messagesDiv.scrollHeight; // 스크롤을 아래로
        }

        function onOpen() {
            document.getElementById("socketStatus").innerHTML = "접속 중";
        }

        function onClose() {
            document.getElementById("socketStatus").innerHTML = "접속 종료";
        }

        function getNowString() {
            var today = new Date();
            return today.toLocaleString(); // 날짜와 시간 포맷
        }
    </script>
</body>
</html>