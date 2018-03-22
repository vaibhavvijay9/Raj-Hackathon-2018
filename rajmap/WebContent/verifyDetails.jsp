<%@ page import="java.sql.*" %>
<%@ page import="rajmap.DBInfo" %>
<html>
    <body>
        <%
           String PRN=request.getParameter("PRN");
           String name="";
           int persons=0;
           String query="select * from bookings where prn=? AND visit_status=?";
           Connection con=DBInfo.getConn();
           PreparedStatement ps=con.prepareStatement(query);
           ps.setString(1,PRN);
           ps.setString(2,"Unvisited");
           try
           {
               ResultSet rs=ps.executeQuery();
               int flag=0;
               while(rs.next())
               {
                 name=rs.getString(3);
                 persons=rs.getInt(6);
                 flag=1;
               }
               if(flag==1)
               {
                   session.setAttribute("PRN",PRN);
                   session.setAttribute("name",name);
                   session.setAttribute("persons",persons);
                   response.sendRedirect("verificationDone.jsp");
               }
               else
                   response.sendRedirect("verificationFailed.jsp");
           }
           catch(Exception e)
           {
               e.printStackTrace();
           }
        %>
    </body>
</html>