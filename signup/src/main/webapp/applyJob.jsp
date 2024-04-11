<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Apply for Job</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; /* Reset default margin */
            padding: 20px;
            background-image: url('images/rename.png');
            background-size: cover; /* Ensure the image covers the entire background */
            background-position: center; /* Center the background image */
            background-attachment: fixed; /* Fixed background */
        }
        p{
        font-size:25px}

        h3 {
            text-align: centre;
            font-size: 30px;
            color: black;
        }

        .login {
            background-color: rgba(245, 245, 245, 0.2); /* Adjust the alpha value for transparency */
            padding: 10px;
            margin-top: 20px;
            align-items: centre;
            border-radius: 5px;
            width: 50%;
        }

        label {
            display: block;
            margin: 10px 0;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="file"] {
            width: 70%;
            padding: 10px;
            margin: 2px 2px 10px 2px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 20px;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 5px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>
    <h2 style="color:black; padding-left:600px">Job Application</h2><br>

    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>

    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.Connection" %>

    <%@ page import="java.sql.DriverManager" %>
    <%@ page import="java.sql.PreparedStatement" %>
    <%@ page import="java.sql.ResultSet" %>

    <%
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root", "Shailesh@714");

            // Retrieve job details based on the job ID from the URL parameter
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            String sql = "SELECT * FROM jobs WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, jobId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
    %>
                <div>
                    <h3><%= resultSet.getString("jobTitle") %></h3><br>
                    <p>Company: <%= resultSet.getString("companyName") %></p>
                    <p>Salary: <%= resultSet.getString("salary") %></p>
                    <p>Location: <%= resultSet.getString("location") %></p>
                    <p>Experience: <%= resultSet.getString("experience") %></p>
                    <p>Vacancies: <%= resultSet.getInt("vacancies") %></p>
                    <p>Type of Job: <%= resultSet.getString("jobType") %></p>
                    <p>Key Skills: <%= resultSet.getString("keySkills") %></p>
                    <p>Description: <%= resultSet.getString("jobDescription") %></p><br>
                </div>

               

                <!-- Job Application Form -->
                <h3>Apply for Job</h3>
                <form action="processApplication.jsp" method="post" class="login">
                    <input type="hidden" name="jobId" value="<%= jobId %>">
                    <label for="fullName">Full Name:</label>
                    <input type="text" name="fullName" required>
                    <br>
                    <label for="email">Email:</label>
                    <input type="email" name="email" required>
                    <br>
                    <label for="resume">Resume/CV:</label>
                    <input type="file" name="resume" accept=".pdf, .doc, .docx" required>
                    <br>
                    <input type="submit" value="Submit Application">
                </form>
    <%
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
