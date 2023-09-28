
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <link rel="stylesheet" href="../style.css">
    
</head>
<body>
    <div class="registrationbox">
        <div class="registrationheading">
            User Registration Page
        </div>
        <div class="errorblog"> 
    <?php
     if(isset($_GET['error'])){
         $turn=0;
          while($turn==0){
             if($_GET['error']=="true"){
                  echo "Registration Unsucessful";
                 $turn=1;
             }
             else if($_GET['error']=="1"){
                  echo "User with this email address or contact number or citizenship number is already registered";
                  $turn=1;
              }
             else if($_GET['error']=='2'){
                  echo "Fill with proper data";
                 $turn=1;
              }
              else if($_GET['error']=='3'){
                  echo "<script>alert('Error in query')</script>";
                 $turn=1;
              }
              else if($_GET['error']=='4'){
                 echo "Registration failed";
                  $turn=1;
              }
             else if($_GET['error']=='5'){
                  echo "Select proper data";
                  $turn=1;
              }
              else{
                 echo "Registration Sucessful";
                  $turn=1;
              }
         }
      }
      ?> 
      
      
    
    </div>
        <form action="../auth/userregistrationbackend.php" onsubmit="" method="POST">
            <div class="name">
            <input type="text" name="fname" id="fname" placeholder="Enter your first name" required><br>
            <input type="text" name="mname" id="mname" placeholder="Enter your middle name"><br>
            <input type="text" name="lname" id="lname" placeholder="Enter your last name" required><br>
         </div>
            <input type="text" name="address" id="address" placeholder="Enter your address" required><br>
            <input type="tel" name="contact_no" id="contact_no" placeholder="Enter your Contact Number" required><br>
            <input type="text" name="citizenship_no" id="citizenship_no" placeholder="Enter your Citizenship Number" required><br>
             <label for="proof">Prove that this is your citizenship number:</label><br> 
           <input type="radio" name="proof" id="citizenship_no_valid" value="True">This is my citizenship number<br>
           <input type="radio" name="proof" id="citizenship_no_invalid" value="False">This is not my citizenship number<br>
            <input type="text" name="user_email" id="user_email" placeholder="Enter your email" required><br>
            <input type="password" name="user_password" id="user_password" placeholder="Enter your password" required><br>
            <input type="submit" value="Register" name="register" id="register">
   
</form>

  
</body>
</html> 