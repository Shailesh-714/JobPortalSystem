

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Company Details</title>
   <!-- Add your stylesheets, scripts, and other head elements here -->
</head>
<body>
   <div>
      <h1>Company Details</h1>

      <%-- Accessing companyDetails attribute from the request --%>
      <c:if test="${not empty companyDetails}">
         <table>
            <tr>
               <td>ID:</td>
               <td>${companyDetails.id}</td>
            </tr>
            <tr>
               <td>Name:</td>
               <td>${companyDetails.name}</td>
            </tr>
            <tr>
               <td>Email:</td>
               <td>${companyDetails.email}</td>
            </tr>
            <tr>
               <td>Contact:</td>
               <td>${companyDetails.contact}</td>
            </tr>
            <tr>
               <td>Organization Type:</td>
               <td>${companyDetails.organizationType}</td>
            </tr>
            <tr>
               <td>Location:</td>
               <td>${companyDetails.location}</td>
            </tr>
            <tr>
               <td>Website:</td>
               <td>${companyDetails.website}</td>
            </tr>
            <tr>
               <td>Company Description:</td>
               <td>${companyDetails.companyDescription}</td>
            </tr>
         </table>
      </c:if>

      <%-- Add any additional content or formatting as needed --%>
   </div>
   <!-- Add your scripts or other body elements here -->
</body>
</html>
