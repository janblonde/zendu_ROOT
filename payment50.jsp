<%@ page import ="java.sql.*" %>
<%@ page import ="java.security.*" %>
<%@ page import ="java.math.*" %>
<%@ page import ="com.mycompany.myfileupload.CreatePaymentRequest" %>
<%@ page import ="java.math.BigInteger" %>
<%@ page import ="java.security.SecureRandom" %>
<%@ page import ="com.mycompany.myfileupload.Properties" %>


<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=iso-8859-1" pageEncoding="iso-8859-1"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Zendu | Aangetekende brieven</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Retina.js - Load first for faster HQ mobile images. -->
    <script src="assets/js/plugins/retina/retina.min.js"></script>
    <!-- Font Awesome -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Default Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Roboto:900,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,600,500,700,800,900' rel='stylesheet' type='text/css'>
    <!-- Modern Style Fonts (Include these is you are using body.modern!) -->
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
    <!-- Vintage Style Fonts (Include these if you are using body.vintage!) -->
    <link href='http://fonts.googleapis.com/css?family=Sanchez:400italic,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
    <!-- Plugin CSS -->
    <link href="assets/css/plugins/owl-carousel/owl.carousel.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/owl-carousel/owl.theme.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/owl-carousel/owl.transitions.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/magnific-popup.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/background.css" rel="stylesheet" type="text/css">
    <link href="assets/css/plugins/animate.css" rel="stylesheet" type="text/css">
    <!-- Vitality Theme CSS -->
    <!-- Uncomment the color scheme you want to use. -->
    <link href="assets/css/vitality-red.css" rel="stylesheet" type="text/css">
    <!-- <link href="assets/css/vitality-aqua.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-blue.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-green.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-orange.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-pink.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-purple.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-tan.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-turquoise.css" rel="stylesheet" type="text/css"> -->
    <!-- <link href="assets/css/vitality-yellow.css" rel="stylesheet" type="text/css"> -->
    <!-- IE8 support for HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<!-- Alternate Body Classes: .modern and .vintage -->

<body id="page-top">
<%
    //ResultSet rs2 = null;
    //String naam = "";
    String SOAPresponse = "";
    String orderRef = "";

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    response.sendRedirect("aangetekende-brief.jsp");
}else{

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c9", Properties.username, Properties.password);
    
    Statement st = con.createStatement();
    ResultSet rs1;
    rs1 = st.executeQuery("select * from Members where email='" + (String)session.getAttribute("userid") + "';");
    
    if (rs1.next()){
        String memberID = rs1.getString("id");
        String first_name = rs1.getString("first_name");
        String last_name = rs1.getString("last_name");
        String email = rs1.getString("email");
        String streetname = rs1.getString("streetname");
        String streetnumber = rs1.getString("streetnumber");
        String zipcode = rs1.getString("zipcode");
        String city = rs1.getString("city");

        //SecureRandom random = new SecureRandom();
        //String myRandom = new BigInteger(130, random).toString(6);
        
        //orderRef = memberID + random;
        
        String SQL = "INSERT INTO CreditLog (member_id, amount, status) VALUES(?,'50','open')";
        PreparedStatement statement = con.prepareStatement(SQL,Statement.RETURN_GENERATED_KEYS);
        statement.setString(1,memberID);
    
        statement.execute();
        ResultSet rs2 = statement.getGeneratedKeys();
                        
        if(rs2.next()){
            orderRef = Integer.toString(rs2.getInt(1));
        }

        CreatePaymentRequest.myOrderRef = "C" + orderRef;
        CreatePaymentRequest.myClientID = memberID;
        CreatePaymentRequest.myFirst = first_name;
        CreatePaymentRequest.myLast = last_name;
        CreatePaymentRequest.myEmail = email;
        CreatePaymentRequest.myStreet = streetname;
        CreatePaymentRequest.myHouseNumber = streetnumber;
        CreatePaymentRequest.myPostalCode = zipcode;
        CreatePaymentRequest.myCity = city;
        CreatePaymentRequest.myAmount = "42500";
    
        SOAPresponse = CreatePaymentRequest.makeCall();
    }
    
}%>

    <nav class="navbar navbar-inverse navbar-fixed">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">
                    Zen<span style="color:firebrick">du</span>
                </a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a class="page-scroll" href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="profile.jsp"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="credits.jsp"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="invoices.jsp"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="aangetekende-brief.jsp"></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <header>
        <div class="intro-content" style="top:150px;">


<FORM id="paymentform" METHOD="post" ACTION="https://secure.docdatapayments.com/ps/menu" id=form1 name=form1>
<INPUT type="hidden" NAME="payment_cluster_key" value="<%=SOAPresponse%>">
<INPUT type="hidden" NAME="merchant_name" VALUE="zendu_be">
<INPUT type="hidden" NAME="return_url_success" VALUE="https://www.zendu.be/credits.jsp?order=<%=orderRef%>">
<!--<INPUT type="hidden" NAME="return_url_success" VALUE="https://java-tomcat-janblonde.c9.io/credits.jsp?order=<%=orderRef%>">-->
<INPUT type="hidden" NAME="return_url_canceled" VALUE="https://www.zendu.be/credits.jsp">
<INPUT type="hidden" NAME="return_url_error" VALUE="https://www.zendu.be/credits.jsp">
<input type="submit" value="SUBMIT" id="submit2" name="submit2" hidden>
</form>
            
        </div>
        
    </header>

    <!-- Core Scripts -->
    <script src="assets/js/jquery.js"></script>
 
    <script>
    $(document).ready(function(){
      $("#paymentform").submit();
    });
    </script>
</body>

</html>
