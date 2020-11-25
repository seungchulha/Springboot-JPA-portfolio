<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<style>
    .btn-social-login {
        transition: all .2s;
        outline: 0;
        border: 1px solid transparent;
        padding: .5rem !important;
        border-radius: 50%;
        color: #fff;
    }
    .btn-social-login:focus {
        box-shadow: 0 0 0 .2rem rgba(0,123,255,.25);
    }
    .text-dark { color: #343a40!important; }
</style>

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
            <div class="form-group">
                <button id="btn-login" class="btn btn-primary" style="width:250px;">Log In</button><br>
                <a href="https://kauth.kakao.com/oauth/authorize?client_id=02778e14d6fc171dcf7ffb9b3089baa7&redirect_uri=http://localhost:8000/auth/kakao/callback&response_type=code" class="btn-social-login" style='background:#FFEB00'><i class="xi-3x xi-kakaotalk text-dark"></i></a>
                <a href="/oauth2/authorization/google" class="btn-social-login" style='background:#D93025'><i class="xi-3x xi-google text-dark"></i></a>
                <a href="" class="btn-social-login" style='background:#1FC700'><i class="xi-3x xi-naver text-dark"></i></a>
            </div>
        </form>

</div>

<%--<script src="/js/user.js"></script>--%>
<!-- ../ 한칸위의 폴더로 올라간다 -->
<%@ include file="../layout/footer.jsp"%>

