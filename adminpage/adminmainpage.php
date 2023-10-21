<?php

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
    <title>Admin</title>
</head>
<body>
    
    <?php require('adminsidebar.php'); ?>

    <!-- page contents -->
    <?php require('admindashboard.php'); ?>
    <?php require('admintransaction.php'); ?>

</body>
</html>