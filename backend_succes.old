<%@ page import ="java.sql.*" %>

<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {%>
<a href="new.jsp">Nieuwe brief</a>
<table><%
    String userid = (String)session.getAttribute("userid");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c9", "janblonde", "");
    Statement st = con.createStatement();
    ResultSet rs1;
    rs1 = st.executeQuery("select * from Members where email='" + userid + "';");
    
    if (rs1.next()){
        String memberID = rs1.getString("id");
        out.println(memberID);
        
        ResultSet rs2 = st.executeQuery("select * from Brieven where member_id=" + memberID + ";");
        while (rs2.next()){%>
            <tr>
              <td><%=rs2.getString("destinationLastName")%></td>
              <td><%=rs2.getString("destinationFirstName")%></td>
              <td><%=rs2.getString("destinationStreetName")%></td>
              <td><%=rs2.getString("destinationStreetNumber")%></td>
              <td><%=rs2.getString("destinationZipCode")%></td>
              <td><%=rs2.getString("destinationCity")%></td>
              <td><%=rs2.getString("destinationEmail")%></td>
              <td><%=rs2.getString("status")%></td>
              <td><a href="#">Link to Letter</a></td>
              <td><a href="#">Link to Leaflet</a></td>
            </tr>
        <%}
    }}
%></table>