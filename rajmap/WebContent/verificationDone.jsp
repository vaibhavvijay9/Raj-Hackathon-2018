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
    	<img class='verify-image' src="images/verified.png"/>
    </div>
    <br><br>
    
        <h2>Verified !</h2><br></br>
        <h3>
           <%=session.getAttribute("name")%> along with <%=session.getAttribute("persons")%> people verified to Enter !
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
        </h3>
        <a href="verify.jsp">BACK</a><br>
        <a href="index.jsp">HOME</a>
</body>
</html>