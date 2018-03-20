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
    <link rel="icon" href="images/f.png" sizes="16x16" type="image/x-icon">
</head>
<% 
	String id=(String)request.getParameter("id");
	int location_id=Integer.parseInt(""+id);
	String place="";
	String description="";
	String image_url="";
	int fare=0;
	
	String query="select * from locations where location_id=?";
	try
	{
		Connection con=DBInfo.getConn();	
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, location_id);
		ResultSet res=ps.executeQuery();
		while(res.next())
		{
			place=res.getString(2);
			description=res.getString(3);
			image_url=res.getString(6);
			fare=res.getInt(7);
		}
		con.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
<body>
	<div>
		<img src="<%=image_url%>">
        <h4 class="center">Book Your Tickets</h4>
        <form action="confirmBooking.jsp" method="post">
        <table class='table-width'>
            <tr class='table-row'>
                <td class='firstCol'>Place</td>
                <td><input class='inputHeight'  name="place" value="<%=place%>" type="text" readonly></td>
            </tr>
            <tr class='table-row'>
                <td class='firstCol'>Amount(per Person(Rs.))</td>
                <td><input class='inputHeight' name="per_amount" value="<%=fare%>" type="text" readonly></td>
            </tr>
            <tr class='table-row'>
                <td class='firstCol'>Name</td>
                <td><input class='inputHeight'  name="name" type="text" required></td>
            </tr>
            <tr class='table-row'>
                <td class='firstCol'>Mobile</td>
                <td><input class='inputHeight' type="text" name="phone" minlength="10" maxlength="10" required onkeypress='return event.charCode >= 48 && event.charCode <= 57'></td>
            </tr>
            <tr class='table-row'>
            	<td class='firstCol'>Email</td>
            	<td><input class='inputHeight' id="email1" type="email" name="email" required></td>    
            </tr>
            <tr class='table-row'>
            	<td class='firstCol'>No. of Tickets</td>
            	<td><input class='inputHeight' type="number" name="num_tickets" required></td>    
            </tr>
            <tr class='table-row'>
                <td class='firstCol'>Visit Date</td>
                <td><input class='inputHeight datepicker' name="visit_date" type="text" required></td>
            </tr>
        </table>
        <button class="btn waves-effect waves-light book-ticket-btn" type="submit" name="action">Book Tickets
   	</button>
       </form>
    </div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/js/materialize.min.js"></script>
	<script src="js/index.js"></script>
</body>
</html>