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

<%
try
{
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/c9";
String username=Properties.username;
String password=Properties.password;
String query="select * from Brieven where id=" + request.getParameter("id");
Connection conn=DriverManager.getConnection(url,username,password);
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery(query);
while(rs.next())
{
%>
    <h1>ID: <%= request.getParameter("id") %></h1><br>
    <form action="uploadleaflet" method="post" enctype="multipart/form-data">
      <input type="hidden" name="id" value="<%= request.getParameter("id") %>"/>
      Last Name: <input type="text" name="destinationlastname" value="<%=rs.getString("destinationLastName")%>"/><br>
      First Name: <input type="text" name="destinationfirstname" value="<%=rs.getString("destinationFirstName")%>"/><br><br><br>
      <input type="file" name="file" />
      <input type="submit" value="upload" />
    </form>
<%
}
    rs.close();
    stmt.close();
    conn.close();
}catch(Exception e){
    e.printStackTrace();
}
%>

</html> 