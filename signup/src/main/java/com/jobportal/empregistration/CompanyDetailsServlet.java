package com.jobportal.empregistration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/companyDetails")
public class CompanyDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            HttpSession session = request.getSession();

            // Check if the company email is stored in the session
            String companyEmail = (String) session.getAttribute("companyEmail");

            if (companyEmail != null) {
                // Connect to the database and retrieve company details based on the email
                Map<String, Object> companyDetails = retrieveCompanyDetailsFromDatabase(companyEmail);

                // Store the company details in the request attribute
                request.setAttribute("companyDetails", companyDetails);

                // Forward the request to the JSP page
                RequestDispatcher dispatcher = request.getRequestDispatcher("companyDetails.jsp");
                dispatcher.forward(request, response);
            } else {
                // Redirect to a login page or show an error message
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }
    }

    // Implement the method to retrieve company details from the database based on email
    private Map<String, Object> retrieveCompanyDetailsFromDatabase(String email) {
        Map<String, Object> companyDetails = new HashMap<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root",
                    "Shailesh@714");

            String query = "SELECT * FROM company WHERE email = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                companyDetails.put("id", rs.getInt("id"));
                companyDetails.put("name", rs.getString("name"));
                companyDetails.put("email", rs.getString("email"));
                companyDetails.put("contact", rs.getString("contact"));
                companyDetails.put("organizationType", rs.getString("organization_type"));
                companyDetails.put("location", rs.getString("location"));
                companyDetails.put("website", rs.getString("website"));
                companyDetails.put("companyDescription", rs.getString("company_description"));
            }

            rs.close();
            pst.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions as needed
        }

        return companyDetails;
    }
}
