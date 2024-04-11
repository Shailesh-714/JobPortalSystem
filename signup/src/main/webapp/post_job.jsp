<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Job Vacancy</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/remixicon/3.5.0/remixicon.css" crossorigin="">
    <style>
        /* Google Fonts */
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap");

        /* Variables CSS */
        /* Google Fonts */

/* Variables CSS */
:root {
    --white-color: hsl(0, 0%, 100%);
    --black-color: hsl(0, 0%, 0%);
    --body-font: "Poppins", sans-serif;
    --h1-font-size: 2rem;
    --normal-font-size: 1rem;
    --small-font-size: .813rem;
}

/* Base Styles */
* {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
}

body,
input,
button {
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

/* Header Styles */
.header-container {
    background-color: rgba(255, 255, 255, 0);
    backdrop-filter: blur(10px);
    position: fixed;
    width: 100%;
    z-index: 20;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 30px;
    top: 0; /* Fixed to the top */
}

.header-container h2 {
font-size: 35px;
    color: #3B34A2;
    pointer-events: none;
}

.navigation {
    text-align: right;
    display: inline-block;
    vertical-align: middle;
}

.navigation a {
    text-decoration: none;
    color: #3B34A2;
    padding: 6px 15px;
    border-radius: 20px;
    margin: 0 10px;
    font-weight: 600;
}

.navigation a:hover,
.navigation a.active {
    background: #3B34A2;
    color: #fff;
}

/* Login Form Styles */
.login {
    position: relative;
    height: 110vh;
    display: grid;
    align-items: center;
    margin-top: 80px; /* Adjusted margin-top */
}

.login__bg {
    position: fixed;
    top: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    object-position: center;
    z-index: 1;
}

.login__form {
    width: 54%;
    margin-inline: auto;
    background-color: hsla(0, 0%, 100%, .01);
    border: 2px solid hsla(0, 0%, 100%, .7);
    padding: 2.5rem 1rem;
    color: var(--white-color);
    border-radius: 1rem;
    backdrop-filter: blur(20px);
    z-index: 2;
    position: relative;
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
    padding-block: 0.75rem;
    padding-inline: 1rem;
    margin-bottom: 0.5rem;
    border: 2px solid var(--white-color);
    border-radius: 1.5rem;
    outline: none;
}

.login__box textarea {
    width: 207%;
}

.login__box input::placeholder,
.login__box textarea::placeholder {
    color: var(--white-color);
    margin-left: 0.5rem;
}

.login__box i {
    font-size: 1rem;
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
/* Apply the styles to the select element */
select#jobType {
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    background-color: transparent;
    border: 2px solid #fff; /* Set the border color */
    border-radius: 30px; /* Adjust the border-radius for rounded edges */
    padding: 15px; /* Adjust the padding for spacing */
    color: #fff; /* Set the text color */
    font-size: 16px; /* Adjust the font size */
}

/* Add styles for the arrow icon (you can customize this part) */
select#jobType::after {
    content: '\25BC'; /* Unicode for the down arrow */
    position: absolute;
    top: 50%;
    right: 10px; /* Adjust the right offset */
    transform: translateY(-50%);
    color: #fff; /* Set the arrow color */
}

/* Style the options inside the dropdown */
select#jobType option {
    background-color: #333; /* Set the background color for options */
    color: #fff; /* Set the text color for options */
}

/* Style for when the dropdown is open (optional) */
select#jobType:active,
select#jobType:focus {
    border-color: #359381; /* Set the border color when active/focused */
    outline: none;
}


    </style>
</head>
<body>

<div class="login">
    

    <!-- Navigation Bar -->
    <div class="header-container">
        <h2 class="logo">Sapling</h2>
        <nav class="navigation">
            <a href="#" class="active">Home</a>
            <a href="post_job.jsp">Post Job</a>
            <a href="post_job.jsp">Contact</a>
            <a href="emplogout">Logout</a>
            <a href="companyDetails.jsp"><%=session.getAttribute("name")%></a>
        </nav>
    </div>
<img src="assets/imglog/login-bg.png" alt="image" class="login__bg">
    <!-- Login Form -->
    <form action="PostJobServlet" method="post" class="login__form">
        <h1 class="login__title">Post a Job</h1>

        <div class="login__inputs">
               <div class="login__box">
				   <label for="companyName">Company Name:</label>
                  <input type="text" id="companyName" name="companyName" placeholder="Company" required class="login__input">
               </div>

               <div class="login__box">
                  <label for="jobTitle">Job Title:</label>
        <input type="text" id="jobTitle" name="jobTitle" placeholder="Title" required class="login__input">
                  
               </div>
               <div class="login__box">
				   <label for="experience">Experience:</label>
        <input type="text" id="experience" name="experience" placeholder="in years" required class="login__input">
               </div>
               <div class="login__box">
				   <label for="vacancies">Number of Vacancies:</label>
        <input type="number" id="vacancies" name="vacancies" placeholder="Vacancies" required class="login__input">
               </div>
               <div class="login__box">
				   <label for="salary">Salary:</label>
        <input type="text" id="salary" name="salary" placeholder="Salaray in Rs." required class="login__input">
               </div>
               <div class="login__box">
				   <label for="location">Location:</label>
        <input type="text" id="location" name="location" placeholder="Location" required class="login__input">
               </div>
               <div class="login__box">
				   <label for="jobType">Type of Job:</label>
        <select id="jobType" name="jobType">
            <option value="fullTime">Full Time</option>
            <option value="partTime">Part Time</option>
            <option value="intern">Intern</option>
            <option value="online">Online</option>
        </select>
               </div>
               <div class="login__box">
				   <label for="keySkills">Key Skills:</label>
        <input type="text" id="keySkills" name="keySkills" placeholder="UI/UX, Web Development, etc" required class="login__input">
               </div>
               <div class="login__box">
				   <label for="jobDescription">Job Description:</label><br>
        <textarea id="jobDescription" name="jobDescription" rows="4" cols="50" placeholder="Describe yourself..." required class="login__input">
        </textarea>
               </div>
            </div>

            <button type="submit" name="register" id="register" class="login__button">Submit</button>

         </form>
      </div>
   </body>
</html>
