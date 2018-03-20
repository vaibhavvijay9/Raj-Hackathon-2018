<!DOCTYPE HTML>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="rajmap.DBInfo"%>
<%@page import="java.sql.Connection"%>
<html>

<head>
    <title>Travel Buddy</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/css/materialize.min.css">
    <link rel='stylesheet' href='css/style.min.css '>
    <link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script src="https://use.fontawesome.com/a2fcb19453.js"></script>
</head>

<body class="login-page-background">    
    <%
		String PRN=request.getParameter("PRN");
		String status=request.getParameter("STATUS");
		
		System.out.println(PRN+":::::"+status);    
		
		String query="update bookings set txn_status=? where prn=?";
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,status );
			ps.setString(2,PRN );
			int flag=ps.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
     %>
    
<h4 class="center">Your transaction has been <b>successfully completed!!!</b></h4>    
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>