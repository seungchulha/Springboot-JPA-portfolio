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
            <button id="btn-login" class="btn btn-primary">Log In</button>
        </form>

</div>

<%--<script src="/js/user.js"></script>--%>
<!-- ../ 한칸위의 폴더로 올라간다 -->
<%@ include file="../layout/footer.jsp"%>
