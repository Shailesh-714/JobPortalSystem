package com.jobportal.jobpost;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/PostJobServlet")
public class PostJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // JDBC database URL, username, and password
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jobportal?useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "Shailesh@714";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve job details from the form
        String companyName = request.getParameter("companyName");
        String jobTitle = request.getParameter("jobTitle");
        String experience = request.getParameter("experience");
        int vacancies = Integer.parseInt(request.getParameter("vacancies"));
        String salary = request.getParameter("salary");
        String location = request.getParameter("location");
        String jobType = request.getParameter("jobType");
        String keySkills = request.getParameter("keySkills");
        String jobDescription = request.getParameter("jobDescription");

        // JDBC variables
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Register JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Open a connection
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // SQL query to insert job details into the database
            String sql = "INSERT INTO jobs (companyName, jobTitle, experience, vacancies, salary, location, jobType, keySkills, jobDescription) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);

            // Set parameters for the SQL query
            preparedStatement.setString(1, companyName);
            preparedStatement.setString(2, jobTitle);
            preparedStatement.setString(3, experience);
            preparedStatement.setInt(4, vacancies);
            preparedStatement.setString(5, salary);
            preparedStatement.setString(6, location);
            preparedStatement.setString(7, jobType);
            preparedStatement.setString(8, keySkills);
            preparedStatement.setString(9, jobDescription);

            // Execute the query
            preparedStatement.executeUpdate();

            // Redirect to jobPosted.jsp with success message
            response.sendRedirect("jobPosted.jsp?successMessage=Job%20Posted%20Successfully");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Handle errors appropriately
        } finally {
            // Close resources in a finally block
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
    }
}
