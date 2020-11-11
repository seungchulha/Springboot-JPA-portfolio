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

</div>

<script src="/js/board.js"></script>
<%@ include file="../layout/footer.jsp"%>

</body>
</html>

