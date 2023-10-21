<?php

    session_start();

    if(isset($_POST['admin-logout'])){
        session_destroy();
        header('Location: ../index.php');
    }

?>

<div class="admin-sidebar">
    <div class="profile">
        <h2>Profile</h2>
    </div>
    <div class="admin-middle-buttons">
        <button class="sidebar-buttons" id="admin-dashboard" onclick="changeDashboard()">Dashboard</button>
        <button class="sidebar-buttons" id="admin-transactions" onclick="changeTransactions()">Order History</button>
    </div>
    <div class="admin-bottom-buttons">
        <form class="bottom-buttons" action="adminsidebar.php" method="POST">
            <input class="sidebar-buttons" type="submit" name="admin-profile" value="Profile">
            <input class="sidebar-buttons" type="submit" name="admin-logout" value="Logout">
        </form>
    </div>
</div>