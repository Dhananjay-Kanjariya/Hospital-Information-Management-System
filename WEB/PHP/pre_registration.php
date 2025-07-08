<?php
// pre_registration.php
$insert = false;

if (isset($_POST['preFName'])) {
    $server = "localhost";
    $username = "root";
    $password = "";
    $dbname = "hospital_db";

    $con = mysqli_connect($server, $username, $password, $dbname);

    if (!$con) {
        die("Connection to database failed: " . mysqli_connect_error());
    }

    $preFName = mysqli_real_escape_string($con, $_POST['preFName']);
    $preMName = mysqli_real_escape_string($con, $_POST['preMName']);
    $preLName = mysqli_real_escape_string($con, $_POST['preLName']);
    $preGender = mysqli_real_escape_string($con, $_POST['preGender']);
    $preMaritalStatus = mysqli_real_escape_string($con, $_POST['preMaritalStatus']);
    $preDOB = mysqli_real_escape_string($con, $_POST['preDOB']);
    $preBGroup = mysqli_real_escape_string($con, $_POST['preBGroup']);
    $preIdentificationMark = mysqli_real_escape_string($con, $_POST['preIdentificationMark']);
    $preIDCard = mysqli_real_escape_string($con, $_POST['preIDCard']);
    $preIDNumber = mysqli_real_escape_string($con, $_POST['preIDNumber']);
    $preAddress = mysqli_real_escape_string($con, $_POST['preAddress']);
    $preMobileNumber = mysqli_real_escape_string($con, $_POST['preMobileNumber']);
    $preRoomName = mysqli_real_escape_string($con, $_POST['preRoomName']);
    $preRef = mysqli_real_escape_string($con, $_POST['preRef']);
    $preRefInput = mysqli_real_escape_string($con, $_POST['preRefInput']);
    $preSymptoms = mysqli_real_escape_string($con, $_POST['preSymptoms']);

    $sql = "INSERT INTO pre_registration (PrePt_Id, PreF_Name, PreM_Name, PreL_Name, PreGender, PreMarital_Status, PreDOB, PreB_Group, PreIdentification_M, Pre_IDCard, Pre_IDNumber, PreAddress, PreMobileNumber, PreRoom_N, PreRef, PreRefInput, Presymptoms) 
            VALUES (UUID(), '$preFName', '$preMName', '$preLName', '$preGender', '$preMaritalStatus', '$preDOB', '$preBGroup', '$preIdentificationMark', '$preIDCard', '$preIDNumber', '$preAddress', '$preMobileNumber', '$preRoomName', '$preRef', '$preRefInput', '$preSymptoms')";

    if ($con->query($sql) === TRUE) {
        $insert = true;
        echo "Successfully inserted";
    } else {
        echo "ERROR: $sql <br> " . $con->error;
    }

    $con->close();
}
?>