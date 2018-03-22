<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rajasthan Tourism</title>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.4/css/materialize.min.css">
	    <link rel='stylesheet' type='text/css' href='css/style.css'>
	    <link rel="icon" href="images/favicon.png" sizes="16x16" type="image/x-icon">
	    <script type="text/javascript" src="js/instascan.min.js"></script>
    </head>
    
    <body class='center'>
        <h3>Scan your QR code using camera !</h3>
        <video id="preview"></video>
	    <form action="verifyDetails.jsp" method="post" >
	        <input type="hidden" name="PRN" value="" id="PRN">
	        <button type="submit" id="submit" style="display:none"></button>
	    </form>
	    
    <script type="text/javascript">
	    let scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
	    scanner.addListener('scan', function (content) 
	    {
	        console.log(content);
	        var PRN=document.getElementById("PRN").value=content;
	        console.log(PRN);
	        document.getElementById("submit").click();
	    });
	    Instascan.Camera.getCameras().then(function (cameras) 
	    {
	        if (cameras.length > 0) 
	        {
	            scanner.start(cameras[0]);
	        } 
	        else 
	        {
	            console.error('No cameras found.');
	        }
	        }).catch(function (e) 
	        {
	          console.error(e);
	        });
    </script>
    
	<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-alpha.2/js/materialize.min.js"></script>
</body>
</html>
