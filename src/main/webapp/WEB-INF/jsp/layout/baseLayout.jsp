<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html lang="en-us">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>運算雲</title>
    <meta name="keywords" content="台灣大哥大,運算雲用戶管理中心">
    <meta name="description" content="台灣大哥大運算雲用戶管理中心">
    <meta name="author" content="Taiwan Mobile PID">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="shortcut icon" href="https://www.taiwanmobile.com/cbg-include/bp/images/twm.ico">

    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bootstrap.min.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/font-awesome.min.css"/>">

    <!-- Framework Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/smartadmin-production-plugins.min.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/smartadmin-production.min.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/smartadmin-skins.min.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/smartadmin-rtl.min.css"/>">

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.fancybox.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.toastmessage.css"/>">

    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bootstrap-datetimepicker.min.css"/>">

    <!-- TWM Style  -->
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/twm.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/bootstrap-override.css"/>">
    <link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/twm-dialog.css"/>">

    <!-- FAVICONS -->
    <link rel="shortcut icon" href="<c:url value="/img/favicon/favicon_twm.ico"/>" type="image/x-icon">
    <link rel="icon" href="<c:url value="/img/favicon/favicon_twm.ico"/>" type="image/x-icon">

    <!-- GOOGLE FONT -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC:100,300,400,500,700,900&display=swap&subset=chinese-traditional" rel="stylesheet">

</head>


<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)-->
<script data-pace-options='{ "restartOnRequestAfter": true }' src="<c:url value="/js/plugin/pace/pace.min.js"/>"></script>

<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    if (!window.jQuery) {
        document.write('<script src="<c:url value="/js/libs/jquery-3.2.1.min.js"/>"><\/script>');
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
    if (!window.jQuery.ui) {
        document.write('<script src="<c:url value="/js/libs/jquery-ui.min.js"/>"><\/script>');
    }
</script>

<!-- IMPORTANT: APP CONFIG -->
<script src="<c:url value="/js/app.config.js"/>"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="<c:url value="/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"/>"></script>

<!-- BOOTSTRAP JS -->
<script src="<c:url value="/js/bootstrap/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datetimepicker/bootstrap-datetimepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-TW.js"/>"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="<c:url value="/js/notification/SmartNotification.min.js"/>"></script>

<!-- JARVIS WIDGETS -->
<script src="<c:url value="/js/smartwidgets/jarvis.widget.min.js"/>"></script>

<!-- EASY PIE CHARTS -->
<%--<script src="<c:url value="/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"/>"></script>--%>

<!-- SPARKLINES -->
<%--<script src="<c:url value="/js/plugin/sparkline/jquery.sparkline.min.js"/>"></script>--%>

<!-- JQUERY VALIDATE -->
<script src="<c:url value="/js/plugin/jquery-validate/jquery.validate.min.js"/>"></script>

<!-- JQUERY MASKED INPUT -->
<%--<script src="<c:url value="/js/plugin/masked-input/jquery.maskedinput.min.js"/>"></script>--%>

<!-- JQUERY SELECT2 INPUT -->
<script src="<c:url value="/js/plugin/select2/select2.min.js"/>"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="<c:url value="/js/plugin/bootstrap-slider/bootstrap-slider.min.js"/>"></script>

<!-- browser msie issue fix -->
<script src="<c:url value="/js/plugin/msie-fix/jquery.mb.browser.min.js"/>"></script>

<!-- FastClick: For mobile devices -->
<%--<script src="<c:url value="/js/plugin/fastclick/fastclick.min.js"/>"></script>--%>

<!-- MAIN APP JS FILE 圖表-->
<script src="<c:url value="/js/app.js"/>"></script>

<script src="<c:url value="/js/plugin/fancybox/jquery.fancybox.pack.js"/>"></script>

<script src="<c:url value="/js/plugin/jquery-form/jquery-form.min.js"/>"></script>

<script src="<c:url value="/js/plugin/jquery-toastmessage/jquery.toastmessage.js"/>"></script>

<script src="<c:url value="/js/plugin/jquery-loading/jquery.loading.min.js"/>"></script>

    <!-- Flot Chart Plugin: Flot Engine, Flot Resizer, Flot Tooltip -->
<%--<script src="<c:url value="/js/plugin/flot/jquery.flot.cust.min.js"/>"></script>
<script src="<c:url value="/js/plugin/flot/jquery.flot.resize.min.js"/>"></script>
<script src="<c:url value="/js/plugin/flot/jquery.flot.time.min.js"/>"></script>
<script src="<c:url value="/js/plugin/flot/jquery.flot.tooltip.min.js"/>"></script>--%>

<script>
    $(document).ready(function() {

        // DO NOT REMOVE : GLOBAL FUNCTIONS!
        pageSetUp();

        $(".js-status-update a").click(function() {
            var selText = $(this).text();
            var $this = $(this);
            $this.parents('.btn-group').find('.dropdown-toggle').html(selText + ' <span class="caret"></span>');
            $this.parents('.dropdown-menu').find('li').removeClass('active');
            $this.parent().addClass('active');
        });

        $.ajaxSetup ({
            cache: false,
            beforeSend: function(xhr) {
                //console.log($("meta[name='_csrf_header']").attr("content"));
                //console.log($("meta[name='_csrf']").attr("content"));
                xhr.setRequestHeader($("meta[name='_csrf_header']").attr("content"), $("meta[name='_csrf']").attr("content"));
                $("body").loading({
                    stoppable: false,
                    message: "資料處理中...",
                    theme: "dark"
                });
                $("#header").css({"z-index": "1"});
                $("#left-panel").css({"z-index": "0"});
            },complete: function(){
                $("body").loading("stop", function(){
                });
                $("#header").css({"z-index": "905"});
                $("#left-panel").css({"z-index": "904"});
             },
            statusCode: {
                //CSRF token expired trigger this
                403: function(error, callback){
                    window.location.reload();
                },
                901: function(error, callback){
                    window.location.reload();
                }
            }
        });

        $.getScript("<c:url value="/js/twm-dialog.js"/>");

    });
</script>

    <!-- #BODY -->
    <body class="container menu-on-top">
        <!-- HEADER -->
        <tiles:insertAttribute name="header"/>
        <!-- END HEADER -->

        <!-- NAVIGATION -->
        <tiles:insertAttribute name="topMenu"/>
        <!-- END NAVIGATION -->

        <!-- MAIN PANEL -->
        <div id="main" role="main">
        <!-- MAIN CONTENT -->
        <tiles:insertAttribute name="body"/>
        <!-- END MAIN CONTENT -->
        </div>
        <!-- END MAIN PANEL -->

        <!-- PAGE FOOTER -->
        <tiles:insertAttribute name="footer"/>
        <!-- END PAGE FOOTER -->

    </body>

</html>