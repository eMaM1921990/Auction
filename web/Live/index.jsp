<%@page import="controller.DBConnection"%>
<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.*" %>
<%

    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.addHeader("Expires", "-1");
    response.addHeader("Pragma", "no-cache");
    DBConnection db = new DBConnection();
    db.connect();
    db.rs = db.excuteQuery("SELECT COUNT(idPRODUCT) AS TOTAL FROM PRODUCT WHERE PRODUCTSTATUS='Live'");
    int count = 0;
    while (db.rs.next()) {
        count = db.rs.getInt("TOTAL");
    }
    db.closeConnection();
    if (count == 0) {
        response.sendRedirect("noLive.jsp");
    }

    System.out.println(count);

%>

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
        <link rel="stylesheet" href="../CP/css/bootstrap.min.css">
        <!-- Bootstrap responsive -->
        <link rel="stylesheet" href="../CP/css/bootstrap-responsive.min.css">

        <!-- jQuery UI -->
        <link rel="stylesheet" href="../CP/css/plugins/jquery-ui/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="../CP/css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">


        <!-- Theme CSS -->
        <link rel="stylesheet" href="../CP/css/style.css">
        <!-- Color CSS -->
        <link rel="stylesheet" href="../CP/css/themes.css">

        <!-- jQuery -->
        <script src="../CP/js/jquery.min.js"></script>
        <!-- complexify -->
        <script src="../CP/js/plugins/complexify/jquery.complexify-banlist.min.js"></script>
        <script src="../CP/js/plugins/complexify/jquery.complexify.min.js"></script>



        <!-- imagesLoaded -->
        <script src="../CP/js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>

        <!-- Nice Scroll -->
        <script src="../CP/js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- jQuery UI -->
        <script src="../CP/js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
        <script src="../CP/js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
        <script src="../CP/js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
        <script src="../CP/js/plugins/jquery-ui/jquery.ui.draggable.min.js"></script>
        <script src="../CP/js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
        <script src="../CP/js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
        <!-- Touch enable for jquery UI -->
        <script src="../CP/js/plugins/touch-punch/jquery.touch-punch.min.js"></script>
        <!-- slimScroll -->
        <script src="../CP/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <!-- Bootstrap -->
        <script src="../CP/js/bootstrap.min.js"></script>

        <!-- Bootbox -->
        <script src="../CP/js/plugins/bootbox/jquery.bootbox.js"></script>
        <!-- Flot -->
        <script src="../CP/js/plugins/flot/jquery.flot.min.js"></script>
        <script src="../CP/js/plugins/flot/jquery.flot.bar.order.min.js"></script>
        <script src="../CP/js/plugins/flot/jquery.flot.pie.min.js"></script>
        <script src="../CP/js/plugins/flot/jquery.flot.resize.min.js"></script>
        <!-- imagesLoaded -->
        <script src="../CP/js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>



        <!-- icheck -->
        <script src="../CP/js/plugins/icheck/jquery.icheck.min.js"></script>
        <link rel="stylesheet" type="text/css" href="../CP/style/freeow/freeow.css" />
        <link rel="stylesheet" type="text/css" href="../CP/css/demo.css" />

        <script type="text/javascript" src="../CP/js/jquery.freeow.js"></script>
        <script type="text/javascript" src="../CP/js/demo.js"></script>




        <!-- Theme framework -->
        <script src="../CP/js/eakroko.min.js"></script>
        <!-- Theme scripts -->
        <script src="../CP/js/application.min.js"></script>
        <!-- Just for demonstration -->
        <script src="../CP/js/demonstration.min.js"></script>
        <script src="live.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="live.css"/>

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



    </head>

    <body class="theme-grey " onload="showStateAuction()" >


        <div id="freeow" class="freeow freeow-top-right "></div>

        <div class="container-fluid nav-hidden" id="content" style="height: 500px">

            <div id="main">
                <div class="container-fluid">
                    <div class="page-header">

                        <div class="pull-left">
                            <div><img src="../FO/img/logo.png" /></div>
                        </div>

                        <div class="pull-right">
                            <div id="maxbid"></div>


                        </div>

                        <div class="pull-right" style="margin-right:20px">
                            <ul class='stats'>
                                <li class='teal'><i class='icon-bell'></i><div class='details'><span><font style="font-size: 25pt"><div id="clock"></div></font></span><span ></span></div> </li>
                            </ul>
                        </div>
                    </div>

                    <div class="row-fluid">
                        <div class="span2">
                            <div class="box " data-height="400">
                                <!--<div class="box box-color  box-bordered box-small lime" data-height="400">-->
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-lock"></i>
                                        Coming Items
                                    </h3>

                                </div>
                                <div class="box-content  scrollable" data-height="400" data-visible="true">
                                    <table class='table table-nohead' ><tbody>

                                            <%    try {
                                                    db.connect();
                                                    db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT WHERE PRODUCTSTATUS='Live' ORDER BY NAME DESC");
                                                    db.rs = db.pstm.executeQuery();
                                                    while (db.rs.next()) {%>
                                            <tr><td align="right"><div class='imgs'><img src='../<%=db.rs.getString("IMAGEURL")%>' alt='' width='100px' height='50px'  > <div class='descs' ><%=db.rs.getString("NAME")%></div></div></td></tr>

                                            <%}
                                                    db.closeConnection();
                                                } catch (Exception e) {
                                                    System.out.println(e);
                                                }%>
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



                    <%
                        String a = null;
                        if (session.getAttribute("login") == null || session.getAttribute("login") == "") {
                            a = null;
                        } else {
                            a = session.getAttribute("login").toString();
                        }
                        if (a == null) {%>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="box  ">
                                <div class="box-title">
                                    <h3><i class="icon-ok"></i> Bid</h3>
                                    <div class="actions">
                                        <a href="../FO/Portal.jsp"  class='btn'><i class="icon-key"></i> Please Login To Can Bid</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <%} else {%>
                    <div class="row-fluid">
                        <div class="span12">
                            <div class="box ">
                                <div class="box-title">
                                    <h3><i class="icon-ok"></i> Bid</h3>
                                    <div class="actions">
                                        <a href="#new-task" data-toggle="modal" class='btn'><i class="icon-legal"></i> Add Bid</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <%}%>





                    <div id="new-task" class="modal hide" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <h3 id="myModalLabel">Add your Bid</h3>
                        </div>
                        <form class='new-task-form form-horizontal form-bordered' id="form1" >
                            <div class="modal-body nopadding">
                                <div class="control-group">
                                    <label for="task-name" class="control-label">Your bid</label>
                                    <div class="controls">
                                        <input type="text" name="bidz" id="bidval">
                                    </div>
                                    <div id="sms" style="color: tomato"></div>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn btn-primary" value="Add Bid" id="submit">
                            </div>
                        </form>

                    </div>



                </div>
            </div></div>

    </body>

</html>

