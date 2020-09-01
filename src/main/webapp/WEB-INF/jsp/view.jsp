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
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-list" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
            </svg>
          </a><a class="brand" href="/">Paste it!</a>
          <div class="nav-collapse">
            <ul class="nav">
              <li><a href="/"><span class="icon-edit"></span> Home</a></li>
              <li><a href="/about"><span class="icon-info-sign"></span> About</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="span9"><p></p></div>
        <div class="span3">
        	<a id="copyThis" class="btn btn-large btn-primary" href="#"><span class="icon-share-alt icon-white"></span> Copy this!</a>
        	<a id="download" class="btn btn-large btn-primary" href="/d/${fn:escapeXml(fileName)}"><span class="icon-download-alt icon-white"></span> Download</a>
        </div>
      </div>
    </div>

    <div id="editor"><c:out value="${text}" escapeXml="true" /></div>
    <div id="location">
      <a id="message" href="${fn:escapeXml(location)}"><c:out value="${location}" escapeXml="true" /></a>
      <a id="copyUrl" class="btn" href="#"><span class="icon-share-alt"></span> copy this URL</a>
    </div>

    <footer>
      <p><a id="footer-logo" href="/about">Paste it!</a></p>
    </footer>

    <script src="/public/jquery/jquery-1.7.1.min.js"></script>
    <script src="/public/bootstrap/js/bootstrap.min.js"></script>
    <script src="/public/ace/ace.js" type="text/javascript" charset="utf-8"></script>
    <script src="/public/clipboard.js/clipboard.min.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript">
(function($){
  $(document).ready(function(){
    var editor = ace.edit('editor');
    editor.setReadOnly(true);

    var clipboardContent = new ClipboardJS('#copyThis', {
        text: function(trigger) {
            return editor.getSession().getValue();
        }
    });
    var clipboardUrl = new ClipboardJS('#copyUrl', {
        text: function(trigger) {
            return $('#message').attr('href');
        }
    });

    // show success tooltips
    $('#copyThis').tooltip({trigger: 'click', placement: 'bottom'});
    $('#copyUrl').tooltip({trigger: 'click', placement: 'top'});
    clipboardContent.on('success', function(e) {
        setTooltip(e.trigger, 'Copied!');
        hideTooltip(e.trigger);
    });
    clipboardUrl.on('success', function(e) {
        setTooltip(e.trigger, 'Copied!');
        hideTooltip(e.trigger);
    });
    var setTooltip = function (btn, message) {
        $(btn).attr('data-original-title', message).tooltip('show');
    };
    var hideTooltip = function (btn, message) {
        setTimeout(function() {
            $(btn).tooltip('hide').attr('data-original-title', "");
        }, 1000);
    };
  });
})(jQuery);
    </script>
  </body>
</html>
