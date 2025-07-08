<?php
// opd_registration.php
$insert = false;

if (isset($_POST['fname'])) {
    $server = "localhost";
    $username = "root";
    $password = "";
    $dbname = "hospital_db";

    $con = mysqli_connect($server, $username, $password, $dbname);

    if (!$con) {
        die("Connection to database failed: " . mysqli_connect_error());
    }

    $fname = mysqli_real_escape_string($con, $_POST['fname']);
    $mname = mysqli_real_escape_string($con, $_POST['mname']);
    $lname = mysqli_real_escape_string($con, $_POST['lname']);
    $gender = mysqli_real_escape_string($con, $_POST['gender']);
    $dob = mysqli_real_escape_string($con, $_POST['dob']);
    $mobileNo = mysqli_real_escape_string($con, $_POST['mobileNo']);
    $specialization = mysqli_real_escape_string($con, $_POST['specialization']);

    $sql = "INSERT INTO opd_registration (Pt_Id, F_Name, M_Name, L_Name, Gender, DOB, Mobile_Number, Specialization) 
            VALUES (UUID(), '$fname', '$mname', '$lname', '$gender', '$dob', '$mobileNo', '$specialization')";

    if ($con->query($sql) === TRUE) {
        $insert = true;
        echo "Successfully inserted";
    } else {
        echo "ERROR: $sql <br> " . $con->error;
    }

    $con->close();
}
?>