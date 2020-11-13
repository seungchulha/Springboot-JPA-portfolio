<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp"%>

<div class="container">

    <button class="btn btn-secondary" onclick="history.back()">돌아가기</button>

    <!-- 글 을 적은 사람만 삭제 및 수정 할수 있도록 ... 그이외의 사람들에게는 수정, 삭제 버튼이 보이지 않도록 -->
    <c:if test="${board.user.id == principal.user.id}">
        <a href="/board/${board.id}/updateForm" class="btn btn-warning">Modify</a>
        <button id="btn-delete" class="btn btn-danger">Delete</button>
    </c:if>


    <br/><br/>

    <div>
        글번호 : <span id="id"><i>${board.id} </i></span>
        작성자 : <span><i>${board.user.username} </i></span>
    </div>

    <br/>

        <div>
            <h3>${board.title}</h3>
        </div>

        <hr>

        <div>
            <div>${board.content}</div>
        </div>

        <hr>

    <!-- 댓글 -->
    <div class="card">
        <form>
            <input type="hidden" id="boardId" value="${board.id}">
                <div class="card-body">
                    <textarea id="reply-content" class="form-control" name="" id="" rows="1"></textarea>
                </div>
                <div class="card-footer">
                    <button type="button" id="btn-reply-save" class="btn btn-primary">register</button>
                </div>
        </form>
    </div>
    <br>
    <div class="card">
        <div class="card-header">댓글 리스트</div>
        <ul id="reply--box" class="list-group">
            <c:forEach var="reply" items="${board.replys}">
                <li id="reply--1" class="list-group-item d-flex justify-content-between">
                    <div>${reply.content}</div>
                    <div class="d-flex">
                        <div class="font-italic">작성자 : ${reply.user.username} &nbsp;</div>
                        <button class="badge">delete</button>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

</div>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>

</body>
</html>


