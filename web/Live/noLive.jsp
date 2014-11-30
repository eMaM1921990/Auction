<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <!-- Apple devices fullscreen -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- Apple devices fullscreen -->
        <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

        <title>Live Virtual Auction</title>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Bootstrap responsive -->
        <link rel="stylesheet" href="css/bootstrap-responsive.min.css">
        <!-- jQuery UI -->
        <link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
        <!-- PageGuide -->
        <link rel="stylesheet" href="css/plugins/pageguide/pageguide.css">
        <!-- Fullcalendar -->
        <link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.css">
        <link rel="stylesheet" href="css/plugins/fullcalendar/fullcalendar.print.css" media="print">
        <!-- chosen -->
        <link rel="stylesheet" href="css/plugins/chosen/chosen.css">
        <!-- select2 -->
        <link rel="stylesheet" href="css/plugins/select2/select2.css">
        <!-- icheck -->
        <link rel="stylesheet" href="css/plugins/icheck/all.css">
        <!-- Theme CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Color CSS -->
        <link rel="stylesheet" href="css/themes.css">
        <!-- Notify -->
        <link rel="stylesheet" href="css/plugins/gritter/jquery.gritter.css">

        <!-- jQuery -->
        <script src="js/jquery.min.js"></script>

        <!-- Nice Scroll -->
        <script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- Nice Scroll -->
        <script src="js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- jQuery UI -->
        <script src="js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
        <script src="js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
        <!-- Touch enable for jquery UI -->
        <script src="js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
        <!-- slimScroll -->
        <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <!-- Bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- vmap -->
        <script src="js/plugins/vmap/jquery.vmap.min.js"></script>
        <script src="js/plugins/vmap/jquery.vmap.world.js"></script>
        <script src="js/plugins/vmap/jquery.vmap.sampledata.js"></script>
        <!-- Bootbox -->
        <script src="js/plugins/bootbox/jquery.bootbox.js"></script>
        <!-- Flot -->
        <script src="js/plugins/flot/jquery.flot.min.js"></script>
        <script src="js/plugins/flot/jquery.flot.bar.order.min.js"></script>
        <script src="js/plugins/flot/jquery.flot.pie.min.js"></script>
        <script src="js/plugins/flot/jquery.flot.resize.min.js"></script>
        <!-- imagesLoaded -->
        <script src="js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
        <!-- PageGuide -->
        <script src="js/plugins/pageguide/jquery.pageguide.js"></script>
        <!-- FullCalendar -->
        <script src="js/plugins/fullcalendar/fullcalendar.min.js"></script>
        <!-- Chosen -->
        <script src="js/plugins/chosen/chosen.jquery.min.js"></script>
        <!-- select2 -->
        <script src="js/plugins/select2/select2.min.js"></script>
        <!-- icheck -->
        <script src="js/plugins/icheck/jquery.icheck.min.js"></script>
        <link rel="stylesheet" type="text/css" href="style/freeow/freeow.css" />
        <link rel="stylesheet" type="text/css" href="css/demo.css" />

        <script type="text/javascript" src="js/jquery.freeow.js"></script>
        <script type="text/javascript" src="js/demo.js"></script>




        <!-- Theme framework -->
        <script src="js/eakroko.min.js"></script>
        <!-- Theme scripts -->
        <script src="js/application.min.js"></script>
        <!-- Just for demonstration -->
        <script src="js/demonstration.min.js"></script>

        <!--[if lte IE 9]>
                <script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
                <script>
                        $(document).ready(function() {
                                $('input, textarea').placeholder();
                        });
                </script>
        <![endif]-->

        <!-- Favicon -->


        <link rel="shortcut icon" href="../CP/img/favicon.ico" />
        <!-- Apple devices Homescreen icon -->
        <link rel="apple-touch-icon-precomposed" href="../CP/img/apple-touch-icon-precomposed.png" />
        <script>

            $(document).ready(function() {
                $('#modal-4').modal('show');
            });

            var auto = setInterval(function()
            {
                $.get('../chklive', null, function(responseText) {
                       if(parseInt(responseText)>0){
                            window.location.href='index.jsp';  
                       }
                    
                    });
            }, 100);

        </script>

    </head>

    <body class="theme-grey "  >


        <div id="freeow" class="freeow freeow-top-right "></div>

        <div class="container-fluid nav-hidden" id="content" style="height: 500px">

            <div id="main">
                <div class="container-fluid">
                    <div class="page-header">

                        <div class="pull-left">
                            <div><img src="../FO/img/logo.png"/></div>
                        </div>
                        <div class="pull-right">

                            <div id="maxbid"></div>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <div class="span2">
                            <div class="box" data-height="400">
                                <!--<div class="box box-color  box-bordered box-small lime" data-height="400">-->
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-lock"></i>
                                        Coming Items
                                    </h3>

                                </div>
                                <div class="box-content  scrollable" data-height="400" data-visible="true">
                                    <table class='table table-nohead' ><tbody>

                                        </tbody></table>    


                                </div>
                            </div>
                        </div>
                        <div class="span7">
                            <div class="box">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-legal"></i>
                                        Auction Item
                                    </h3>

                                </div>
                                <div class="box-content nopadding scrollable" data-height="400" data-visible="true">


                                    <div id="auctionitem">

                                    </div>


                                </div>
                            </div>
                        </div>
                        <div class="span3" >
                            <div class="box">
                                <div class="box-title">
                                    <h3><i class="icon-bullhorn"></i>Feeds</h3>


                                </div>
                                <div class="box-content nopadding scrollable" data-height="400" data-visible="true">


                                    <div id="score"></div>

                                </div>
                            </div>
                        </div>

                    </div>


                    <div class="row-fluid">
                        <div class="span12">
                            <div class="box box-color box-bordered box-small lime">
                                <div class="box-title">
                                    <h3><i class="icon-ok"></i> Bid</h3>
                                    <div class="actions">

                                        <a href="#" data-toggle="modal" class='btn'  onclick="close_window();return false;"><i class="icon-plus-sign"></i> Add Bid</a>


                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div id="modal-4" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h3 id="myModalLabel"><i class="icon-legal"></i> Live Virtual Auction Feeds</h3>
                        </div>
                        <div class="modal-body">
                            <p>Sorry there is no <font style="color: red">Live Virtual Auction</font> at this time Thanks…</p>
                        </div>
                        <div class="modal-footer">
                            <a href="../FO/Portal.jsp" class="btn btn-blue"><i class="icon-legal"></i> Back to our site</a>

                        </div>
                    </div>



                </div>
            </div></div>

    </body>

</html>

