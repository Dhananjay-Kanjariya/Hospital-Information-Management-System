<?php
// normal_registration.php
$insert = false;

if (isset($_POST['normalFName'])) {
    $server = "localhost";
    $username = "root";
    $password = "";
    $dbname = "hospital_db";

    $con = mysqli_connect($server, $username, $password, $dbname);

    if (!$con) {
        die("Connection to database failed: " . mysqli_connect_error());
    }

    $normalFName = mysqli_real_escape_string($con, $_POST['normalFName']);
    $normalMName = mysqli_real_escape_string($con, $_POST['normalMName']);
    $normalLName = mysqli_real_escape_string($con, $_POST['normalLName']);
    $normalGender = mysqli_real_escape_string($con, $_POST['normalGender']);
    $normalMaritalStatus = mysqli_real_escape_string($con, $_POST['normalMaritalStatus']);
    $normalDOB = mysqli_real_escape_string($con, $_POST['normalDOB']);
    $normalBGroup = mysqli_real_escape_string($con, $_POST['normalBGroup']);
    $normalIdentificationMark = mysqli_real_escape_string($con, $_POST['normalIdentificationMark']);
    $normalIDCard = mysqli_real_escape_string($con, $_POST['normalIDCard']);
    $normalIDCardNumber = mysqli_real_escape_string($con, $_POST['normalIDCardNumber']);
    $normalFatherName = mysqli_real_escape_string($con, $_POST['normalFatherName']);
    $normalMotherName = mysqli_real_escape_string($con, $_POST['normalMotherName']);
    $normalGuardian = mysqli_real_escape_string($con, $_POST['normalGuardian']);
    $normalAddress = mysqli_real_escape_string($con, $_POST['normalAddress']);
    $normalMobileNumber = mysqli_real_escape_string($con, $_POST['normalMobileNumber']);
    $normalRoomName = mysqli_real_escape_string($con, $_POST['normalRoomName']);
    $normalSymptoms = mysqli_real_escape_string($con, $_POST['normalSymptoms']);

    $sql = "INSERT INTO normal_registration (NormalPt_Id, NormalF_Name, NormalM_Name, NormalL_Name, NormalGender, NormalMarital_Status, NormalDOB, NormalB_Group, NormalIdentification_M, Normal_IDCard, Normal_IDCardNumber, NormalFatherName, NormalMotherName, NormalGuardian, NormalAddress, NormalMobileNumber, NormalRoom_N, Normalsymptoms) 
            VALUES ((SELECT COALESCE(MAX(NormalPt_Id), 0) + 1 FROM normal_registration), '$normalFName', '$normalMName', '$normalLName', '$normalGender', '$normalMaritalStatus', '$normalDOB', '$normalBGroup', '$normalIdentificationMark', '$normalIDCard', '$normalIDCardNumber', '$normalFatherName', '$normalMotherName', '$normalGuardian', '$normalAddress', '$normalMobileNumber', '$normalRoomName', '$normalSymptoms')";

    if ($con->query($sql) === TRUE) {
        $insert = true;
        echo "Successfully inserted";
    } else {
        echo "ERROR: $sql <br> " . $con->error;
    }

    $con->close();
}
?>