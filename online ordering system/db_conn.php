<?php

    $conn = mysqli_connect("localhost", "root", "", "online_ordering_system_db");

    if(!$conn){
        echo "Connection Failed.";
    }

?>