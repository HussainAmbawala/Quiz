<?php

    $con=mysqli_connect("localhost","root","","quiz");

    $base_url="http://".$_SERVER['SERVER_NAME'].dirname($_SERVER["REQUEST_URI"].'?').'/';

?>