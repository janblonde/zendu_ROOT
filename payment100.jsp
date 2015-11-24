<%@ page import ="java.sql.*" %>
<%@ page import ="java.security.*" %>
<%@ page import ="java.math.*" %>
<%@ page import ="com.mycompany.myfileupload.CreatePaymentRequest" %>

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
    String returnPage = "";
    String orderRef = "";

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    response.sendRedirect("index.jsp");
}else{

    CreatePaymentRequest.myOrderRef = session.getAttribute("orderref").toString();
    CreatePaymentRequest.myClientID = session.getAttribute("clientid").toString();
    CreatePaymentRequest.myFirst = (String)session.getAttribute("first");
    CreatePaymentRequest.myLast = (String)session.getAttribute("last");
    CreatePaymentRequest.myEmail = (String)session.getAttribute("email");
    CreatePaymentRequest.myStreet = (String)session.getAttribute("street");
    CreatePaymentRequest.myHouseNumber = (String)session.getAttribute("housenumber");
    CreatePaymentRequest.myPostalCode = (String)session.getAttribute("postalcode");
    CreatePaymentRequest.myCity = (String)session.getAttribute("city");
    
    SOAPresponse = CreatePaymentRequest.makeCall();
    returnPage = (String)session.getAttribute("returnpage");
    orderRef = session.getAttribute("orderref").toString();
    
    session.removeAttribute("orderref");
    session.removeAttribute("clientid");
    session.removeAttribute("first");
    session.removeAttribute("last");
    session.removeAttribute("email");
    session.removeAttribute("street");
    session.removeAttribute("housenumber");
    session.removeAttribute("postalcode");
    session.removeAttribute("city");
    session.removeAttribute("returnpage");
    
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
                        <a class="page-scroll" href="index.jsp"></a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <header>
        <div class="intro-content" style="top:150px;">


<FORM id="paymentform" METHOD="post" ACTION="https://test.docdatapayments.com/ps/menu" id=form1 name=form1>
<INPUT type="hidden" NAME="payment_cluster_key" value="<%=SOAPresponse%>">
<INPUT type="hidden" NAME="merchant_name" VALUE="zendu_be">
<% if ("letters".equals(returnPage)){ %>
  <INPUT type="hidden" NAME="return_url_success" VALUE="http://java-tomcat-janblonde.c9.io/zendu/success.jsp?orderID=<%=orderRef%>">
<%}else{ %>
  <INPUT type="hidden" NAME="return_url_success" VALUE="http://java-tomcat-janblonde.c9.io/zendu/credits.jsp">
<%}%>
<INPUT type="hidden" NAME="return_url_canceled" VALUE="http://java-tomcat-janblonde.c9.io/zendu/success.jsp">
<INPUT type="hidden" NAME="return_url_error" VALUE="http://java-tomcat-janblonde.c9.io/zendu/success.jsp">
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
