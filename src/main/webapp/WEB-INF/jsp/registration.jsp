<%--<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>--%>

<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="utf-8">--%>
<%--  <title>Регистрация</title>--%>
<%--</head>--%>

<%--<body>--%>
<%--<div>--%>
<%--  <form:form method="POST" modelAttribute="userForm">--%>
<%--    <h2>Регистрация</h2>--%>
<%--    <div>--%>
<%--      <form:input type="text" path="username" placeholder="Username"--%>
<%--                  autofocus="true"></form:input>--%>
<%--      <form:errors path="username"></form:errors>--%>
<%--        ${usernameError}--%>
<%--    </div>--%>
<%--    <div>--%>
<%--      <form:input type="password" path="password" placeholder="Password"></form:input>--%>
<%--    </div>--%>
<%--    <div>--%>
<%--      <form:input type="password" path="passwordConfirm"--%>
<%--                  placeholder="Confirm your password"></form:input>--%>
<%--      <form:errors path="password"></form:errors>--%>
<%--        ${passwordError}--%>
<%--    </div>--%>
<%--    <button type="submit">Зарегистрироваться</button>--%>
<%--  </form:form>--%>
<%--  <a href="/">Главная</a>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Регистрация</title>
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
  <form:form method="POST" modelAttribute="userForm" class="form-signin">
    <h2 class="h3 mb-3 font-weight-normal">Регистрация</h2>
    <div class="form-floating mb-3">
      <form:input type="text" path="username" placeholder="Username" class="form-control" id="username" autofocus="true"/>
      <label for="username">Username</label>
      <form:errors path="username" class="text-danger"/>
      <c:out value="${usernameError}" escapeXml="true"/>
    </div>
    <div class="form-floating mb-3">
      <form:input type="password" path="password" placeholder="Password" class="form-control" id="password"/>
      <label for="password">Password</label>
    </div>
    <div class="form-floating mb-3">
      <form:input type="password" path="passwordConfirm" placeholder="Confirm your password" class="form-control" id="passwordConfirm"/>
      <label for="passwordConfirm">Confirm Password</label>
      <form:errors path="password" class="text-danger"/>
      <c:out value="${passwordError}" escapeXml="true"/>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Зарегистрироваться</button>
    <p class="mt-5 mb-3 text-muted">
      <a href="/">Главная</a>
    </p>
  </form:form>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
