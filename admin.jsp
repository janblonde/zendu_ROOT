<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="com.mycompany.myfileupload.Properties" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
<form method="post">

<table border="2">
<tr>
<td>ID</td>
<td>LASTNAME</td>
<td>FIRSTNAME</td>
<td>STATUS</td>
<td>BRIEF</td>
<td>LEAFLET</td>
<td>ACTIE</td>
</tr>
<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/c9";
String username=Properties.username;
String password=Properties.password;
String query="select * from Brieven where status='paid';";
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
%>
    <tr><td><%=rs.getInt("id") %></td>
        <td><%=rs.getString("destinationLastName") %></td>
        <td><%=rs.getString("destinationFirstName") %></td>
        <td><%=rs.getString("status") %></td>
        <td><a href="brieven/<%=rs.getInt("id")%>.pdf">Download brief</a></td>
        <td><a href="leaflet/<%=rs.getInt("id")%>.pdf">Download leaflet</a></td>
        <td><a href="edit.jsp?id=<%=rs.getInt("id")%>">Edit</a></td></tr>
<%
}
%>
    </table>
<%
    rs.close();
    stmt.close();
    conn.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }
%>

</form>
</html> 