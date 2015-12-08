<%@ page import ="java.sql.*" %>
<%@ page import ="org.mindrot.jbcrypt.BCrypt" %>
<%@ page import ="com.mycompany.myfileupload.Properties" %>
<%
    String email = request.getParameter("email");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c9", Properties.username, Properties.password);
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from Members where email='" + email + "';");
    
    if (rs.next()){
        String hashed = rs.getString("pass");
        String firstName = rs.getString("first_name");
        String lastName = rs.getString("last_name");
    
        if (BCrypt.checkpw(pwd, hashed)){
	        session.setAttribute("userid",email);
	        session.setAttribute("naam", firstName + " " + lastName);
	        session.setAttribute("loginmessage","");
	        response.sendRedirect("success.jsp");
        }else{
            session.setAttribute("loginmessage", "Dit is een ongeldige email/paswoord combinatie. ");
	        response.sendRedirect("aangetekende-brief.jsp");
	    }

    } else {
        session.setAttribute("loginmessage", "Dit is een ongeldige email/paswoord combinatie. ");
        response.sendRedirect("aangetekende-brief.jsp");
    }
%>