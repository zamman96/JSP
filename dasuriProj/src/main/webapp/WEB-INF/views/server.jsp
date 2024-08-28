<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
    <style>
        #messages {
            border: 1px solid #ccc;
            height: 200px;
            overflow-y: scroll;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>Hello Admin</h1>
    <b>접속 상태 : </b><span id="socketStatus">연결 중</span><br/>
    
    <input type="text" id="sendMessage" placeholder="메시지를 입력하세요"/>
    <button onclick="send()">Send</button>
    
    <div id="messages"></div> <!-- Container for displaying messages -->

    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script>
        var socket = null;

        document.addEventListener("DOMContentLoaded", function(){
            // 웹소켓 연결
            var sock = new SockJS("/echo");
            socket = sock;

            sock.onopen = onOpen;
            sock.onmessage = onMessage;
            sock.onclose = onClose;
        });

        function send() {
            var msg = document.getElementById("sendMessage").value;
            if (msg.trim() === "") return; // 빈 메시지 전송 방지
            socket.send("Admin : "+msg); // 메시지를 서버로 전송
            // 클라이언트가 보낸 메시지를 표시
//             var messagesDiv = document.getElementById("messages");
//             messagesDiv.innerHTML += "<div>" + msg + " (" + getNowString() + ")</div>";
            messagesDiv.scrollTop = messagesDiv.scrollHeight; // 스크롤을 아래로
            document.getElementById("sendMessage").value = ""; // 입력 필드 초기화
        }

        function onMessage(evt) {
            var messagesDiv = document.getElementById("messages");
            messagesDiv.innerHTML += "<div>" + evt.data + " (" + getNowString() + ")</div>"; // Display received message
            messagesDiv.scrollTop = messagesDiv.scrollHeight; // Scroll to the bottom
        }

        function onOpen() {
            document.getElementById("socketStatus").innerHTML = "접속 중";
        }
        
        function onClose() {
            document.getElementById("socketStatus").innerHTML = "접속 종료";
        }

        function getNowString() {
            var today = new Date();   
            return today.toLocaleString(); // Format date and time nicely
        }
    </script>
</body>
</html>