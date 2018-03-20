<!DOCTYPE html>
<%@page import="rajmap.DBInfo"%>
<%@page import="java.sql.*"%>
<html lang="en">

<head>
    <title>Document</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/css/materialize.min.css">
    <link rel='stylesheet' type='text/css' href='css/style.css'>
    <link rel="icon" href="images/favicon.ico" sizes="16x16" type="image/x-icon">
</head>
<%
	String location_name,description;
	Double latitude,longitude;
	
	String query="select * from locations";
	try
	{
		Connection con=DBInfo.getConn();	
		PreparedStatement ps=con.prepareStatement(query);
		ResultSet res=ps.executeQuery();
	
%>


<body>
	<nav>
    <div class="nav-wrapper">
      <a href="#" class="brand-logo">Logo</a>
    </div>
  </nav>
	<div id="map"></div>
    <script>
        function initMap() {
		var features = [
          <%
		      	while(res.next())
				{
		  %>
					{
			            position: new google.maps.LatLng(<%=res.getDouble(4)%>,<%=res.getDouble(5)%>),
			            type: 'parking',
			            name: "+<%=res.getString(2)%>+"
			          },
		  <%
				}
				
				con.close();
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
          %>
			
		  {
            position: new google.maps.LatLng(25.75654, 73.5224),
            type: 'info'
          } 
		]
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 6.5,
			center: new google.maps.LatLng(27.199824, 75.756018),
		});
		var iconBase = 'https://farm5.staticflickr.com/';
		var icons = {
		  parking: {
			icon: iconBase+'4780/25840759007_e45d18e8a9_s.jpg'
		  },
		  info:{
		  icon:iconBase+'4774/38902265840_ce6df30616_s.jpg'
		}};
		features.forEach(function(feature) {
	        var marker = new google.maps.Marker({
	            position: feature.position,
	            icon: icons[feature.type].icon,
	            map: map
	          });
	        });
		var centerMarker = new google.maps.Marker({
			  map: map,
			  position: new google.maps.LatLng(26.441225998987104,73.72184121250007),
			  title: 'Some location'
			});
		// Add circle overlay and bind to marker
		/* var circle = new google.maps.Circle({
		  map: map,
		  radius: 425000,    // 10 miles in metres
		  fillColor: '#A9DBA5',
		  fillOpacity: 0.35,
		  strokeColor: '#9AC896',
          strokeOpacity: 1,
          strokeWeight: 1
          });
		circle.bindTo('center', centerMarker, 'position');
       */ } 
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1veb894TYsp0Vzgj4QFcr-aCI3WZ0c5c&callback=initMap">
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/js/materialize.min.js"></script>
    <script src="js/index.js"></script>
</body>

</html>