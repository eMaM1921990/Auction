<%@page import="java.text.DecimalFormat"%>
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
        <script src="../js/custom.js"></script>

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
                            <h1>Billing Invoice</h1>
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
                                <a href="view.jsp">Invoice</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">View</a>
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
                            <div class="alert alert-success" style="display: ${param.suc}">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Success!</strong> ${param.msg}.
                            </div>

                            <div class="alert alert-error" style="display: ${param.err}">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Warning!</strong> ${param.msg}.
                            </div>
                            <div class="box">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-money"></i>
                                        Invoice
                                    </h3>
                                </div>
                                <div class="box-content">
                                    <div class="invoice-info">
                                        <div class="invoice-name">
                                            Live Virtual Auction
                                        </div>
                                        <div class="invoice-from">
                                            <span>From</span>
                                            <strong>Live Virtual Auction </strong>
                                            <address>
                                                PO Box 97 <br> West Haven CT<br> 06516<br>

                                            </address>
                                        </div>


                                    </div>
                                    <table class="table table-striped table-invoice">
                                        <thead>
                                            <tr>
                                                <th>Item</th>
                                                <th>Price</th>
                                                <th>Fees</th>

                                                <th class='total'>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                db.pstm = db.con.prepareStatement("SELECT P.NAME,A.TOTAL,A.FEES,TRUNCATE((A.TOTAL*A.FEES),2),A.SHIPPINGCOST FROM icanor_autcion.AUCTIONWINNER A,PRODUCT P WHERE A.AUCTION_PRO=P.idPRODUCT AND A.PAID='N' AND A.USER_AUCTION_W=?");
                                                db.pstm.setString(1, request.getParameter("id"));
                                                db.rs = db.pstm.executeQuery();
                                                double sum = 0;
                                                while (db.rs.next()) {

                                            %>
                                            <tr>
                                                <td class='name'><%=db.rs.getString(1)%></td>
                                                <td class='price'>$<%=db.rs.getString(2)%></td>
                                                <td class='qty'>$<%=db.rs.getString(3)%></td>

                                                <td class='total'>$<%=db.rs.getString(4)%></td>
                                            </tr>
                                            <%
                                                    sum = sum + db.rs.getDouble(4);
                                                }

                                                DecimalFormat decform = new DecimalFormat("0.00");
                                            %>

                                            <tr>
                                                <td colspan="3"></td>
                                                <td class='taxes'>

                                                    <p>
                                                        <span class="light">Total</span>
                                                        <span class="totalprice">
                                                            $<%=decform.format(sum)%>
                                                        </span>
                                                    </p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>



                        <div class="span5">
                            <label style="color: green">
                                <b> Just 2 step to pay your fees:</b>
                            </label> 
                            1. Make your payment. (After you make your payment, please, copy the transaction number and paste in the box, then click the green button, <b>"Confirm"</b>.)
                            2. Confirm your payment. </p>
                        </div>
                        <div class="span5">

                            <div class="input-append">
                                <label id="val" >
                                    <b>1. Pay your fees here: </b>
                                </label>
                                <form action="../../SellerInvoicePayment" method="POST" target="_blank">
                                    <input type="hidden" value="<%=decform.format(sum)%>" name="amount"/>
                                    <input type="image"src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/checkout-logo-small.png" alt="Check out with PayPal"/> 
<!--                                    <button><img  /></button>-->
                                </form>


                            </div>
                        </div>

                        <div class="span6">



                            <div class="input-append">
                                <label id="val"  style="color: red">
                                    <b> 2. Confirm your payment:</b>
                                </label>
                                <input type="text" id="transaction" data-rule-required="true"/>
                                <input type="hidden" id="userid" value="<%=request.getParameter("id")%>"/>
                                <button class="btn btn-success btn btn-small" id="confirm" onclick="Transaction()">Confirm</button>
                            </div>
                            <div class="invoice-payment">
                                <span>Payment methods</span>
                                <ul>
                                    <li>
                                        <img src="../img/demo/paypal.png" alt="">
                                    </li>

                                </ul>
                            </div>
                        </div>                                
                    </div>


                </div>
            </div>
        </div>



    </body>

</html>
