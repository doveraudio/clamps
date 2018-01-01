<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1">

<title>Homepage</title>
<link rel="icon" href="favicon.png" type="image/png">
<link rel="shortcut icon" href="favicon.ico" type="img/x-icon">

<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<link href="css/font-awesome.css" rel="stylesheet" type="text/css">
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<link href="css/animate.css" rel="stylesheet" type="text/css">

<!--[if IE]><style type="text/css">.pie {behavior:url(PIE.htc);}</style><![endif]-->

<script type="text/javascript" src="js/jquery.1.8.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-scrolltofixed.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/jquery.isotope.js"></script>
<script type="text/javascript" src="js/wow.js"></script>
<script type="text/javascript" src="js/classie.js"></script>

<!-- =======================================================
    Theme Name: Knight
    Theme URL: https://bootstrapmade.com/knight-free-bootstrap-theme/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
======================================================= -->

</head>
<body>
<header class="header" id="header"><!--header-start-->
	<div class="container">
    	<figure class="logo animated fadeInDown delay-07s">
        	<a href="#"><img src="img/logo.1.png" alt=""></a>	
        </figure>	
        <h1 class="animated fadeInDown delay-1s">CLAMPS</h1>
        <ul class="we-create animated fadeInUp delay-1s">
        	<li>A CentOS Linux Apache, MySQL, PHP Server.</li>
        </ul>
            <div>
<br/>
        <ul class="we-create">
            <li>
            <p>A self provisioning development environment with a pragmatic bash script for configuration.</p>
            <p></p>
           
<br/>
<br/>
</div>
    </div>
</header><!--header-end-->


<nav class="main-nav-outer" id="test"><!--main-nav-start-->
	<div class="container">
        <ul class="main-nav">
            <li><a href="#header">Home</a></li>
            <li><a href="#requirements">Requirements</a></li>
            <li class="small-logo"><a href="#header"><img src="img/small-logo.1.png" alt=""></a></li>
            <li><a href="#usage">Usage</a></li>
            <li><a href="#service">Services</a></li>
            </ul>
        <a class="res-nav_click" href="#"><i class="fa-bars"></i></a>
    </div>
</nav><!--main-nav-end-->

<section class="main-section" id="requirements">
    <div class="container">
        <h2>Requirements:</h2>
            <ul>
            <li>A Quadcore or better CPU (Machine requires at least 2 Cores)</li>
            <li>8 GB &gt; of RAM (4gb for VirtualMachine, extendable in Vagrantfile)</li>
            <li>Git</li>
            <li>VirtualBox</li>
            <li>Vagrant</li>
            </ul>
            <h2><a id="Recommendations_10"></a>Recommendations:</h2>
            <ul>
            <li><a href="https://conemu.github.io/">ConEmu-Maximus5</a> for Windows</li>
            <li><a href="http://guake-project.org/">Guake</a> for Fedora</li>
            <li><a href="https://netbeans.org/downloads/index.html">Netbeans IDE</a>: It let's you work with your virtual machine as if it's a remote server. Helpful for frameworks with sensitivity about file perrmissions.</li>
            <li>Comment out sections in <a href="https://github.com/doveraudio/clamps/blob/master/data/provision.sh">provision script</a> for systems you won’t use. <a href="https://neo4j.com/">Neo4j</a> only <strong>requires</strong> <a href="http://openjdk.java.net/install/">Java Open JDK 1.8 Jre</a>, not the entire SDK. So if you won’t use Java, comment out the section, and then remove it from the install line.</li>
            <li>Customize your version requirements. Though certain dependencies exist, if you are targeting those technologies you either know that or will find out! Change the repository information at the top of the provisioning script, and change the install version as needed.</li>
            </ul>
            </div>
</section>

<section class="main-section" id="usage"><!--main-section-start-->
	<div class="container">
            <h2>Usage:</h2>
            <p>Select a location on your system and execute:</p>
            <pre><code>git clone https://github.com/doveraudio/clamps.git .</code></pre>
            
            <pre><code>cd machine</code></pre>
            
            <pre><code>vagrant up</code></pre>
            
            <p>Log into the machine from the machine folder, with</p>
            <pre><code>vagrant ssh</code></pre>
    </div>
</section>

<section class="main-section" id="service"><!--main-section-start-->
	<div class="container">
    	<h2>Services</h2>
    	<h6>These are the services preinstalled.</h6>
        <div class="row wow fadeInLeft delay-05s"><!-- Row Start Apache and Mysql -->
        	<div class="col-lg-6 col-sm-6 ">
            	<div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://httpd.apache.org/">
                        <img class="brand-logo" src="./img/Apache.png"/>
                    </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>Apache 2 Webserver</h3>
                        <p>Configured for web development, the server is already setup and running</p>
                        <p>You can access this page at <a href="localhost:8080">localhost:8080</a></p>
                    </div>
                </div>
                </div>
                <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://www.mysql.com/">
                        <img class="brand-logo" src="./img/mysql.png"/>
                    </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>MySQL Database Server and Client</h3>
                        <p>Pre-configured MySQL server,<br>simply log on with mysql or the included PhpMyAdmin Web Application.</p>
                        <a href="http://192.168.33.10/phpmyadmin"><span>phpMyAdmin Access</span></a>
                        <p>Pre-configured MySQL server, simply log on with mysql.</p>
                        <p>USER: "root" PASSWORD: "root"</p>
                    </div>
                </div>
                </div>
                </div>
                <div class="row wow fadeInRight delay-05s">
                <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://www.postgresql.org/">
                        <img class="brand-logo" src="./img/postgres.png"/>
                    </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>PostGreSQL Database Server and Client</h3>
                        <p>Pre-configured PostGreSQL server,<br>simply log on with psql or the included PhpPgAdmin Web Application.</p>
                        <a href="http://192.168.33.10/phpPgAdmin"><span>phpPgAdmin Access</span></a>
                        
                        <p>USER: "postgres" PASSWORD: "postgres"</p>
                        <p>USER: "vagrant" PASSWORD: "vagrant"</p>
                        
                    </div>
                </div>
                </div>
                
                    <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://www.redis.io/">
                        <img class="brand-logo" src="./img/Redis.png"/>
                    </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>Redis Server</h3>
                        <p>Redis server, get a client from <a href="https://redis.io/clients">redis.io/clients</a> and access</p>
                        <p>at port 6379 on the virtual machine, and at 6300 on your host.</p>                        
                    </div>
                </div>
            </div>
            </div>
            
                <div class="row wow fadeInLeft delay-05s">
                <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                        <a href="https://www.mongodb.com/">
                        <img class="brand-logo" src="./img/mongodb.png"/>
                        </a>
                        
                    </div>
                	<div class="service-list-col2">
                        <h3>MongoDB Server</h3>
                        <p>Pre-configured MongoDB server,<br> access at port 27017 on the virtual machine,<br>
                         and port 27077 on your host machine.</p>
                                               
                    </div>
                    </div>
                </div>
               
                
                

            <div class="col-lg-6 col-sm-6 ">
            
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://www.php.net/">
                        <img class="brand-logo" src="./img/php.png"/>
                        </a>
                        
                    </div>
                	<div class="service-list-col2">
                        <h3>PHP 7</h3>
                        <p>PHP scripting language, installed and configured.</p>
                        <p>Includes several common extensions</p>
                        <p>Composer is installed and ready to go</p>
                        <p>Supporting Frameworks like Symfony, Laravel, Yii or CakePHP</p>
                    </div>
                </div>
                </div>
                </div>
            
           
            <div class="row wow fadeInRight delay-05s">
                <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://docs.microsoft.com/en-us/dotnet/">
                        <img class="brand-logo" src="./img/dotnet.png"/>
                        </a>
                        
                    </div>
                	<div class="service-list-col2">
                        <h3>DotNet Core</h3>
                        <p>DotNet Core, installed and configured.</p>
                        <p>Including Ready to go Mono CSharp and VisualBasic compilers,</p>
                        <p>as well as DotNet Core Environment</p>
                    </div>
                </div>
                </div>
            <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="http://openjdk.java.net/">
                        <img class="brand-logo" src="./img/Java.png"/>
                        </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>Java 8</h3>
                        <p>OpenJDK Version of Java 8 JRE and JDK</p>
                        <p>Run and Compile Java Console Apps</p>
                        <p>Use Popular Java Web Frameworks Such as </p>
                        <p>Spring, JSF, Struts, Play, Vaadin, and more</p>
                    </div>
                </div>
                </div>
            </div>
            <div class="row wow fadeInLeft delay-05s">
            <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://nodejs.org/">
                        <img class="brand-logo" src="./img/nodejs.png"/>
                        </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>NPM and NodeJS</h3>
                        <p>Use NPM to manage and install Node Packages</p>
                        <p>Manage project dependencies and project frameworks</p>
                        <p>Like: Sails, Express, Angular, or Adonis</p>
                    </div>
                </div>
                </div>
            <div class="col-lg-6 col-sm-6 ">
                <div class="service-list">
                	<div class="service-list-col1">
                    <a href="https://www.ruby-lang.org/">
                        <img class="brand-logo" src="./img/ruby.png"/>
                        </a>
                    </div>
                	<div class="service-list-col2">
                        <h3>RVM and Ruby</h3>
                        <p>Use RVM to manage ruby versions and more</p>
                        <p>Install Ruby Dependencies or Setup Frameworks</p>
                        <p>Like Rails or Sinatra</p>
                    </div>
                </div>
            </div>
            </div>
            
        
        </div>
	</div>
</section><!--main-section-end-->



<section class="main-section alabaster"><!--main-section alabaster-start-->
	<div class="container">
    	<div class="row">
		   	<div class="col-lg-12 col-sm-12 featured-work">
            	<?php echo phpinfo(); ?>
            </div>
        </div>
	</div>
</section><!--main-section alabaster-end-->







<script type="text/javascript">
    $(document).ready(function(e) {
        $('#test').scrollToFixed();
        $('.res-nav_click').click(function(){
            $('.main-nav').slideToggle();
            return false    
            
        });
        
    });
</script>

  <script>
    wow = new WOW(
      {
        animateClass: 'animated',
        offset:       100
      }
    );
    wow.init();
  </script>


<script type="text/javascript">
	$(window).load(function(){
		
		$('.main-nav li a, .servicelink').bind('click',function(event){
			var $anchor = $(this);
			
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top - 102
			}, 1500,'easeInOutExpo');
			/*
			if you don't want to use the easing effects:
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top
			}, 1000);
			*/
      if ($(window).width() < 768 ) { 
        $('.main-nav').hide(); 
      }
			event.preventDefault();
		});
	})
</script>

<script type="text/javascript">

$(window).load(function(){
  
  
  var $container = $('.portfolioContainer'),
      $body = $('body'),
      colW = 375,
      columns = null;

  
  $container.isotope({
    // disable window resizing
    resizable: true,
    masonry: {
      columnWidth: colW
    }
  });
  
  $(window).smartresize(function(){
    // check if columns has changed
    var currentColumns = Math.floor( ( $body.width() -30 ) / colW );
    if ( currentColumns !== columns ) {
      // set new column count
      columns = currentColumns;
      // apply width to container manually, then trigger relayout
      $container.width( columns * colW )
        .isotope('reLayout');
    }
    
  }).smartresize(); // trigger resize to set container width
  $('.portfolioFilter a').click(function(){
        $('.portfolioFilter .current').removeClass('current');
        $(this).addClass('current');
 
        var selector = $(this).attr('data-filter');
        $container.isotope({
			
            filter: selector,
         });
         return false;
    });
  
});

</script>

</body>
</html>