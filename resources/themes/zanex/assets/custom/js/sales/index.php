<!DOCTYPE html> 
<html> 
<head> 
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href= 
    "https://maxcdn.bootstrapcdn.com/bootstrap/ 
     4.0.0/css/bootstrap.min.css"> 
    <!-- jQuery library -->
    <script src= 
    "https://ajax.googleapis.com/ajax/libs/ 
     jquery/3.3.1/jquery.min.js"> 
    </script> 
    <!-- Popper JS -->
    <script src= 
    "https://cdnjs.cloudflare.com/ajax/libs/ 
     popper.js/1.12.9/umd/popper.min.js"> 
    </script> 
    <!-- Latest compiled JavaScript -->
    <script src= 
    "https://maxcdn.bootstrapcdn.com/bootstrap/ 
     4.0.0/js/bootstrap.min.js"> 
    </script> 
</head> 
  
<body><br> 
    <h1 class="text-center text-success"> 
        Welcome to GeeksforGeeks 
    </h1> 
  
    <p class="text-center"> 
      FORM VALIDATION USING JQUERY 
    </p> 
  
    <div class="container"> 
      <div class="col-lg-8  
           m-auto d-block"> 
        <form> 
          <div class="form-group"> 
              <label for ="user"> 
                Username:  
              </label> 
              <input type="text"
                    name="username" id="usernames"
                    class="form-control"> 
              <h5 id="usercheck" style="color: red;" > 
                    **Username is missing 
              </h5> 
          </div> 
  
  
          <div class="form-group"> 
              <label for="user"> 
                    Email:  
              </label> 
              <input type="email" name="email"
                id="email" required  
                class="form-control"> 
              <small id="emailvalid" class="form-text 
                text-muted invalid-feedback"> 
                    Your email must be a valid email 
              </small> 
          </div> 
  
          <div class="form-group"> 
              <label for="password">  
                    Password: 
              </label> 
              <input type="password" name="pass" 
                id="password" class="form-control"> 
              <h5 id="passcheck" style="color: red;"> 
                **Please Fill the password 
              </h5> 
          </div> 
  
          <div class="form-group"> 
              <label for="conpassword">  
                    Confirm Password:  
              </label> 
              <input type="password" name="username"
                    id="conpassword" class="form-control"> 
              <h5 id="conpasscheck" style="color: red;"> 
                  **Password didn't match 
              </h5> 
          </div> 
  
          <input type="submit" id="submitbtn" 
             value="Submit" class="btn btn-primary">    
        </form> 
      </div> 
    </div> 
  
    <!--  Including app.js jQuery Script -->
      <script src="app.js"></script> 
  </body> 
</html>