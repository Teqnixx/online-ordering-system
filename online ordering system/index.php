<?php

    require('db_conn.php');

    if(isset($_POST['login-button'])){

        if(!empty($_POST['username']) && !empty($_POST['password'])){
            
            $username = $_POST['username'];
            $password = $_POST['password'];

            $sql = "SELECT password FROM users WHERE username = '$username'";

            $result = mysqli_fetch_assoc(mysqli_query($conn, $sql));
            
            if(!is_null($result)){
                if(password_verify($password, $result['password'])){
                    header('Location: mainpage/homepage.php');
                }
            }
        }
    }
    
    if(isset($_POST['signup-button'])) {
        header('Location: loginpage/create_user.php');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="style.css">
    <title>Account</title>
</head>
<body>

    <div class="login-container">
        <h2>Login</h2>
        <form class="login-form" action="index.php" method="POST">
            <div class="username-container">
                <p>Username</p>
                <input type="text" name="username" autocomplete="off">
            </div>
            <div class="password-container">
                <p>Password</p>
                <input type="password" name="password">
            </div>
            <div class="button-container">
                <input type="submit" name="signup-button" value="Sign Up">
                <input type="submit" name="login-button" value="Login">
            </div>
        </form>
    </div>

</body>
</html>