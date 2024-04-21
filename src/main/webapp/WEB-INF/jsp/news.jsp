<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Новости</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Дополнительные стили */
        body {
            background-color: #f8f9fa; /* Цвет фона */
        }
        .container {
            margin-top: 50px;
        }
        .news-card {
            background-color: #fff; /* Цвет карточки новости */
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease-in-out;
        }
        .news-card:hover {
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
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

    </div>
</nav>

<div class="container">
    <h2 class="text-center mb-5">Новости <br> Только для залогинившихся пользователей.</h2>

    <div class="row">
        <div class="col-md-4">
            <div class="card news-card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Новость 1">
                <div class="card-body">
                    <h5 class="card-title">Заголовок новости 1</h5>
                    <p class="card-text">Краткое описание новости 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="#" class="btn btn-primary">Подробнее</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card news-card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Новость 2">
                <div class="card-body">
                    <h5 class="card-title">Заголовок новости 2</h5>
                    <p class="card-text">Краткое описание новости 2. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="#" class="btn btn-primary">Подробнее</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card news-card">
                <img src="https://via.placeholder.com/300" class="card-img-top" alt="Новость 3">
                <div class="card-body">
                    <h5 class="card-title">Заголовок новости 3</h5>
                    <p class="card-text">Краткое описание новости 3. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                    <a href="#" class="btn btn-primary">Подробнее</a>
                </div>
            </div>
        </div>
    </div>

    <a href="/" class="btn btn-secondary mt-5">Главная</a>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
