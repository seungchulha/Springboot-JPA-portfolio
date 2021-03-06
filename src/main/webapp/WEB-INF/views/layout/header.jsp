<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Portfolio</title>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge, chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">

<%--    <link rel="stylesheet" href="https://demo.createx.studio/cartzilla/css/theme.min.css">--%>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body>
<div class="jumbotron text-center bg-light" style="margin-bottom:0">
    <a href="/" style="text-decoration: none; color: black;"><h1>Apex</h1></a>
</div>

<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
        <c:choose>
            <c:when test="${empty principal}">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/loginForm">Sign In</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/auth/joinForm">Sign Up</a>
                    </li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/news/globalIssue">Global</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/business">Business</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link" href="/stockmarket">Stock</a>

                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/board/list">Board</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/currencies">Currencies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/commodities">Commodities</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/tech">Tech</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/corona">Covid-19</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact">Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/chat/room?roomId=1">채팅</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/user/updateForm">회원정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/logout">로그아웃</a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>

    </div>
</nav>
<br/>

<script>
    $(function() {
        $('a[data-val]').on('click', function() {

        });
    });
</script>