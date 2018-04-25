<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="rajmap.DBInfo"%>
<%@page import="java.sql.*"%>
<%@page import="rajmap.SendInlineImagesInEmail"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Rajasthan Tourism</title>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/css/materialize.min.css">
	    <link rel='stylesheet' type='text/css' href='css/style.css'>
	    <link rel="icon" href="images/favicon.png" type="image/x-icon">
    </head>
    
    <body class='center'>
        <h4>Thank you ! We have received your  details. A mail is being sent to your email Id containing your booking ticket.</h4>
        <br><br>
        <a href="index.jsp">Home</a>
    </body>
    <%
        String email=(String)session.getAttribute("email");
        String query="update bookings set txn_status=? where PRN=?";
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(2,(String)session.getAttribute("PRN") );
			ps.setString(1,"confirmed");
			int flag=ps.executeUpdate();
			new SendInlineImagesInEmail().SendMail(email);
			con.close();
            session.invalidate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
        }
       %>
</html>