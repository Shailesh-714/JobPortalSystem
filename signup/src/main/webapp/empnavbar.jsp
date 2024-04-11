<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: sans-serif;
        }

        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 40px;
        }

        h2 {
            font-size: 40px;
            font-family: 'Poppins', sans-serif;
            color: #359381;
            pointer-events: none;
        }

        .navigation {
            text-align: right;
            display: inline-block;
            vertical-align: middle;
            width: 100%;
        }

        .navigation a {
            text-decoration: none;
            color: #359381;
            padding: 6px 15px;
            border-radius: 20px;
            margin: 0 10px;
            font-weight: 600;
        }

        .navigation a:hover,
        .navigation a.active {
            background: #359381;
            color: #fff;
        }

    </style>
</head>
<body>
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
    
</body>
</html>
