<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Listings</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('images/rename.png') fixed center;
            background-size: cover;
            font-family: 'Arial Black', sans-serif;
        }

        .job-listings {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .job-widget {
            border: 1px solid rgba(255, 255, 255, 0.9);
            margin: 10px;
            width: 100%;
            padding: 50px;
            cursor: pointer;
            background: rgba(255, 255, 255, 0.4);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            transition: background 0.3s ease-in-out;
        }

        .job-widget:hover {
            background: rgba(255, 255, 255, 0.3);
        }

        .job-details {
            display: none;
            padding-top: 10px;
        }

        .apply-button {
            background-color: #4CAF50;
            color: white;
            padding: 8px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }
        h3{
        font-size: 35px;
        text-shadow:2px 2px 4px rgba(0, 0, 0, 0.3);}
        p{
        font-size: 20px;}
    </style>
</head>
<body>

    <h2 style="text-align: center; color: #359381;">Job Listings</h2>

    <div class="job-listings">
        <%
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root", "Shailesh@714");
                String sql = "SELECT * FROM jobs";
                preparedStatement = connection.prepareStatement(sql);
                resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    String jobId = "job" + resultSet.getInt("id");
        %>
                    <div class="job-widget" onclick="toggleDetails('<%= jobId %>')">
                        <h3 style="color: #359381;"><%= resultSet.getString("jobTitle") %></h3>
                        <p style="color: black;">Company: <%= resultSet.getString("companyName") %></p>
                        <p style="color: black;">Salary: <%= resultSet.getString("salary") %></p>
                        <p style="color: black;">Key Skill: <%= resultSet.getString("keyskills") %></p>
                        <div class="job-details" id="<%= jobId %>">
                            <p style="color: black;">Experience: <%= resultSet.getString("experience") %></p>
                            <p style="color: black;">Vacancies: <%= resultSet.getInt("vacancies") %></p>
                            <p style="color: black;">Type of Job: <%= resultSet.getString("jobType") %></p>
                            <p style="color: black;">Location: <%= resultSet.getString("location") %></p>
                            <p style="color: black;">Description: <%= resultSet.getString("jobDescription") %></p>
                            <a href="applyJob.jsp?jobId=<%= resultSet.getInt("id") %>">
                                <button class="apply-button">Apply for Job</button>
                            </a>
                        </div>
                    </div>
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
    </div>

    <script>
        function toggleDetails(jobId) {
            var detailsDiv = document.getElementById(jobId);
            detailsDiv.style.display = (detailsDiv.style.display === 'none') ? 'block' : 'none';
        }
    </script>
</body>
</html>
