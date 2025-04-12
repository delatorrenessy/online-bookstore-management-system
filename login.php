<?php
//including the database connection file
include_once("connection.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Sanitize and validate input
    $email = htmlspecialchars(trim($_POST['email']));
    $password = htmlspecialchars(trim($_POST['password']));

    // Simple validation (you can add more as needed)
    if (!empty($email) && !empty($password)) {
        
        $result = $conn->query("SELECT user_id, name, password FROM users WHERE email = '$email'");

        if ($result->num_rows > 0) {
            
            $row = $result->fetch_assoc();
            // if (password_verify($password, $row['password'])) {
            if ($password == $row['password']) {
                $_SESSION["user_id"] = $row['user_id'];
                $name = $row['name'];
                echo "<script>alert('Login successful! Welcome ".$name."');</script>";
            } else {
                $error = "Invalid password.";
            }
        } else {
            $error = "No user found with that email.";
        }
    } else {
        echo "<p>Please fill in all fields.</p>";
    }
} 

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <?php if (isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
    <form method="POST">
        <label>Email:</label>
        <input type="email" name="email" id="email" required>
        <br><br>
        <label>Password:</label>
        <input type="password" name="password" id="password" required>
        <br>
        <br>
        <button type="submit">Login</button>
    </form>

    <br>
    <a href="register.php">Register</a>
</body>
</html>