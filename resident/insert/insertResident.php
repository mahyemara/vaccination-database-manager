<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$hin = $_POST['insHIN'];
$name= $_POST['insName'];
$age= $_POST['insAge'];
$phone= $_POST['insPhone'];
$zip= $_POST['insZIP'];
$appointment= $_POST['insAppointment'];
$doseNumber= $_POST['insDoseNumber'];
$conn = OpenCon();

$sql = "INSERT INTO `resident_address` (`phone`, `address`) VALUES ('$phone', '$zip')";
if ($conn->query($sql) ===
    TRUE) { echo "Address updated
     successfully <br>";
} else {
    echo "Error updating record: " . $conn->error;
}

$sql = "INSERT INTO `resident` (`hin`, `doseNumber`, `name`, `age`, `phone`)
VALUES ('$hin', $doseNumber, '$name', '$age', '$phone')";
if ($conn->query($sql) ===
    TRUE) { echo "Resident updated
     successfully <br>";
} else {
    echo "Error updating record: " . $conn->error;
}

$sql = "INSERT INTO `appointment` (`day`, `hin`) VALUES (str_to_date('$appointment','YYYY-MM-DD'), '$hin')";
if ($conn->query($sql) ===
    TRUE) { echo "Appointment updated
     successfully";
} else {
    echo "Error updating record: " . $conn->error;
}

$sql = "INSERT INTO `appointment` (`day`, `hin`) VALUES (str_to_date('$appointment','YYYY-MM-DD'), '$hin')";
if ($conn->query($sql) ===
    TRUE) { echo "all set";
} else {
    echo "Error updating record: " . $conn->error;
}

?>

<form action="resident.html" method="POST">
    <input type="submit" value="Go Back to Resident Page">
</form>


