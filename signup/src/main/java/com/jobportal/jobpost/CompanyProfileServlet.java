package com.jobportal.jobpost;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/companyProfile")
public class CompanyProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("edit".equals(action)) {
            // Edit mode
            String companyId = (String) request.getSession().getAttribute("companyId");
            String companyName = "";
            String companyType = "";
            String businessEmail = "";
            String yearOfEstablishment = "";
            int noOfEmployees = 0;
            String location = "";
            String description = "";
            String contactInfo = "";
            String address = "";

            // Retrieve company details based on the company ID
            String sql = "SELECT * FROM companies WHERE companyId = ?";
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root", "Shailesh@714");
                PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                preparedStatement.setString(1, companyId);
                try (ResultSet resultSet = preparedStatement.executeQuery()) {
                    if (resultSet.next()) {
                        companyName = resultSet.getString("companyName");
                        companyType = resultSet.getString("companyType");
                        businessEmail = resultSet.getString("businessEmail");
                        yearOfEstablishment = resultSet.getString("yearOfEstablishment");
                        noOfEmployees = resultSet.getInt("noOfEmployees");
                        location = resultSet.getString("location");
                        description = resultSet.getString("description");
                        contactInfo = resultSet.getString("contactInfo");
                        address = resultSet.getString("address");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

            request.setAttribute("companyId", companyId);
            request.setAttribute("companyName", companyName);
            request.setAttribute("companyType", companyType);
            request.setAttribute("businessEmail", businessEmail);
            request.setAttribute("yearOfEstablishment", yearOfEstablishment);
            request.setAttribute("noOfEmployees", noOfEmployees);
            request.setAttribute("location", location);
            request.setAttribute("description", description);
            request.setAttribute("contactInfo", contactInfo);
            request.setAttribute("address", address);

            request.getRequestDispatcher("/companyProfile.jsp").forward(request, response);
        } else {
            response.getWriter().println("<p>Invalid action.</p>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String companyId = request.getParameter("companyId");
        String companyName = request.getParameter("companyName");
        String companyType = request.getParameter("companyType");
        String businessEmail = request.getParameter("businessEmail");
        String yearOfEstablishment = request.getParameter("yearOfEstablishment");
        int noOfEmployees = Integer.parseInt(request.getParameter("noOfEmployees"));
        String location = request.getParameter("location");
        String description = request.getParameter("description");
        String contactInfo = request.getParameter("contactInfo");
        String address = request.getParameter("address");

        // Update company profile in the database
        String sql = "UPDATE companies SET companyName = ?, companyType = ?, businessEmail = ?, yearOfEstablishment = ?, "
                + "noOfEmployees = ?, location = ?, description = ?, contactInfo = ?, address = ? WHERE companyId = ?";
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root", "Shailesh@714");
            PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, companyName);
            preparedStatement.setString(2, companyType);
            preparedStatement.setString(3, businessEmail);
            preparedStatement.setString(4, yearOfEstablishment);
            preparedStatement.setInt(5, noOfEmployees);
            preparedStatement.setString(6, location);
            preparedStatement.setString(7, description);
            preparedStatement.setString(8, contactInfo);
            preparedStatement.setString(9, address);
            preparedStatement.setString(10, companyId);
            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("companyProfile?action=edit");
            } else {
                response.getWriter().println("<p>Failed to update company profile. Please try again.</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<p>Error updating company profile. Please try again later.</p>");
        }
    }
}
