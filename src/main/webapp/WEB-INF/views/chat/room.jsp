
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Chatting Room</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        var Chat__roomId = parseInt('${param.roomId}');
    </script>

    <script>
        //폼이 발송되기 전에 한번씩 실행
        //즉 엔터 한번 칠때마다 실행
        function Chat__addMessage(writer, body){
            $.post(
                './doAddMessage',
                {
                    roomId:Chat__roomId,
                    writer:writer,
                    body:body
                },
                function(data){

                },
                'json'
            );
        }

        function Chat__drawMessage(chatMessage){
            var html = chatMessage.writer + ' : ' + chatMessage.body;
            $('.chat-messages').append('<div>' + html + '</div>');
        }

        var Chat__lastLoadMessageId = 0;
        //주기적 실행
        function Chat__loadNewMessages(){
            $.get(
                './getMessagesFrom',
                {
                    roomId:Chat__roomId,
                    from:Chat__lastLoadMessageId + 1
                },
                function(data){
                    for(var i = 0; i<data.messages.length; i++){
                        Chat__drawMessage(data.messages[i]);

                        Chat__lastLoadMessageId = data.messages[i].id;
                    }
                },
                'json'
            );
        }

        setInterval(Chat__loadNewMessages, 1000);

        function submitChatMessageForm(form){
            form.writer.value=form.writer.value.trim();
            if(form.writer.value.length == 0){
                alert('작성자를 입력해주세요.');
                form.writer.focus();

                return false;
            }

            if(form.body.value.length == 0){
                alert('내용을 입력해주세요.');
                form.body.focus();

                return false;
            }

            var writer = form.writer.value;
            var body = form.body.value;

            form.body.value = '';
            form.body.focus();

            Chat__addMessage(writer, body);
        }
    </script>
</head>
<body>

<%@ include file="../layout/header.jsp"%>

<div class="container">
    <div class="card">
        <div class="card-header">
            <h1>${param.roomId}번방</h1>
        </div>
        <div class="card-body">
            <div class="chat-messages" style="height: 500px; overflow-y: scroll;"></div>
        </div>
        <div class="card-footer">
            <form onsubmit="submitChatMessageForm(this); return false;" style="display: flex; height: 20px; width:100%;">
                <div>
                    <input autocomplete="off" type="hidden" name="writer" value="${principal.user.username}" readonly>
                </div>&nbsp;&nbsp;
                <div style="width: 90%; margin-right: 30px; margin-top: 5px;">
                    <input autocomplete="off" type="text" name="body" placeholder="내용" style="width: 100%;">
                </div>&nbsp;&nbsp;
                <div>
                    <input type="submit" class="btn btn-primary" value="작성">
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../layout/footer.jsp"%>
</body>
</html>
