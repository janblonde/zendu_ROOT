<%@ page import ="java.sql.*" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
    String userid = (String)session.getAttribute("userid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c9", "janblonde", "");
    Statement st = con.createStatement();
    ResultSet rs1;
    rs1 = st.executeQuery("select * from Members where email='" + userid + "';");
    if (rs1.next()){ %>
<html>
<head>
</head>
<body>
      <section class="module content">
        <div id="form1" class="container">
          <h2>Document verzenden</h2>
            <div class="well bs-component">                      
              <form action="upload" method="post" enctype="multipart/form-data">
                <legend>Gegevens bestemmeling</legend>
                <div class="form-group">             
                  <input type="text" class="form-control" name="destinationfirstname" placeholder="Voornaam">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="destinationlastname" placeholder="Naam">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control" name="destinationstreetname" placeholder="Straatnaam">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control" name="destinationstreetnumber" placeholder="Straatnummer">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control" name="destinationzipcode" placeholder="Postcode">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="destinationcity" placeholder="Stad">
                </div>
                <div class="form-group">
                  <input type="email" class="form-control" name="destinationEmail" placeholder="E-mail adres">
                </div>
                <legend>Te verzenden document</legend>
                <div class="form-group">
                  <input id="input-1" name="file" type="file" class="file">
                </div>
                <legend>Uw gegevens</legend>
                <div class="form-group">             
                  <input type="text" class="form-control" name="senderfirstname" placeholder="Voornaam" value="<%=rs1.getString("first_name")%>">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="senderlastname" placeholder="Naam" value="<%=rs1.getString("last_name")%>">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control" name="senderstreetname" placeholder="Straatnaam">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control" name="senderstreetnumber" placeholder="Straatnummer">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control" name="senderzipcode" placeholder="Postcode">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control" name="sendercity" placeholder="Stad">
                </div>
                <div class="form-group">
                  <input type="submit" class="btn btn-lg btn-default" value="verzenden"/>
                  <a id="closebutton" class="btn btn-lg btn-default">Cancel</a><br>
                </div>
              </form>
          </div>
        </div>
      </section>
</body>
</html>
<%}}%>
