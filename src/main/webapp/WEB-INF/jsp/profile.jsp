<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Профиль пользователя</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
    <h2>Профиль пользователя</h2>
    <div class="row">
        <div class="col-md-4">
            <!-- User Information Section -->
            <div class="card">
                <img src="${user.profilePictureUrl}" class="card-img-top" alt="Profile Picture">
                <div class="card-body">
                    <h5 class="card-title">${user.username}</h5>
                    <p class="card-text">${user.bio}</p>
                </div>
            </div>
            <!-- Edit Profile Button -->
            <a href="/profile/edit" class="btn btn-primary">Редактировать профиль</a>
        </div>
        <div class="col-md-8">
            <!-- Activity Feed Section -->
            <h4>Активность</h4>
            <!-- Display user's posts or activity here -->
        </div>
    </div>
    <!-- Privacy Settings Section (Optional) -->
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
