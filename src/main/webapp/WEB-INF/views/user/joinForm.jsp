<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="../layout/header.jsp"%>

<div class="container">
        <form>
            <div class="form-group">
                <label for="username">User Name : </label>
                <input type="text" class="form-control" placeholder="Enter email" id="username">
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control" placeholder="Enter password" id="password">
            </div>

            <div class="form-group">
                <label for="email">Email address:</label>
                <input type="email" class="form-control" placeholder="Enter email" id="email">
            </div>

            <div class="form-group">
                <label for="phone">Phone :</label>
                <input type="text" class="form-control" placeholder="Enter phone number" id="phone">
            </div>
        </form>
        <button id="btn-save" class="btn btn-primary">Submit</button>
</div>

<!-- /라고 하면 바로 static 폴더를 찾아간다-->
<script src="/js/user.js"></script>
<!-- ../ 한칸위의 폴더로 올라간다 -->
<%@ include file="../layout/footer.jsp"%>


