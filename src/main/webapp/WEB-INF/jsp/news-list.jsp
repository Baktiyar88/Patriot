<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Список новостей</title>--%>
<%--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">--%>
<%--    <style>--%>

<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<nav class="navbar navbar-expand-lg navbar-dark bg-dark">--%>
<%--    <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="Логотип" height="50">--%>

<%--    <a class="navbar-brand" href="/">  Главная--%>
<%--    </a>--%>
<%--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">--%>
<%--        <span class="navbar-toggler-icon"></span>--%>
<%--    </button>--%>

<%--                <div class="navbar-collapse collapse show" id="navbarNav" style="">--%>
<%--                    <ul class="navbar-nav mr-auto">--%>

<%--                        <li class="nav-item active">--%>
<%--                            <a class="nav-link" href="/news">Новости</a>--%>
<%--                         </li>--%>


<%--                        </ul>--%>

<%--                    <span class="navbar-text mr-2">--%>
<%--                    Добро пожаловать, Testt!--%>
<%--      </span>--%>
<%--                    <a class="btn btn-danger" href="/logout" role="button">Выйти</a>--%>


<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>
<%--</nav>--%>

<%--<div class="container">--%>
<%--    <h2 class="text-center mb-5">Список новостей</h2>--%>

<%--    <div class="row">--%>
<%--        <c:forEach var="news" items="${newsList}">--%>
<%--            <div class="col-md-4 mb-4">--%>
<%--                <div class="card news-card">--%>
<%--                    <!-- Обновленный код для отображения изображений -->--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${not empty news.imagePath}">--%>
<%--                            <img src="${pageContext.request.contextPath}/uploads/${news.imagePath}" class="card-img-top" alt="${news.title}">--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Placeholder">--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title">${news.title}</h5>--%>
<%--                        <p class="card-text">${news.content}</p>--%>
<%--                        <a href="/news/${news.id}" class="btn btn-primary">Подробнее</a>--%>
<%--                        <c:if test="${isAdmin}">--%>
<%--                            <form action="${pageContext.request.contextPath}/news/${news.id}/delete" method="post" class="d-inline">--%>
<%--                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--                                <input type="submit" value="Удалить" class="btn btn-danger btn-sm btn-delete">--%>
<%--                            </form>--%>
<%--                        </c:if>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </c:forEach>--%>
<%--    </div>--%>

<%--    <!-- Форма для добавления новостей с изображением -->--%>
<%--    <c:if test="${isAdmin}">--%>
<%--        <div class="mt-5">--%>
<%--            <h3>Добавить новость</h3>--%>
<%--            <form action="${pageContext.request.contextPath}/news/add" method="post" enctype="multipart/form-data">--%>
<%--                Заголовок: <input type="text" name="title" class="form-control mb-2">--%>
<%--                Содержание:<br>--%>
<%--                <textarea name="content" rows="5" cols="30" class="form-control mb-2"></textarea><br>--%>
<%--                Категория:--%>
<%--                <select name="categoryId" class="form-control mb-2">--%>
<%--                    <c:forEach items="${categories}" var="category">--%>
<%--                        <option value="${category.id}">${category.name}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--                Изображение: <input type="file" name="image" class="form-control mb-2"><br>--%>
<%--                <input type="submit" value="Добавить" class="btn btn-success">--%>
<%--            </form>--%>

<%--        </div>--%>
<%--    </c:if>--%>

<%--</div>--%>

<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>--%>
<%--<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>--%>
<%--<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <title>Список новостей</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <img src="${pageContext.request.contextPath}/resources/images/logo.jpg" alt="Логотип" height="50">
    <a class="navbar-brand" href="/">Главная</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse show" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/news">Новости</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Категории
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                    <c:forEach items="${categories}" var="category">
                        <a class="dropdown-item" href="${pageContext.request.contextPath}/news/category/${category.id}">${category.name}</a>
                    </c:forEach>
                </div>
            </li>
        </ul>
        <span class="navbar-text mr-2">
            Добро пожаловать, Testt!
        </span>
        <a class="btn btn-danger" href="/logout" role="button">Выйти</a>
    </div>
</nav>

<div class="container">
    <h2 class="text-center mb-5">Список новостей</h2>
    <div class="row">
        <c:forEach var="news" items="${newsList}">
            <div class="col-md-4 mb-4">
                <div class="card news-card">
                    <c:choose>
                        <c:when test="${not empty news.imagePath}">
                            <img src="${pageContext.request.contextPath}/uploads/${news.imagePath}" class="card-img-top" alt="${news.title}">
                        </c:when>
                        <c:otherwise>
                            <img src="https://via.placeholder.com/300" class="card-img-top" alt="Placeholder">
                        </c:otherwise>
                    </c:choose>
                    <div class="card-body">
                        <h5 class="card-title">${news.title}</h5>
                        <p class="card-text">${news.content}</p>
                        <a href="/news/${news.id}" class="btn btn-primary">Подробнее</a>
                        <c:if test="${isAdmin}">
                            <form action="${pageContext.request.contextPath}/news/${news.id}/delete" method="post" class="d-inline">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <input type="submit" value="Удалить" class="btn btn-danger btn-sm btn-delete">
                            </form>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <c:if test="${isAdmin}">
        <div class="mt-5">
            <h3>Добавить новость</h3>
            <form action="${pageContext.request.contextPath}/news/add" method="post" enctype="multipart/form-data">
                <input type="text" name="title" class="form-control mb-2" placeholder="Заголовок">
                <textarea name="content" class="form-control mb-2" rows="5" cols="30" placeholder="Содержание"></textarea>
                <select name="categoryId" class="form-control mb-2">
                    <c:forEach items="${categories}" var="category">
                        <option value="${category.id}">${category.name}</option>
                    </c:forEach>
                </select>
                <input type="file" name="image" class="form-control mb-2">
                <input type="submit" value="Добавить" class="btn btn-success">
            </form>
        </div>
    </c:if>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
