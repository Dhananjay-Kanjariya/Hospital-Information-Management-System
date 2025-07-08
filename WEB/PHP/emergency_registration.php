<?php
// emergency_registration.php
$insert = false;

if (isset($_POST['emergencyFName'])) {
    $server = "localhost";
    $username = "root";
    $password = "";
    $dbname = "hospital_db";

    $con = mysqli_connect($server, $username, $password, $dbname);

    if (!$con) {
        die("Connection to database failed: " . mysqli_connect_error());
    }

    $emergencyFName = mysqli_real_escape_string($con, $_POST['emergencyFName']);
    $emergencyMName = mysqli_real_escape_string($con, $_POST['emergencyMName']);
    $emergencyLName = mysqli_real_escape_string($con, $_POST['emergencyLName']);
    $emergencyGender = mysqli_real_escape_string($con, $_POST['emergencyGender']);
    $emergencyDOB = mysqli_real_escape_string($con, $_POST['emergencyDOB']);
    $emergencyBGroup = mysqli_real_escape_string($con, $_POST['emergencyBGroup']);
    $emergencyIdentificationMark = mysqli_real_escape_string($con, $_POST['emergencyIdentificationMark']);
    $emergencyIDCard = mysqli_real_escape_string($con, $_POST['emergencyIDCard']);
    $emergencyIDNumber = mysqli_real_escape_string($con, $_POST['emergencyIDNumber']);
    $emergencyAddress = mysqli_real_escape_string($con, $_POST['emergencyAddress']);
    $emergencyMobileNumber = mysqli_real_escape_string($con, $_POST['emergencyMobileNumber']);
    $emergencyRoomName = mysqli_real_escape_string($con, $_POST['emergencyRoomName']);
    $emergencySymptoms = mysqli_real_escape_string($con, $_POST['emergencySymptoms']);
    $emergencyAccompanyingFName = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingFName']);
    $emergencyAccompanyingMName = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingMName']);
    $emergencyAccompanyingLName = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingLName']);
    $emergencyAccompanyingMobileNumber = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingMobileNumber']);
    $emergencyAccompanyingGender = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingGender']);
    $emergencyAccompanyingIDCard = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingIDCard']);
    $emergencyAccompanyingIDCardNumber = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingIDCardNumber']);
    $emergencyAccompanyingRelation = mysqli_real_escape_string($con, $_POST['emergencyAccompanyingRelation']);

    $sql = "INSERT INTO emergency_registration (EmergencyPt_Id, EmergencyF_Name, EmergencyM_Name, EmergencyL_Name, EmergencyGender, EmergencyDOB, EmergencyB_Group, EmergencyIdentification_M, Emergency_IDCard, Emergency_IDNumber, EmergencyAddress, EmergencyMobileNumber, EmergencyRoom_N, Emergencysymptoms, EmergencyAccompanyingFName, EmergencyAccompanyingMName, EmergencyAccompanyingLName, EmergencyAccompanyingMobileNumber, EmergencyAccompanyingGender, EmergencyAccompanyingIDCard, EmergencyAccompanyingIDCardNumber, EmergencyAccompanyingRelation) 
            VALUES ((SELECT COALESCE(MAX(EmergencyPt_Id), 0) + 1 FROM emergency_registration), '$emergencyFName', '$emergencyMName', '$emergencyLName', '$emergencyGender', '$emergencyDOB', '$emergencyBGroup', '$emergencyIdentificationMark', '$emergencyIDCard', '$emergencyIDNumber', '$emergencyAddress', '$emergencyMobileNumber', '$emergencyRoomName', '$emergencySymptoms', '$emergencyAccompanyingFName', '$emergencyAccompanyingMName', '$emergencyAccompanyingLName', '$emergencyAccompanyingMobileNumber', '$emergencyAccompanyingGender', '$emergencyAccompanyingIDCard', '$emergencyAccompanyingIDCardNumber', '$emergencyAccompanyingRelation')";

    if ($con->query($sql) === TRUE) {
        $insert = true;
        echo "Successfully inserted";
    } else {
        echo "ERROR: $sql <br> " . $con->error;
    }

    $con->close();
}
?>
