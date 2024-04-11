package com.jobportal.registration;

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

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("name");
        String uemail = request.getParameter("email");
        String upwd = request.getParameter("pass");
        String umobile = request.getParameter("contact");
        String uaddress = request.getParameter("address");
        String udomain = request.getParameter("domain");
        String uqualification = request.getParameter("qualification");
        String uskills = request.getParameter("skills");
        String uexperienceYears = request.getParameter("experience_years");
        String uintroduction = request.getParameter("introduction");

        RequestDispatcher dispatcher = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal?useSSL=false", "root",
                    "Shailesh@714");
            
            // Update the SQL query to include additional fields
            PreparedStatement pst = con.prepareStatement(
                    "INSERT INTO users(uname, upwd, uemail, umobile, uaddress, udomain, uqualification, uskills, uexperience_years, uintroduction) VALUES(?,?,?,?,?,?,?,?,?,?)");
            
            // Set values for the parameters
            pst.setString(1, uname);
            pst.setString(2, upwd);
            pst.setString(3, uemail);
            pst.setString(4, umobile);
            pst.setString(5, uaddress);
            pst.setString(6, udomain);
            pst.setString(7, uqualification);
            pst.setString(8, uskills);
            pst.setString(9, uexperienceYears);
            pst.setString(10, uintroduction);

            int rowCount = pst.executeUpdate();

            dispatcher = request.getRequestDispatcher("registration.jsp");

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
