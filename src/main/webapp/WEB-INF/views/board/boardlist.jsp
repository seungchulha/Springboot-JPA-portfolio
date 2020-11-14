<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp"%>

<div class="container">

    <div style="display: flex">
        <h1> Board </h1>
        <button class="btn btn-primary" onclick="window.location.href='/board/saveForm'">글쓰기</button>
    </div>
    <br>
    <c:forEach var="board" items="${boards.content}">
        <div class="card m-2">
            <div class="card-body">
                <h4 class="card-title">${board.title}</h4>
                <a href="/board/${board.id}" class="btn btn-primary">상세보기</a>
            </div>
        </div>
    </c:forEach>

    <ul class="pagination justify-content-center"> <!-- class 뒤에 한칸 띄고 justify-content-center 로하면 가운데로 온다 // 부트스트랩 용법-->
        <c:choose>
            <c:when test="${boards.first}">
                <li class="page-item disabled"><a class="page-link" href="/board/list?page=${boards.number-1}">Previous</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="/board/list?page=${boards.number-1}">Previous</a></li>
            </c:otherwise>
        </c:choose>



        <c:choose>
            <c:when test="${boards.last}">
                <li class="page-item disabled"><a class="page-link" href="/board/list?page=${boards.number+1}">Next</a></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="/board/list?page=${boards.number+1}">Next</a></li>
            </c:otherwise>
        </c:choose>
    </ul>
</div>

<%@ include file="../layout/footer.jsp"%>

</body>
</html>


