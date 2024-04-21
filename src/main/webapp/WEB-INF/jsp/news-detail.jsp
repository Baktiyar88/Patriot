<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>Детали новости</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .comment-section {
            margin-top: 40px;
        }
        .comment {
            background-color: #f9f9f9;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 5px;
        }
        .comment-author {
            font-weight: bold;
        }
        .comment-content, .comment-date {
            margin-top: 5px;
        }
        .add-comment-section {
            margin-top: 50px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Главная</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/news">Новости</a>
            </li>
        </ul>
        <sec:authorize access="isAuthenticated()">
            <span class="navbar-text mr-2">
                Добро пожаловать, <sec:authentication property="name"/>!
            </span>
            <a class="btn btn-danger" href="/logout" role="button">Выйти</a>
        </sec:authorize>
        <sec:authorize access="!isAuthenticated()">
            <a class="btn btn-success" href="/login" role="button">Войти</a>
        </sec:authorize>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-3">${news.title}</h2>
    <p>${news.content}</p>
    <p><small>Дата публикации: ${news.postDate}</small></p>

    <div class="comment-section">
        <h3>Комментарии</h3>
        <c:if test="${not empty comments}">
            <div>
                <c:forEach var="comment" items="${comments}">
                    <div class="comment">
                        <strong>${comment.user.username}:</strong> ${comment.content}
                        <br>
                        <small>добавлен ${comment.commentDate}</small>
                        <!-- Delete Button -->
                        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                            <form action="${pageContext.request.contextPath}/admin/comments/delete/${comment.id}" method="post">
                                <input type="hidden" name="_method" value="delete" />
                                <button type="submit" class="btn btn-danger btn-sm">Удалить</button>
                            </form>
                        </sec:authorize>
                    </div>
                </c:forEach>
            </div>
        </c:if>
    </div>

    <sec:authorize access="isAuthenticated()">
        <div class="add-comment-section">
            <h3>Добавить комментарий</h3>
            <form:form action="${pageContext.request.contextPath}/news/${news.id}/comment" modelAttribute="comment" method="post" class="form-group">
                <textarea name="content" rows="3" cols="30" class="form-control mb-3"></textarea><br>
                <input type="submit" value="Отправить" class="btn btn-primary">
            </form:form>
        </div>
    </sec:authorize>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
