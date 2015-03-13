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

    </head>

    <body>
        <%@include file="../header.jsp" %>
        <div class="container-fluid nav-hidden" id="content">

            <div id="main">
                <div class="container-fluid">
                    <div class="page-header">
                        <div class="pull-left">
                            <h1>Seller Products</h1>
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
                                <a href="sellerproduct.jsp">Product</a>
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
                                        Seller Products Table
                                    </h3>
                                </div>
                                <div class="box-content nopadding">
                                    <table class="table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable">
                                        <thead>
                                            <tr class='thefilter'>

                                                <th class='hidden-1024'>Product</th>
                                                <th class='hidden-1024'>Class</th>
                                                <th class='hidden-350'>Quantity</th>
                                                <th class='hidden-1024'>Sell Price</th>
                                                <th class='hidden-480'>Shipping Cost</th>


                                                <th class='hidden-1024'>Auction Status</th>
                                                <th class='hidden-1024'>Created By</th>
                                                <th class='hidden-1024'>Action</th>

                                            </tr>
                                            <tr>

                                                <th class='hidden-1024'>Product</th>
                                                <th class='hidden-1024'>Class</th>
                                                <th class='hidden-350'>Quantity</th>
                                                <th class='hidden-1024'>Sell Price</th>
                                                <th class='hidden-480'>Shipping Cost</th>

                                                <th class='hidden-1024'>Auction Status</th>
                                                <th class='hidden-1024'>Created By</th>
                                                <th class='hidden-1024'>Action</th>


                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%db.pstm = db.con.prepareStatement("SELECT * FROM PRODUCT,CATEGORY,USER WHERE idCATEGORY=PRODUCTCAT AND PRODUCTCREATEDBY=idUSER AND USERTYPE=?");
                                                db.pstm.setInt(1, 2);
                                                ResultSet rs = db.pstm.executeQuery();
                                                while (rs.next()) {
                                            %>
                                            <tr>

                                                <td><%=rs.getString("NAME")%></td>
                                                <td><span class="label label-orange"><%=rs.getString("CATEGORYNAME")%></span></td>
                                                <td class='hidden-350'><span class="label label-satgreen"><%=rs.getString("QUANTITYONHAND")%></span></td>
                                                <td class='hidden-1024'><%=rs.getString("SELLPRICE")%></td>

                                                <td class='hidden-350'><span class="label label-red"><%=rs.getString("SHIPPINGCOST")%></span></td>

                                                <td><%=rs.getString("PRODUCTSTATUS")%></td>
                                                <td><%=rs.getString("USERNAME")%></td>
                                                <td class='hidden-480'>
                                                    <div class="aParent" style="height: 30px">
                                                        <div>
                                                            <form action="../../UpdateProductStatusSeller" method="post">
                                                                <input type="hidden" name="idPRODUCT" value="<%=rs.getString("idPRODUCT")%>"/>
                                                                <input type="hidden" name="active" value="<%=rs.getString("ISACTIVE")%>"/>
                                                                <%if (rs.getString("ISACTIVE").equals("Y")) {%>
                                                                <button type="submit" class="btn" rel="tooltip" title="In-Active">
                                                                    <i class="icon-stop"></i>
                                                                </button>
                                                                <%} else {%>
                                                                <button type="submit" class="btn" rel="tooltip" title="Active">
                                                                    <i class="icon-play"></i>
                                                                </button>
                                                                <%}%>
                                                            </form>
                                                        </div>

                                                        <div>
                                                            <form action="../../DeleteProductSeller" method="post">
                                                                <input type="hidden" name="idPRODUCT" value="<%=rs.getString("idPRODUCT")%>"/>
                                                                <input type="hidden" name="NAME" value="<%=rs.getString("NAME")%>"/>
                                                                <button type="submit" class="btn" rel="tooltip" title="Delete"><i class="icon-remove"></i></button>
                                                            </form>
                                                        </div>

                                                    </div>

                                                </td>


                                            </tr>
                                            <%}
                                                db.closeConnection();
                                            %>
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