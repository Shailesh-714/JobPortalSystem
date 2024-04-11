<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">

   <!--=============== REMIXICONS ===============-->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">

   <!--=============== CSS ===============-->

   <title>Register form</title>
   <style>
      /*=============== VARIABLES CSS ===============*/
      :root {
         /*========== Colors ==========*/
         /*Color mode HSL(hue, saturation, lightness)*/
         --white-color: hsl(0, 0%, 100%);
         --black-color: hsl(0, 0%, 0%);

         /*========== Font and typography ==========*/
         /*.5rem = 8px | 1rem = 16px ...*/
         --body-font: "Poppins", sans-serif;
         --h1-font-size: 2rem;
         --normal-font-size: 1rem;
         --small-font-size: .813rem;
      }

      /*=============== BASE ===============*/
      * {
         box-sizing: border-box;
         padding: 0;
         margin: 0;
      }

      body,
      input,
      button {
         width: 100%;
         font-family: var(--body-font);
         font-size: var(--normal-font-size);
      }

      a {
         text-decoration: none;
      }

      img {
         display: block;
         max-width: 100%;
         height: auto;
      }

      /*=============== LOGIN ===============*/
      .login {
         position: relative;
         height: 100vh;
         display: grid;
         align-items: center;
      }

      .login__bg {
         position: absolute;
         width: 100%;
         height: 100%;
         object-fit: cover;
         object-position: center;
      }

      .login__form {
         width: 54%;
         margin-inline: auto; /* Center the form horizontally */
         background-color: hsla(0, 0%, 100%, .01);
         border: 2px solid hsla(0, 0%, 100%, .7);
         padding: 2.5rem 1rem;
         color: var(--white-color);
         border-radius: 1rem;
         backdrop-filter: blur(20px);
         /* Double the width */
      }

      .login__title {
         text-align: center;
         font-size: var(--h1-font-size);
         margin-bottom: 1.25rem;
      }

      .login__inputs {
         display: grid;
         grid-template-columns: repeat(2, 1fr);
         column-gap: 2rem;
         row-gap: 0.3rem;
         margin-bottom: 1rem;
      }

      .login__box {
         display: flex;
         flex-direction: column;
      }

      .login__box input,
      .login__box textarea {
         width: 100%;
         background: none;
         color: var(--white-color);
         padding-block: 0.75rem; /* Adjusted padding */
         padding-inline: 1rem;
         margin-bottom: 0.5rem;
         border: 2px solid var(--white-color);
         border-radius: 1.5rem; /* Adjust the radius as needed */
         outline: none;
      }
      .login__box textarea{
      width:207%;
      }

      .login__box input::placeholder,
      .login__box textarea::placeholder {
         color: var(--white-color);
         margin-left: 0.5rem; /* Adjusted margin */
      }

      .login__box i {
         font-size: 1rem; /* Adjusted alignment */
      }

      .login__button {
         width: 100%;
         padding: 1rem;
         margin-bottom: 1rem;
         background-color: var(--white-color);
         border-radius: 4rem;
         color: var(--black-color);
         font-weight: 500;
         cursor: pointer;
      }

      .login__register {
         font-size: var(--small-font-size);
         text-align: center;
      }

      .login__register a {
         color: var(--white-color);
         font-weight: 500;
      }

      .login__register a:hover {
         text-decoration: underline;
      }
   </style>
</head>
<body>
   <input type="hidden" id="status" value="<%= request.getAttribute("status")%>">
   <div class="login">
      <img src="assets/imglog/login-bg.png" alt="image" class="login__bg">

      <form method="post" action="register" class="login__form">
         <h1 class="login__title">Register</h1>
         <div class="login__inputs">
            <div class="login__box">
               <input type="text" name="name" id="username" placeholder="Username" required class="login__input">
               <i class="ri-user-fill"></i>
            </div>

            <div class="login__box">
               <input type="email" name="email" id="email" placeholder="Email ID" required class="login__input">
               <i class="ri-mail-fill"></i>
            </div>

            <div class="login__box">
               <input type="password" name="pass" id="password" placeholder="Password" required class="login__input">
               <i class="ri-lock-2-fill"></i>
            </div>

            <div class="login__box">
               <input type="password" name="re_pass" id="confirm_password" placeholder="Confirm Password" required class="login__input">
               <i class="ri-lock-2-fill"></i>
            </div>

            <div class="login__box">
               <input type="tel" name="contact" id="contact_number" placeholder="Contact Number" required class="login__input">
               <i class="ri-phone-fill"></i>
            </div>

            <div class="login__box">
               <input type="text" name="address" id="address" placeholder="Address" required class="login__input">
               <i class="ri-map-pin-fill"></i>
            </div>

            <div class="login__box">
               <input type="text" name="domain" id="domain" placeholder="Domain" required class="login__input">
               <i class="ri-window-line"></i>
            </div>

            <div class="login__box">
               <input type="text" name="qualification" id="qualification" placeholder="Qualification" required class="login__input">
               <i class="ri-certificate-fill"></i>
            </div>

            <div class="login__box">
               <input type="text" name="skills" id="skills" placeholder="Skills" required class="login__input">
               <i class="ri-star-fill"></i>
            </div>

            <div class="login__box">
               <input type="number" name="experience_years" id="experience_years" placeholder="Years of Experience" required class="login__input">
               <i class="ri-time-fill"></i>
            </div>

            <div class="login__box">
               <textarea name="introduction" id="introduction" placeholder="Brief Introduction" required class="login__input"></textarea>
               
            </div>
         </div>

         <button type="submit" name="register" id="register" class="login__button">Register</button>

         <div class="login__register">
            Already have an account? <a href="login.jsp">Login</a>
         </div>
      </form>
   </div>

   <script src="vendor/jquery/jquery.min.js"></script>
   <script src="js/main.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
   <link rel="stylesheet" href="alert/dist/sweetalert.css"> 
    
   <script type="text/javascript">
    var status = document.getElementById("status").value;
    
    if (status == "success") {
        swal("Congratulations", "Account Created Successfully, Please login to Continue", "success")
        .then((value) => {
            // Redirect to login.jsp after the user clicks "OK"
            window.location.href = "login.jsp";
        });
    } else {
        swal("Sorry", "Please enter correct details", "error");
    }
   </script>
</body>
</html>
