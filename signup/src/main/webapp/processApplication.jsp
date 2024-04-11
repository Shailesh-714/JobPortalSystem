<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal System</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        .banner {
            width: 100%;
            height: 100vh;
            background-image: url(images/rename.png);
            background-size: cover;
            background-position: center;
        }

        .content {
            width: 100%;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
            color: hsl(190, 100%, 99%);
        }

        .content h1 {
            font-size: 70px;
            margin-top: 80;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        .content p {
            margin: 20px auto;
            font-weight: 100;
            font-size: 21px;
            text-shadow: 0px 2px 0px rgba(0, 0, 0, 0.3);
        }

        button {
            font-size: 20px;
            width: 300px;
            padding: 18px;
            text-align: center;
            margin: 20px 10px;
            border-radius: 30px;
            font-weight: bold;
            border: 2px solid #fff;
            background: transparent;
            color: #fff;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        span {
            height: 100%;
            width: 0%;
            background: #003329;
            border-radius: 25px;
            position: absolute;
            left: 0;
            bottom: 0;
            z-index: -1;
            transition: 0.5s;
        }

        button:hover span {
            width: 100%;
        }

        button:hover {
            border: none;
        }
    </style>
</head>
<body>

    <div class="banner">
        <%@ include file="navbar.jsp" %>
    </div>

    <div class="content"><br><br><br><br><br>
        <h1>Processing Job Application</h1>
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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root", "Shailesh@714");

            // Retrieve application data from the form
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");

            // Save application data to the database
            String sql = "INSERT INTO applications (jobId, fullName, email) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, jobId);
            preparedStatement.setString(2, fullName);
            preparedStatement.setString(3, email);
            preparedStatement.executeUpdate();

    %>
        <p>Your job application has been submitted successfully. We will contact you soon.</p>
    <%
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
    %>
        <p>There was an error processing your job application. Please try again later.</p>
    <%
        } finally {
            try {
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
        <div>
        <br>
            <a href="displayJobs.jsp"><button type="button"><span></span>FIND MORE JOBS</button></a>
            <a href="index.jsp"><button type="button"><span></span>GO BACK</button></a>
        </div>
    </div>

</body>
</html>
