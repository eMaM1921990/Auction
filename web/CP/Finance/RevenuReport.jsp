<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.DBConnection" %>
<%
    DBConnection db = new DBConnection();
    db.connect();
%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
        <!-- Apple devices fullscreen -->
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <!-- Apple devices fullscreen -->
        <meta names="apple-mobile-web-app-status-bar-style" content="black-translucent" />

        <title>Back Office | Live Virtual Auction</title>

        <!-- Bootstrap -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <!-- Bootstrap responsive -->
        <link rel="stylesheet" href="../css/bootstrap-responsive.min.css">
        <!-- jQuery UI -->
        <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="../css/plugins/jquery-ui/smoothness/jquery.ui.theme.css">
        <!-- dataTables -->
        <link rel="stylesheet" href="../css/plugins/datatable/TableTools.css">
        <!-- chosen -->
        <link rel="stylesheet" href="../css/plugins/chosen/chosen.css">
        <!-- Theme CSS -->
        <link rel="stylesheet" href="../css/style.css">
        <!-- Color CSS -->
        <link rel="stylesheet" href="../css/themes.css">

        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Nice Scroll -->
        <script src="../js/plugins/nicescroll/jquery.nicescroll.min.js"></script>
        <!-- imagesLoaded -->
        <script src="../js/plugins/imagesLoaded/jquery.imagesloaded.min.js"></script>
        <!-- jQuery UI -->
        <script src="../js/plugins/jquery-ui/jquery.ui.core.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.widget.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.mouse.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.resizable.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.sortable.min.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.datepicker.min.js"></script>
        <!-- slimScroll -->
        <script src="../js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js"></script>
        <!-- Bootbox -->
        <script src="../js/plugins/bootbox/jquery.bootbox.js"></script>
        <!-- dataTables -->
        <script src="../js/plugins/datatable/jquery.dataTables.min.js"></script>
        <script src="../js/plugins/datatable/TableTools.min.js"></script>
        <script src="../js/plugins/datatable/ColReorderWithResize.js"></script>
        <script src="../js/plugins/datatable/ColVis.min.js"></script>
        <script src="../js/plugins/datatable/jquery.dataTables.columnFilter.js"></script>
        <script src="../js/plugins/datatable/jquery.dataTables.grouping.js"></script>
        <!-- Chosen -->
        <script src="../js/plugins/chosen/chosen.jquery.min.js"></script>

        <!-- Theme framework -->
        <script src="../js/eakroko.min.js"></script>
        <!-- Theme scripts -->
        <script src="../js/application.min.js"></script>
        <!-- Just for../ demonstration -->
        <script src="../js/demonstration.min.js"></script>

        <!--[if lte IE 9]>
                <script src="js/plugins/placeholder/jquery.placeholder.min.js"></script>
                <script>
                        $(document).ready(function() {
                                $('input, textarea').placeholder();
                        });
                </script>
        <![endif]-->

        <!-- Favicon -->
        <link rel="shortcut icon" href="../img/favicon.ico" />
        <!-- Apple devices Homescreen icon -->
        <link rel="apple-touch-icon-precomposed" href="../img/apple-touch-icon-precomposed.png" />
        <style>
            .aParent div {
                float: left;
                clear: none;
                height: 20%;





            }
        </style>
    </head>

    <body>
        <%@include file="../header.jsp" %>
        <div class="container-fluid nav-hidden" id="content">

            <div id="main">
                <div class="container-fluid">
                    <div class="page-header">
                        <div class="pull-left">
                            <h1>My Auctions Revenu Report</h1>
                        </div>
                        <div class="pull-right">

                            <ul class="stats">
                               
                                <li class='lightred'>
                                    <i class="icon-calendar"></i>
                                    <div class="details">
                                        <span class="big">February 22, 2013</span>
                                        <span>Wednesday, 13:56</span>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="breadcrumbs">
                        <ul>
                            <li>
                                <a href="../index.jsp">Home</a>
                                <i class="icon-angle-right"></i>
                            </li>
                           <li>
                                <a href="#">Finance</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Report</a>
                            </li>
                        </ul>
                        <div class="close-bread">
                            <a href="#">
                                <i class="icon-remove"></i>
                            </a>
                        </div>
                    </div>


                    <div class="row-fluid">
                        <div class="span12">
                            <div class="box">
                                <div class="box-title">
                                    <h3>
                                        Revenue Report From Date <strong>${param.datefrom} </strong> To <strong>${param.dateto}</strong>
                                    </h3>
                                </div>
                                <div class="box-content nopadding">
                                    <table class="table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable">
                                        <thead>
                                            <tr class='thefilter'>

                                                <th class='hidden-1024'>Date</th>
                                                <th class='hidden-1024'>Amount</th>

                                            </tr>
                                            <tr>

                                                <th class='hidden-1024'>Date</th>
                                                <th class='hidden-1024'>Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                                                java.sql.Date sqldatefrom = new java.sql.Date(df.parse(request.getParameter("datefrom")).getTime());
                                                java.sql.Date sqldateto = new java.sql.Date(df.parse(request.getParameter("dateto")).getTime());
                                                db.pstm = db.con.prepareStatement("SELECT DATEAUCTION,FEES,TOTAL,SUM(TOTAL-((FEES*TOTAL)/100)) FROM AUCTIONWINNER,AUCTION WHERE DATEAUCTION BETWEEN ? AND ? AND BUYPAID=? AND idAUCTION=AUCTION_ID_W AND AUCTION_PRO IN (SELECT idPRODUCT FROM PRODUCT WHERE PRODUCTCREATEDBY=?)");
                                                db.pstm.setDate(1, sqldatefrom);
                                                db.pstm.setDate(2, sqldateto);
                                                db.pstm.setString(3,"Y");
                                                db.pstm.setInt(4, userid);
                                                ResultSet rs = db.pstm.executeQuery();
                                                double summery=0.0;
                                                while (rs.next()) {
                                            %>
                                            <tr>

                                                <td>
                                                    <%if(rs.getString(1)==null){%>
                                                    <%="No Auction"%>
                                                    <%}else{%>
                                                    <%=rs.getString(1)%>
                                                    <%}%>
                                                    </td>
                                                <td><span class="label label-orange"><%=rs.getDouble(3)-((rs.getDouble(2)*rs.getDouble(3))/100)%></span></td>
                                               
                                            </tr>
                                            <%
                                                summery=rs.getDouble(4);
                                                } 
                                                db.closeConnection();
                                            %>
                                            <tr>
                                                <td>&sum;</td><td><%=summery%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    



                </div>
            </div>
        </div>



    </body>

</html>
