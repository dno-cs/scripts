<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

    <title>Web Dev Activity - Cybersecurity Bootcamp</title>
<style>
body {
  background-color: linen;
}
</style>
</head>
<body>
<div style="width:450px; margin:0 auto;">

    <!--[if lt IE 7]>
        <p class="browsehappy">You are using an <strong>outdated</strong> browser. Please <a href="#">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->
    <?php echo "<center><h1><b>GOODCORP</b><br>Employee Directory</h1></center>"; ?>

    <?php $image_url='https://regmedia.co.uk/2016/07/19/anonymous_897439873434.jpg?x=442&y=293&crop=1'; ?>
    <center>
    <img src="<?php echo $image_url;?>">
    </center>
    <p></p>

    <?php
    $servername = "192.168.25.7";
    $username = "admin";
    $password = "123456";
    $dbname = "goodcorpdb";
    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    echo "<h2><center>Employee List:</center></h2>"."<hr>";

    $sql = "SELECT id, firstname, lastname, email, department FROM employees";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "<b>Employee Id</b>: " . $row["id"]. " <br> <b>Name</b>: " . $row["firstname"]. " " . $row["lastname"]. "<br>";
            echo "<b>Email</b>: " . $row["email"]. " <br> <b>Department</b>: " . $row["department"]. "<hr>";
        }
    } else {
        echo "0 results";
    }

    if ($conn->multi_query($sql) === TRUE) {
        echo "Employee Records Retrieved Successfully!";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    ?>
    <br></br>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</div>
</body>
</html>