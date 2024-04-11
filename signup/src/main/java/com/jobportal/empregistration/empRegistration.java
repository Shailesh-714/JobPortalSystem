package com.jobportal.empregistration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/empRegistration")
public class empRegistration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String company_name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        String contact = request.getParameter("contact");
        String organizationType = request.getParameter("organization_type");
        String location = request.getParameter("location");
        String website = request.getParameter("website");
        String companyDescription = request.getParameter("company_description");

        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root",
                    "Shailesh@714");

            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO company(company_name, password, email, contact, organization_type, location, website, company_description) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");

            pst.setString(1, company_name);
            pst.setString(2, password);
            pst.setString(3, email);
            pst.setString(4, contact);
            pst.setString(5, organizationType);
            pst.setString(6, location);
            pst.setString(7, website);
            pst.setString(8, companyDescription);

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("emp_registration.jsp");


            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
