<%@ page import ="java.sql.*" %>
<%@ page import ="com.mycompany.myfileupload.Properties" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Zendu | Facturen</title>
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
    <link href="assets/css/feedback.css" rel="stylesheet" type="text/css">
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
    boolean successfulPayment = false;
    boolean testUser = false;

if (null == (session.getAttribute("userid")) || ("" == session.getAttribute("userid"))) {
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

        rs2 = st.executeQuery("select * from Invoices where member_id=" + memberID + " ORDER BY id DESC;");
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
            <button type="submit" class="btn btn-outline-dark" onclick="window.location.href='new.jsp'" style="position:relative;top:80px;left:80px">Nieuwe aangetekende brief</button><br><br>
        </div>
        
    <section id="process" class="services">
        <div class="container">        
            <div class="row content-row">
            <legend>Overzicht van facturen</legend>
            
            <table id="hor-minimalist-b">
            <thead>
              <tr>
                <th scope="col">Factuurnummer</th>
                <th scope="col">Omschrijving</th>
                <th scope="col">Bedrag</th>
                <th scope="col">Datum</th>
                <th scope="col">Download</th>
              </tr>
            </thead>
            <tbody>
            <%while (rs2.next()){%>
                <tr>
                  <td style="color:black;">F<%=rs2.getInt("id")%></td>
                  <td style="color:black;"><%=rs2.getString("title")%></td>
                  <td style="color:black;"><%=rs2.getString("amount")%></td>
                  <td style="color:black;"><%=rs2.getString("reg_date").substring(0,16)%></td>
                  <td style="color:black;"><a href="documentservlet?docid=<%=rs2.getInt("id")%>&doctype=factuur" target="_blank"><img src="assets/img/ico_pdf.png" height=30px width=30px/></a></td>   
                </tr>
            <%}%>
            </tbody>
            </table>
        </div>
        </div>
    </section>

        <div class="intro-content">
            <br>

        </div>
        
        <div class="login-form">
        </div>
    
        <div class="getstarted-form">
        </div>
    
    
        
        <div class="scroll-down">
            <a class="btn page-scroll" href="#about"><i class="fa fa-angle-down fa-fw"></i></a>
        </div>
        
        <div id="feedback">
        	<div id="feedback-form" style='display:none;' class="col-xs-4 col-md-4 panel panel-default">
        		<form method="POST" action="/feedback" class="form panel-body" role="form">
        			<div class="form-group">
        				<input class="form-control" name="email" autofocus placeholder="Uw e-mail (optioneel)" type="email" />
        				<input name="screen" type="hidden" value="invoices.jsp"/>
        			</div>
        			<div class="form-group">
        				<textarea class="form-control" name="body" required placeholder="Graag uw feedback hier ..." rows="5"></textarea>
        			</div>
        			<button class="btn btn-primary pull-right" type="submit">Verzend</button>
        		</form>
        	</div>
        	<div id="feedback-tab">Feedback</div>
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
                    <p>BVBA CEEJAY<br>
                       Huybrechtsstraat 76
                        <br>2140 Borgerhout</p>
                </div>
                <div class="col-md-4 contact-details">
                    <h4><i class="fa fa-envelope"></i> Email</h4>
                    <p><a href="mailto:mail@example.com">info@zendu.be</a>
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
    <%}%>
</body>

</html>
