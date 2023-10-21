<?php

    require('../db_conn.php');

    $getOrdersSQL = "SELECT * FROM view_orders";

    $orders = mysqli_query($conn, $getOrdersSQL);

?>

<div class="admin-transaction-container">
    <h1>Order History</h1>
    <div class="order-history-container">
        <table class="order-history-table">
            <tr>
                <th>Order Date</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <?php foreach($orders as $order): ?>
                <tr>
                    <td><?php echo $order['orderDate']; ?></td>
                    <td><?php echo $order['status']; ?></td>
                    <td>
                        <button id="view-button">View</button>
                    </td>
                </tr>
            <?php endforeach; ?>
        </table>
    </div>
</div>