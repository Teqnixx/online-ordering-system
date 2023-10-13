<?php



?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../templates/sidebar.css">
    <link rel="stylesheet" href="mainpage.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <title>Order</title>
</head>
<body>
    
    <?php include('../templates/sidebar.php'); ?>

    <div class="menu-navigation">
        <form class="menu-form" action="" method="POST">
            <div class="buttons">
                <input id="foods-button" type="submit" name="Foods" value="Foods">
                <input id="beverages-button" type="submit" name="Beverages" value="Beverages">
            </div>
            <div class="search-bar">
                <input id="search-field" type="text" autocomplete="off" name="search" placeholder="Search Product...">
            </div>
        </form>
    </div>

</body>
</html>