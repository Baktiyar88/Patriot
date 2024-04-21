
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Log in with your account</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <style>
    .form-signin {
      width: 100%;
      max-width: 330px;
      padding: 15px;
      margin: auto;
    }
    .form-signin .form-floating:focus-within {
      z-index: 2;
    }
    .form-signin input[type="text"] {
      margin-bottom: -1px;
      border-bottom-right-radius: 0;
      border-bottom-left-radius: 0;
    }
    .form-signin input[type="password"] {
      margin-bottom: 10px;
      border-top-left-radius: 0;
      border-top-right-radius: 0;
    }
  </style>
</head>

<body class="text-center">
<div class="container d-flex align-items-center justify-content-center" style="height: 100vh;">
  <sec:authorize access="isAuthenticated()">
    <% response.sendRedirect("/"); %>
  </sec:authorize>
  <div class="form-signin">
    <form method="POST" action="/login">
      <h2 class="h3 mb-3 font-weight-normal">Вход в систему</h2>
      <div class="form-floating mb-3">
        <input name="username" id="username" type="text" placeholder="Username" class="form-control" autofocus="true"/>
        <label for="username">Username</label>
      </div>
      <div class="form-floating mb-3">
        <input name="password" id="password" type="password" placeholder="Password" class="form-control"/>
        <label for="password">Password</label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Log In</button>
      <h4 class="mt-3"><a href="/registration">Зарегистрироваться</a></h4>
    </form>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
