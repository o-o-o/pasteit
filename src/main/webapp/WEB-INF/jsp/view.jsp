<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"></meta>
    <meta name="description" content="Copy-Paste anything you want, then get it from anywhere."></meta>
    <meta name="author" content="Jun Enomoto"></meta>
    <title>Paste it!</title>

    <link href="/public/bootstrap/css/bootstrap.min.css" rel="stylesheet"></link>
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
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"></a><a class="brand" href="#">Paste it!</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li><a href="/"><span class="icon-edit icon-white"></span> Home</a></li>
              <li><a href="/about"><span class="icon-info-sign icon-white"></span> About</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div id="editor"><c:out value="${text}" escapeXml="true" /></div>
    <div id="location">
      <a id="message" href="${fn:escapeXml(location)}"><c:out value="${location}" escapeXml="true" /></a>
      <a id="copy" class="btn" href="#"><span class="icon-inbox"></span> copy</a>
    </div>

    <footer>
      <p><a id="footer-logo" href="/">Paste it!</a></p>
    </footer>

    <script src="/public/jquery/jquery-1.7.1.min.js"></script>
    <script src="/public/bootstrap/js/bootstrap.min.js"></script>
    <script src="/public/ace/ace.js" type="text/javascript" charset="utf-8"></script>
    <script src="/public/zeroclipboard/ZeroClipboard.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
(function($){
  $(document).ready(function(){
    var editor = ace.edit('editor');
    editor.setReadOnly(true);
    ZeroClipboard.setMoviePath('/public/zeroclipboard/ZeroClipboard.swf');
    var clip = new ZeroClipboard.Client();
    clip.glue('copy');
    clip.setHandCursor(true);
    clip.addEventListener('onMouseDown', function(){
      clip.setText($('#message').attr('href'));
    });
  });
})(jQuery);
    </script>
  </body>
</html>