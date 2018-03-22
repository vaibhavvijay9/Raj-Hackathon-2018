<!DOCTYPE html>
<%@page import="rajmap.DBInfo"%>
<%@page import="java.sql.*"%>
<html lang="en">

<head>
    <title>Rajasthan Tourism</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/css/materialize.min.css">
    <link rel='stylesheet' type='text/css' href='css/style.css'>
    <link rel="icon" href="images/favicon.png" sizes="16x16" type="image/x-icon">
</head>

 <body class='center'>
	<div class='center'>
    	<img src="images/verified.png" width="300" height="200"/>
    </div>
    <br><br>
    
        <h1>Verified !</h1><br></br>
        <h2>
           <%=session.getAttribute("name")%> along with <%=session.getAttribute("persons")%> verified to Enter !
           <%
	           String PRN=String.valueOf(session.getAttribute("PRN"));
	           Connection con=DBInfo.con;
	           String query="update bookings set visit_status=? where PRN= ?";
	           PreparedStatement ps=con.prepareStatement(query);
	           ps.setString(1,"visited");
	           ps.setString(2,PRN);
	           try
	           {
	                ps.executeUpdate();
	           }
	           catch(Exception e)
	           {
	            	e.printStackTrace();
	           }  
               session.invalidate();
            %>
        </h2>
        <a href="verify.jsp">BACK</a>
</body>
</html>