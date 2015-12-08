<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" %>
<html lang="nl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="Aangetekende brief">
    <meta name="author" content="Zendu Aangetekende brieven versturen">
    <title>Zendu | Aangetekende brief verzenden</title>
    <!-- Bootstrap Core CSS -->
    <link href="assets/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!-- Retina.js - Load first for faster HQ mobile images. -->
    <script src="assets/js/plugins/retina/retina.min.js"></script>
    <link href="favicon.ico" rel="icon" type="image/x-icon" />
	<link href="favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <!-- Font Awesome -->
    <link href="assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!-- Default Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Roboto:900,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,600,500,700,800,900' rel='stylesheet' type='text/css'>
    <!-- Modern Style Fonts (Include these is you are using body.modern!) -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
    <!-- Vintage Style Fonts (Include these if you are using body.vintage!) -->
    <link href='https://fonts.googleapis.com/css?family=Sanchez:400italic,400' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Cardo:400,400italic,700' rel='stylesheet' type='text/css'>
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
    <!-- Navigation -->
    <!-- Note: navbar-default and navbar-inverse are both supported with this theme. -->
    <nav class="navbar navbar-inverse navbar-fixed-top navbar-expanded">
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
                        <a class="page-scroll" href="#aangetekende brief">Hoe werkt het</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#brief">Starten</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#verzenden">Over Ons</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#pricing">Prijzen</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    <header style="background-image: url('assets/img/bg-header.jpg');">
        <div class="intro-content">
<!--            <img src="assets/img/profile.png" class="img-responsive img-centered" alt="">-->
            <div class="brand-name">Zen<span style="color:firebrick">du</span></div>
            <hr class="colored">
            <div class="brand-name-subtext">Aangetekende brieven digitaal <br>verzenden en beheren.</div>          
        </div>
        
        <div class="login-form">
            
            <form method="post" action="login.jsp" id="login_form">
                <input id="email" type="text" class="login-input" placeholder=" email" name="email" tabindex="1"></input><br>
                <input id="pass" type="password" class="login-input" placeholder=" paswoord" name="pass" tabindex="2"></input><br>            
                <button id="login" type="submit" class="btn btn-outline-light page-scroll" tabindex="3" value="LOGIN">Login</button>
                <div id="reset2" class="btn btn-outline-light page-scroll" tabindex="4" style="display:none;">Reset paswoord</div>
            </form>
            <br>
            <% String loginmessage = ""; if(null!=session.getAttribute("loginmessage")) loginmessage = (String)session.getAttribute("loginmessage");%>
            <a id="reset1" href="#" class="passwordlink"><%=loginmessage%>Paswoord vergeten?</a>
            <a id="back1" href="#" class="passwordlink" style="display:none;">Terug naar login scherm</a>
        </div>
    
        <div class="getstarted-form">
            
        <form><a class="page-scroll login-btn" href="#brief">Start gratis</a>
        </form>
        </div>
        
        <div class="scroll-down">
            <a class="btn page-scroll" href="#aangetekende"><i class="fa fa-angle-down fa-fw"></i></a>
        </div>
        
        <div id="feedback">
        	<div id="feedback-form" style='display:none;' class="col-xs-4 col-md-4 panel panel-default">
        		<form method="POST" action="/feedback" class="form panel-body" role="form">
        			<div class="form-group">
        				<input class="form-control" name="email" autofocus placeholder="Uw e-mail (optioneel)" type="email" />
        				<input name="screen" type="hidden" value="aangetekende-brief.jsp"/>
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
    <section id="aangetekende brief">
        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-lg-12 wow fadeIn">
                    <h1>Hoe werkt het?</h1>
                    <p>Wij printen uw aangetekende brief en versturen aangetekend.</p>
                    <hr class="colored">
                </div>
            </div>
            <div class="row text-center content-row">
                <div class="col-md-3 col-sm-6 wow fadeIn" data-wow-delay=".2s">
                    <div class="about-content">
                        <i class="fa fa-edit fa-4x"></i>
                        <h3>U schrijft de brief en laadt hem op op de website.</h3>
                        <p style="text-align: left;">Opladen kan eenvoudig op de website: de eerste keer gratis, daarna na inloggen met uw e-mail en paswoord. <br>Door te werken met PDF-formaat kunnen we garanderen dat de brief correct wordt afgedrukt.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 wow fadeIn" data-wow-delay=".4s">
                    <div class="about-content">
                        <i class="fa fa-rocket fa-4x"></i>
                        <h3>Wij printen uw brief en versturen hem aangetekend via de reguliere post.</h3>
                        <p style="text-align: left;">Brieven opgeladen voor 15u00 worden dezelfde werkdag nog verstuurd, na 15u00 de volgende werkdag.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 wow fadeIn" data-wow-delay=".6s">
                    <div class="about-content">
                        <i class="fa fa-tablet fa-4x"></i>
                        <h3>Het verzendingsbewijs is digitaal beschikbaar in uw applicatie.</h3>
                        <p style="text-align: left;">Het verzendingsbewijs wordt door ons gearchiveerd en ingescand. Met uw persoonlijk inlog kan u al uw verstuurde brieven en bijhorende verzendingsbewijzen raadplegen.</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 wow fadeIn" data-wow-delay=".8s">
                    <div class="about-content">
                        <i class="fa fa-bullhorn fa-4x"></i>
                        <h3>De geadresseerde ontvangt zijn aangetekende brief.</h3>
                        <p style="text-align: left;">Op dezelfde manier alsof u de brief zelf naar het postkantoor had gebracht.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <aside class="cta-quote" style="background-image: url('assets/img/bg-aside.jpg');">
        <div class="container wow fadeIn">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <span class="quote"><span class="text-primary">"Legaal</span> verzenden en beheren van aangetekende brieven was nog nooit zo <span class="text-primary">eenvoudig.</span>"</span>
                    <hr class=" colored">
                    <a class="btn btn-outline-light page-scroll" href="#brief">Gratis starten</a>
                </div>
            </div>
        </div>
    </aside>
    <section id="brief" class="services">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-12 wow fadeIn">
                    <h2>starten</h2>
                    <hr class="colored">
                    <p>Probeer het uit en verzend 1 gratis aangetekende brief.</p>
                </div>
            </div>
            <div class="row content-row">
                
              <form id="upload" action="upload" method="post" enctype="multipart/form-data">
                <legend>Gegevens bestemmeling</legend>
                <div class="form-group">             
                  <input type="text" class="form-control valid" name="destinationfirstname" id="destinationfirstname" placeholder="Voornaam" style="width:40%">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control required" name="destinationlastname" id="destinationlastname" placeholder="Naam" style="width:40%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">             
                  <input type="text" class="form-control valid" name="destinationcompany" id="destinationcompany" placeholder="Bedrijf" style="width:40%">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control required" name="destinationstreetname" id="destinationstreetname" placeholder="Straatnaam"style="width:70%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control required" name="destinationstreetnumber" id="destinationstreetnumber" placeholder="Straatnummer" style="width:15%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control required" name="destinationzipcode" id="destinationzipcode" placeholder="Postcode" style="width:20%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control required" name="destinationcity" id="destinationcity" placeholder="Stad" style="width:40%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">
                  <input type="email" class="form-control valid" name="destinationEmail" id="destinationEmail" placeholder="E-mail adres" style="width:40%">
                </div>
                <legend>Te verzenden brief - laad hier uw PDF document op.</legend>
                <div class="form-group">
                  <input id="file" name="file" type="file" class="file" accept="application/pdf">
                  <span class="error"><br>Gelieve een PDF document op te laden<br>Dus graag uw document eerst opslaan in PDF formaat en het dan opladen op de website via bovenstaande knop.</span>
                </div>
                <legend>Uw gegevens</legend>
                <div class="form-group">             
                  <input type="text" class="form-control valid" name="senderfirstname" id="senderfirstname" placeholder="Voornaam" style="width:40%">
                </div>
                <div class="form-group">
                  <input type="text" class="form-control required" name="senderlastname" id="senderlastname" placeholder="Naam" style="width:40%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">             
                  <input type="text" class="form-control valid" name="sendercompany" id="sendercompany" placeholder="Bedrijf" style="width:40%">
                </div>
                <div class="form-group">             
                  <input type="text" class="form-control valid" name="sendervat" id="sendervat" placeholder="BTW-nummer" style="width:40%">
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control required" name="senderstreetname" id="senderstreetname" placeholder="Straatnaam" style="width:70%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control required" name="senderstreetnumber" id="senderstreetnumber" placeholder="Straatnummer" style="width:15%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">              
                  <input type="text" class="form-control required" name="senderzipcode" id="senderzipcode" placeholder="Postcode" style="width:20%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control required" name="sendercity" id="sendercity" placeholder="Stad" style="width:40%">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">
                  <input id="senderemail" type="email" class="form-control required" name="senderemail" placeholder="E-mail adres" style="width:40%">
                  <span class="error">Gelieve een geldig email adres in te geven</span>
                  <p class="error"><br>Dit e-mail adres is reeds geregistreerd. <br>Kies een ander e-mail adres of login hierboven. </p>
                </div>
                <div class="form-group">
                  <input id="senderpassword" type="password" class="form-control required" name="senderpassword" placeholder="Kies een paswoord">
                  <span class="error">Dit is een verplicht veld</span>
                </div>
                <div class="form-group">
                  <input id="senderpasswordcheck" type="password" class="form-control required valid" name="senderpasswordcheck" placeholder="Herhaal het paswoord">
                  <p class="error"><br>De door u ingevulde paswoorden verschillen. Graag even nakijken aub.</p>
                </div>
                <div id="success_test"></div>
                <div class="form-group">
                  <input id="payment_test" type="submit" class="btn btn-lg btn-default" value="verzenden"/>
                  <a id="closebutton" class="btn btn-lg btn-default">Cancel</a><br>
                </div>
              </form>
            </div>
        </div>
    </section>
    <section id="verzenden" class="bg-gray">
        <div class="container text-center wow fadeIn">
            <h2>Over ons</h2>
            <hr class="colored">
            <p style="text-align:left">We zijn ervan overtuigd dat het verzenden van aangetekende brieven makkelijker moet kunnen. De verplichte trip naar het postkantoor is tijdrovend en onefficiënt.</p>
            <p style="text-align:left">Maar ook het beheer van de verstuurde brieven kan beter en vooral eenvoudiger. Het huidig systeem van afgestempelde verzendingsbewijzen is achterhaald, omslachtig en werkt fouten in de hand.</p>
            <p style="text-align:left">Dat kan beter.  We maakten daarom een toepassing die u toelaat uw brief in pdf formaat op te laden en waarbij wij de verdere stappen van het proces van aangetekende verzending afhandelen. Resultaat: tijdswinst, foutloze afhandeling en efficiënt beheer van bewijs.</p>
            <p style="text-align:left">Daarnaast willen we nog een stap verder gaan. De EU Richtlijn 910/2014 laat toe om op legale wijze aangetekende brieven via elektronische weg te verzenden en dit vanaf 1 juli 2016. Onze technologie laat toe om tegen dan het verzenden van uw aangetekende brief volledig elektronisch af te handelen.
            Dit betekent een fundamenteel lagere kostprijs, een snellere afhandeling én aangetekende brieven verzenden binnen heel Europa.</p>
        </div>
    </section>
    <section id="pricing" class="pricing" style="background-image: url('assets/img/bg-pricing.jpg')">
        <div class="container wow fadeIn">
            <div class="row text-center">
                <div class="col-lg-12">
                    <h2>Prijzen</h2>
                    <hr class="colored">
                    <!--<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eum, quae, laborum, voluptate delectus odio doloremque error porro obcaecati nemo animi ducimus quaerat nostrum? Ab molestiae eaque et atque architecto reiciendis.</p>-->
                </div>
            </div>
            <div class="row content-row">
                <div class="col-md-4">
                    <div class="pricing-item featured-first">
                        <h3>Basic</h3>
                        <hr class="colored">
                        <div class="price"><span class="number">9.80<sup>&euro;</sup></span> / brief</div>
                        <ul class="list-group">
                            <li class="list-group-item">1 individuele brief</li>
                            <li class="list-group-item">Maximum 10 pagina's</li>
                            <li class="list-group-item">Opgeladen voor 15u00, dezelfde dag aangetekend verzonden</li>
                            <li class="list-group-item">Uw eerste aangetekende brief is gratis</li>
                        </ul>
                        <a href="#brief" class="btn btn-outline-dark">Starten</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pricing-item featured">
                        <h3>Plus</h3>
                        <hr class="colored">
                        <div class="price"><span class="number">8.80<sup>&euro;</sup></span> / brief</div>
                        <ul class="list-group">
                            <li class="list-group-item">Pakket van <strong>10</strong> brieven</li>
                            <li class="list-group-item">Totaal: 88 &euro;, inc. BTW</li>
                            <li class="list-group-item">Opgeladen voor 15u00, dezelfde dag aangetekend verzonden</li>
                        </ul>
                        <a href="#" class="btn btn-outline-dark">Log in om te bestellen</a>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="pricing-item featured-last">
                        <h3>Premium</h3>
                        <hr class="colored">
                        <div class="price"><span class="number">8.50<sup>&euro;</sup></span> / brief</div>
                        <ul class="list-group">
                            <li class="list-group-item">Pakket van 50 brieven</li>
                            <li class="list-group-item">Totaal: 425 &euro;, inc. BTW</li>
                            <li class="list-group-item">Opgeladen voor 15u00, dezelfde dag aangetekend verzonden</li>
                        </ul>
                        <a href="#" class="btn btn-outline-dark">Log in om te bestellen</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="cta-form bg-dark">
        <div class="container text-center">
            <h3>Laat je e-mail hieronder achter.</h3>
            <hr class="colored">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2">
                    <!-- MailChimp Signup Form -->
                    <div id="mc_embed_signup">
                        <!-- Replace the form action in the line below with your MailChimp embed action! For more informatin on how to do this please visit the Docs! -->
                            <div class="input-group input-group-lg">
                                <input type="email" name="EMAIL" class="form-control" id="mce-EMAIL" placeholder="Email address...">
                                <span class="input-group-btn">
                                    <button type="submit" name="subscribe" id="mc-embedded-subscribe" class="btn btn-primary">Hou me op de hoogte!</button>
                                </span>
                            </div>
                            <div id="mce-responses">
                                <div class="response" id="mce-error-response" style="display:none"></div>
                                <div class="response" id="mce-success-response" style="text-align:left;"></div>
                            </div>
                    </div>
                    <!-- End MailChimp Signup Form -->
                </div>
            </div>
        </div>
    </section>
    <section id="contact">
        <div class="container wow fadeIn">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Contacteer ons</h2>
                    <hr class="colored">
                    <p></p>
                </div>
            </div>
            <div class="row content-row">
                <div class="col-lg-8 col-lg-offset-2">
                    <form name="sentMessage" id="contactForm" novalidate>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Naam</label>
                                <input type="text" class="form-control" placeholder="Naam" id="name" required data-validation-required-message="Laat uw naam achter aub.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Email Adres</label>
                                <input type="email" class="form-control" placeholder="Email" id="email" required data-validation-required-message="Laat uw email achter aub.">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Telefoonnummer</label>
                                <input type="tel" class="form-control" placeholder="Telefoonnummer" id="phone">
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <div class="row control-group">
                            <div class="form-group col-xs-12 floating-label-form-group controls">
                                <label>Boodschap</label>
                                <textarea rows="5" class="form-control" placeholder="Boodschap" id="message" required data-validation-required-message="Laat een boodschap achter aub."></textarea>
                                <p class="help-block text-danger"></p>
                            </div>
                        </div>
                        <br>
                        <div id="success"></div>
                        <div class="row">
                            <div class="form-group col-xs-12">
                                <button type="submit" class="btn btn-outline-dark">Verzenden</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
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
                       Huybrechtsstraat 76<br>
                       2140 Borgerhout</p>
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
    <script src="assets/js/feedback.js"></script>
    <!-- Vitality Theme Scripts -->
    <script src="assets/js/vitality.js"></script>
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
    
      ga('create', 'UA-69587403-1', 'auto');
      ga('send', 'pageview');
    </script>
</body>

</html>
