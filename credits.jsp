<%@ page import ="java.sql.*" %>
<%@ page import ="java.security.*" %>
<%@ page import ="java.math.*" %>
<%@ page import ="com.mycompany.myfileupload.Properties" %>
<%@ page import ="com.mycompany.myfileupload.GenerateInvoice" %>

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
    ResultSet rs2 = null;
    String naam = "";
    String orderID = "";
    String result10 = "";
    String result50 = "";
    String result100 = "";
    boolean successfulPayment = false;
    
    int huidigTotaal = 0;

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
    response.sendRedirect("aangetekende-brief.jsp");
}else{
    String userid = (String)session.getAttribute("userid");
    naam = (String)session.getAttribute("naam");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/c9", Properties.username, Properties.password);
    
    Statement st = con.createStatement();
    ResultSet rs1;
    rs1 = st.executeQuery("select * from Members where email='" + userid + "';");
    
    if (rs1.next()){
        String memberID = rs1.getString("id");
        orderID = memberID;
        
        if(null!=request.getParameter("order")){
            String orderRef = request.getParameter("order");
            Statement paymentStatement = con.createStatement();
            paymentStatement.executeUpdate("UPDATE CreditLog set status = 'paid' where id='" + orderRef + "';");
            successfulPayment = true;
            
            //generate invoice
            GenerateInvoice generator = new GenerateInvoice();
            generator.generateForCredits(orderRef);
        }
        
        ResultSet rs3 = st.executeQuery("select SUM(amount) as huidigTotaal from CreditLog where status = 'paid' and member_id=" + memberID +";");
        if (rs3.next()){
            huidigTotaal = rs3.getInt("huidigTotaal");
        }

        rs2 = st.executeQuery("select * from CreditLog where status = 'paid' and member_id=" + memberID + " ORDER BY reg_date DESC;");
        
    }%>


    <!-- Navigation -->
    <!-- Note: navbar-default and navbar-inverse are both supported with this theme. -->
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
                <a class="navbar-brand page-scroll" href="success.jsp">
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
                        <a class="page-scroll" href="profile.jsp">Welkom <%=naam%></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="credits.jsp">Credits</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="invoices.jsp">Facturen</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="aangetekende-brief.jsp">Uitloggen</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <header>
        <div>
            <button type="submit" class="btn btn-outline-dark" id="payment_button" style="position:relative;top:80px;left:80px">Credits aankopen</button><br><br>
            <div id="payment_choices" style="position:relative;top:25px;left:350px" hidden>
              <a class="btn btn-lg btn-default" href="payment10.jsp">10 credits: 88 EUR
              </a>
              <div class="btn btn-lg btn-default" onclick="document.getElementById('paymentform50').submit();">50 credits: 425 EUR
              </div>
              <div class="btn btn-lg btn-default" onclick="document.getElementById('paymentform100').submit();">100 credits: 820 EUR
              </div>
            </div>
            
        </div>
        
        <section id="process" class="services">
        <div class="container">        
            <div class="row content-row">
            
            <legend>Historiek van verrichtingen</legend>
            
            <table id="hor-minimalist-b">
            <thead>
              <tr>
                <th scope="col">Datum</th>
                <th scope="col">Transactie</th>
                <th scope="col">Briefnummer</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="font-size:14px"><i>Huidig aantal: </i></td>
                <td style="font-size:14px;text-align:right;"><i><%=huidigTotaal%></i></td>
                <td></td>
              </tr>
            <%while (rs2.next()){%>
                <tr>
                  <td style="color:black;"><%=rs2.getString("reg_date").substring(0,16)%></td>
                  <td style="color:black;text-align:right;"><%=rs2.getString("amount")%></td>
                  <td style="color:black;"><%=rs2.getString("brief_id")%></td>
                </tr>
            <%}%>
            </tbody>
            </table>
        </div>
        </div>
    </section>
            
            <!--<div style="position:absolute;left:400px;top:80px;border-color:red;border-style:solid;padding:10px;border-radius:6px;border-width:2px;font-size:30px;">huidig aantal: </div>-->

        
        <div class="intro-content">

        </div>
        
        <div class="login-form">
        <FORM id="paymentform10" METHOD="post" ACTION="https://secure.ogone.com/ncol/test/orderstandard.asp">
            <INPUT type="hidden" NAME="PSPID" value="zendu">
            <INPUT type="hidden" NAME="orderID" style="color:black" VALUE="<%=orderID%>">
            <INPUT type="hidden" NAME="amount" style="color:black" VALUE="8800">
            <INPUT type="hidden" NAME="currency" style="color:black" VALUE="EUR">
            <INPUT type="hidden" NAME="language" VALUE="en_US">
            <INPUT type="hidden" NAME="TITLE" VALUE="PAYMENT">
            <INPUT type="hidden" NAME="SHASIGN" VALUE="<%= result10 %>">
            <INPUT type="hidden" NAME="ACCEPTURL" VALUE="https://java-tomcat-janblonde.c9.io/zendu/credits.jsp">
            <input type="submit" value="SUBMIT" id=submit2 name=submit2 hidden>
        </FORM>
        <FORM id="paymentform50" METHOD="post" ACTION="https://secure.ogone.com/ncol/test/orderstandard.asp">
            <INPUT type="hidden" NAME="PSPID" value="zendu">
            <INPUT type="hidden" NAME="orderID" style="color:black" VALUE="<%=orderID%>">
            <INPUT type="hidden" NAME="amount" style="color:black" VALUE="42500">
            <INPUT type="hidden" NAME="currency" style="color:black" VALUE="EUR">
            <INPUT type="hidden" NAME="language" VALUE="en_US">
            <INPUT type="hidden" NAME="TITLE" VALUE="PAYMENT">
            <INPUT type="hidden" NAME="SHASIGN" VALUE="<%= result50 %>">
            <INPUT type="hidden" NAME="ACCEPTURL" VALUE="https://java-tomcat-janblonde.c9.io/zendu/credits.jsp">
            <input type="submit" value="SUBMIT" id=submit2 name=submit2 hidden>
        </FORM>
        <FORM id="paymentform100" METHOD="post" ACTION="https://secure.ogone.com/ncol/test/orderstandard.asp">
            <INPUT type="hidden" NAME="PSPID" value="zendu">
            <INPUT type="hidden" NAME="orderID" style="color:black" VALUE="<%=orderID%>">
            <INPUT type="hidden" NAME="amount" style="color:black" VALUE="82000">
            <INPUT type="hidden" NAME="currency" style="color:black" VALUE="EUR">
            <INPUT type="hidden" NAME="language" VALUE="en_US">
            <INPUT type="hidden" NAME="TITLE" VALUE="PAYMENT">
            <INPUT type="hidden" NAME="SHASIGN" VALUE="<%= result100 %>">
            <INPUT type="hidden" NAME="ACCEPTURL" VALUE="https://java-tomcat-janblonde.c9.io/zendu/credits.jsp">
            <input type="submit" value="SUBMIT" id=submit2 name=submit2 hidden>
        </FORM>
        </div>
    
        <div class="getstarted-form">
        </div>
    
    
        
        <div class="scroll-down">
            <a class="btn page-scroll" href="#about"><i class="fa fa-angle-down fa-fw"></i></a>
        </div>
    </header>

    <footer class="footer" style="background-image: url('assets/img/bg-footer.jpg')">
        <div class="container text-center">
            <div class="row">
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-phone"></i> Call</h4>
                    <p>0489 62 19 67</p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-map-marker"></i> Visit</h4>
                    <p>Huybrechtsstraat 76
                        <br>2140 Borgerhout</p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-envelope"></i> Email</h4>
                    <p><a href="mailto:mail@example.com">jan@zendu.be</a>
                    </p>
                </div>
            </div>
            <div class="row social">
                <div class="col-lg-12">
                    <ul class="list-inline">
                        <li><a href="#"><i class="fa fa-facebook fa-fw fa-2x"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-twitter fa-fw fa-2x"></i></a>
                        </li>
                        <li><a href="#"><i class="fa fa-linkedin fa-fw fa-2x"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row copyright">
                <div class="col-lg-12">
                    <p class="small">&copy; 2015 Zendu.be Aangetekende brieven</p>
                    <p class="small"><a href="disclaimer.html">Disclaimer</a> &nbsp &nbsp <a href="cookies.html">Cookies Policy</a></p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Core Scripts -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap/bootstrap.min.js"></script>
    <!-- Plugin Scripts -->
    <script src="assets/js/plugins/jquery.easing.min.js"></script>
    <script src="assets/js/plugins/classie.js"></script>
    <script src="assets/js/plugins/cbpAnimatedHeader.js"></script>
    <script src="assets/js/plugins/owl-carousel/owl.carousel.js"></script>
    <script src="assets/js/plugins/jquery.magnific-popup/jquery.magnific-popup.min.js"></script>
    <script src="assets/js/plugins/background/core.js"></script>
    <script src="assets/js/plugins/background/transition.js"></script>
    <script src="assets/js/plugins/background/background.js"></script>
    <script src="assets/js/plugins/jquery.mixitup.js"></script>
    <script src="assets/js/plugins/wow/wow.min.js"></script>
    <script src="assets/js/contact_me.js"></script>
    <script src="assets/js/plugins/jqBootstrapValidation.js"></script>
    <!-- Vitality Theme Scripts -->
    <script src="assets/js/vitality.js"></script>
    <!--<script>
        $(document).ready(function(){
            $("#payment_button").click(function(){
                $("#payment_options").toggle();
            });
        });
    </script>-->
<%}%>
</body>

</html>
