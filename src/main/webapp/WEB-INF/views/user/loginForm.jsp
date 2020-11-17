<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp"%>

<div class="container">
        <form action="/auth/loginProc" method="post">
            <div class="form-group">
                <label for="username">User Name:</label>
                <input type="text" class="form-control" placeholder="Enter username" id="username" name="username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" placeholder="Enter password" id="password" name="password">
            </div>
            <div class="justify-">
                <button id="btn-login" class="btn btn-primary" style="width:250px;">Log In</button><br>
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=02778e14d6fc171dcf7ffb9b3089baa7&redirect_uri=http://localhost:8000/auth/kakao/callback&response_type=code"><img height="38px" width="250px" src="/image/kakao_login.jpg" alt=""></a>
<%--                <a href="/oauth2/authorization/google">구글로그인</a>--%>
            </div>
        </form>

</div>

<%--<script src="/js/user.js"></script>--%>
<!-- ../ 한칸위의 폴더로 올라간다 -->
<%@ include file="../layout/footer.jsp"%>
