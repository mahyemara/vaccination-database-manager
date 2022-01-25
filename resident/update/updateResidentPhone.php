<style>
    body {
        background-color: #DBF9FC;
    }
</style>

<?php
include 'connect.php';
$hin = $_POST['hin'];
$oldPhone = $_POST['oldPhone'];
$newPhone = $_POST['newPhone'];
$zip = $_POST['zip'];
$conn = OpenCon();

$sql = "INSERT INTO `resident_address` (`phone`, `address`) VALUES ('$newPhone', '$zip')";
if ($conn->query($sql) ===
    TRUE) { echo "new Phone Number and address inserted successfully";
    echo "<br>";
} else {
    echo "Error updating record: " . $conn->error;
    echo "<br>";
}

$sql = "update resident set phone = '$newPhone' where phone = '$oldPhone'";
if ($conn->query($sql) ===
    TRUE) { echo "old phone number and address deleted";
    echo "<br>";
} else {
    echo "Error updating record: " . $conn->error;
    echo "<br>";
}

$sql = "delete from resident_address where phone = '$oldPhone'";
if ($conn->query($sql) ===
    TRUE) { echo "all set!";
    echo "<br>";
} else {
    echo "Error updating record: " . $conn->error;
    echo "<br>";
}
?>

<form action="resident.html" method="POST">
    <input type="submit" value="Go Back to Resident Page">
</form>
