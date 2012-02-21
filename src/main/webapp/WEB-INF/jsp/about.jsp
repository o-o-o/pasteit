<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta name="description" content="Copy-Paste anything you want, then get it from anywhere."></meta>
    <meta name="author" content="Jun Enomoto"></meta>
    <title>Paste it!</title>

    <link href="/public/bootstrap/css/simplex.bootstrap.min.css" rel="stylesheet"></link>
    <link href="/public/style.css" rel="stylesheet"></link>
    <link href="/public/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet"></link>

    <!--[if lt IE 9]>
    <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <!-- TODO
    <link rel="shortcut icon" href="/public/images/favicon.ico"></link>
    <link rel="apple-touch-icon" href="/public/images/apple-touch-icon.png"></link>
    <link rel="apple-touch-icon" sizes="72x72" href="/public/images/apple-touch-icon-72x72.png"></link>
    <link rel="apple-touch-icon" sizes="114x114" href="/public/images/apple-touch-icon-114x114.png"></link>
    -->
  </head>
  <body>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"></a><a class="brand" href="/">Paste it!</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li><a href="/"><span class="icon-edit"></span> Home</a></li>
              <li class="active"><a href="/about"><span class="icon-info-sign"></span> About</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="span9">
        <div class="hero-unit">
          <h1>Paste it!</h1>
          <p id="message">Copy-Paste anything you want, then get it from anywhere.</p>
        </div>
      </div>
      <div class="span3">
        <h2>Source</h2>
        <a href="http://github.com/o-o-o/paste-it/">http://github.com/o-o-o/paste-it/</a>
      </div>
    </div>

    <footer>
      <p><a id="footer-logo" href="/about">Paste it!</a></p>
    </footer>
  </body>
</html>
