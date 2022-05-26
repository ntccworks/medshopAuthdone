<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin</title>
    <link
      href="https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css"
      rel="stylesheet"
    />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:wght@500&display=swap"
      rel="stylesheet"
    />
    <link  rel="stylesheet" type="text/css" href="login.css">
      </head>
  <body>
    <div class="container ">
      <div class="top-header">
        <h3>Admin Portal</h3>
        <small id ="warning" style="color:red"></small>
      </div>
      
        <div class="user">
          <i class="bx bxs-user-circle"></i>
          <input type="text" id="adminUserName" name="adminUserName" placeholder="Enter your username" required/>
        </div>
        <div class="pass">
          <i class="bx bxs-lock-alt"></i>
          <input type="password" id="adminPassword" name="adminPassword" placeholder="Enter your password" required/>
        </div>
        <div class="btn">
        <button type="button" name="ADMINLOGIN" onclick="adminAccess()">Login</button>
        <br>
        
      </div>
     
      <script type="text/javascript">
      function adminAccess(){
    	  if (document.getElementById("adminUserName").value == "admin" && document.getElementById("adminPassword").value == "123"){
    		  window.location.href = "adminPage.jsp";
    	  }else{
    		  document.getElementById("warning").innerHTML = "Invalid admin credentials";
    	  }
      }
      </script>
    </div>
  </body>
</html>
