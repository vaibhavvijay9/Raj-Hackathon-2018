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
      <a href="#" class="brand-logo">Rajasthan Tourism</a>
      <ul id="nav-mobile" class="right hide-on-med-and-down">
        <li><a href="verify.jsp">Verify</a></li>
      </ul>
    </div>
  </nav>
	<div id="map"></div>
    <script>
        function initMap() {
			let mapZoomStatus=false;
        	var features = [
          <%
          		while(res.next())
				{
		  %>
					{
			            position: new google.maps.LatLng(<%=res.getDouble(4)%>,<%=res.getDouble(5)%>),
			            type: "<%=res.getString(8)%>",
			            title: "<%=res.getString(2)%>",
			            description: "<%=res.getString(3)%>",
			            location_id: "<%=res.getInt(1)%>"
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
		]
		
		var map = new google.maps.Map(document.getElementById('map'), {
			zoom: 6.5,
			center: new google.maps.LatLng(27.199824, 75.756018),
		});
		var iconBase = 'https://farm5.staticflickr.com/';
		var icons = {
		  palace: {
			icon: iconBase+'4772/40020335645_8691104d20_s.jpg'
		  },
		  wildlife: {
			icon: iconBase+'802/40914044941_d676cc1edd_s.jpg'
		  }};
		features.forEach(function(feature) {
	       var  marker = new google.maps.Marker({
	            position: feature.position,
	            icon: icons[feature.type].icon,
	            map: map,
	            title: feature.title
	          });
	       
	 		marker.addListener("click",function(){	
	 			let contentString =
					'<div id="content">' +
					'<div id="siteNotice">' +
					"</div>" +
					'<h6 id="firstHeading" class="firstHeading">'+feature.title +'</h6>' +
					'<div id="bodyContent">' +
					"<p>"+feature.description+
					'<form action="booking.jsp" method="post"><input type="hidden" name="id" value='+feature.location_id+'><input type="submit" class="btn-flat book-ticket-link" value="Book Tickets"></form>' +
					"</p></div></div>";
					let infowindow = new google.maps.InfoWindow({
					content: contentString
					});
						
				/* zoom-in & zoom-out */

				console.log(mapZoomStatus)
				if (!mapZoomStatus) 
				{
					infowindow.open(map,marker);
					map.setZoom(8.5);
					map.setCenter(marker.getPosition());
					mapZoomStatus = true;
				} 
				else 
				{
					infowindow.close(map, marker);
					map.setZoom(6.5);
					map.setCenter(marker.getPosition());
					mapZoomStatus = false;
				}
						
			})
		});
	}
    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA1veb894TYsp0Vzgj4QFcr-aCI3WZ0c5c&callback=initMap">
    </script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/js/materialize.min.js"></script>
    <script src="js/index.js"></script>
</body>

</html>