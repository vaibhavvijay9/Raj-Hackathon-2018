<!DOCTYPE HTML>
<%@page import="rajmap.Checksum"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Vector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="rajmap.DBInfo"%>
<%@page import="java.sql.Connection"%>
<html>


<head>
	<title>Rajasthan Tourism</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/css/materialize.min.css">
    <link rel='stylesheet' type='text/css' href='css/style.css'>
    <link rel="icon" href="images/f.png" sizes="16x16" type="image/x-icon">
</head>

<body>
    <%
    	String place=request.getParameter("place");
    	int per_amount=Integer.parseInt(request.getParameter("per_amount"));
    	String name=request.getParameter("name");
    	String phone=request.getParameter("phone");
    	String email=request.getParameter("email");
    	int num_tickets=Integer.parseInt(request.getParameter("num_tickets"));
    	double amount=per_amount*num_tickets;
    	String visit_date=request.getParameter("visit_date");
    	
    	
    	String PRN=Integer.toString((int)(Math.random()*999999999)+1000000);
     	
     	
     	//here we insert into the bookings table
     	String query="insert into bookings values(?,?,?,?,?,?,?,?,?,?)";
		try
		{
			Connection con=DBInfo.getConn();	
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,PRN );
			ps.setString(2,place );
			ps.setString(3,name );
			ps.setString(4,phone);
			ps.setString(5,email );
			ps.setInt(6,num_tickets );
			ps.setString(7,visit_date);
			ps.setDouble(8,amount);
			ps.setString(9,"Pending");
			ps.setString(10,"Unvisited");
			int flag=ps.executeUpdate();
			
			con.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
     %>
        <div class=" container hire-form">
            <h4 class="center">Booking Details</h4>
            <form class="col s12" action="finish.jsp" method="post">
            <table class="table-width">
                <tr class='table-row'>
                    <td class="firstCol">Place</td>
                    <td><input class="inputHeight" value="<%=place%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">Name</td>
                    <td><input class="inputHeight" value="<%=name%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">Phone</td>
                    <td><input class="inputHeight" value="<%=phone%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">Email</td>
                    <td><input class="inputHeight" value="<%=email%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">No. of Tickets</td>
                    <td><input class="inputHeight" value="<%=num_tickets%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">Visit Date</td>
                    <td><input class="inputHeight" value="<%=visit_date%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">Amount</td>
                    <td><input class="inputHeight" value="<%=amount%>" type="text" readonly></td>
                </tr>
                <tr class='table-row'>
                    <td class="firstCol">Mode of Payment</td>
                    <td><input class="inputHeight" value="Cash" type="text" readonly></td>
                </tr>    
            </table>
			<button type="submit" class="waves-effect waves-light btn hire-me-btn right">Proceed To Pay</button>
			</form>
    
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
    <script src='js/index.js'></script>
</body>

</html>