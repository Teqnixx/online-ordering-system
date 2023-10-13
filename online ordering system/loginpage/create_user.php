<?php

    require('../db_conn.php');

    if(isset($_POST['create-button'])){
        if(!empty($_POST['username']) && !empty($_POST['password'])){
            $username = $_POST['username'];
            $password = $_POST['password'];
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

            $sql = "INSERT INTO users(username, password, role) VALUES(
            '$username', '$hashedPassword', 'User')";

            mysqli_query($conn, $sql);

            header("Location: ../index.php");
        }
    }
    if(isset($_POST['back-button'])) {
        header('Location: ../index.php');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../style.css">
    <title>Account</title>
</head>
<body>
    
    <div class="login-container">
        <h2>Sign Up</h2>
        <form class="login-form" action="create_user.php" method="POST">
            <div class="username-container">
                <p>Username</p>
                <input type="text" name="username" autocomplete="off">
            </div>
            <div class="password-container">
                <p>Password</p>
                <input type="password" name="password">
            </div>
            <div class="button-container">
                <input type="submit" name="back-button" value="Back">
                <input type="submit" name="create-button" value="Create">
            </div>
        </form>
    </div>

</body>
</html>