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
                            <h1>Users</h1>
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
                                <a href="view.jsp">User</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Manage Users</a>
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
                                        User Table
                                    </h3>
                                </div>
                                <div class="box-content nopadding">
                                    <table class="table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable">
                                        <thead>
                                            <tr class='thefilter'>
                                                <th class='hidden-1024'>Username</th>
                                                <th class='hidden-1024'>User Type</th>
                                                <th class='hidden-350'>Last Login</th>
                                                <th class='hidden-1024'>Status</th>
                                                <th class='hidden-480'>Options</th>
                                            </tr>
                                            <tr>
                                                <th class='hidden-1024'>Username</th>
                                                <th class='hidden-1024'>User Type</th>
                                                <th class='hidden-350'>Last Login</th>
                                                <th class='hidden-1024'>Status</th>
                                                <th class='hidden-480'>Options</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%db.pstm = db.con.prepareStatement("SELECT U.USERNAME AS USERNAME,TY.USERTYPE AS USERTYPE,U.LASTLOGIN AS LASTLOGIN,U.STATUS AS STATUS,U.idUSER AS idUSER FROM USER U,USERTYPE TY WHERE TY.idUSERTYPE=U.USERTYPE");

                                                ResultSet rs = db.pstm.executeQuery();
                                                while (rs.next()) {
                                            %>
                                            <tr>

                                                <td><%=rs.getString("USERNAME")%></td>
                                                <%if (rs.getString("USERTYPE").equals("User")) {%>
                                                <td><span class="label label-orange"><%=rs.getString("USERTYPE")%></span></td>
                                                    <%} else if (rs.getString("USERTYPE").equals("Seller")) {%>
                                                <td><span class="label label-green"><%=rs.getString("USERTYPE")%></span></td>
                                                    <%} else {%>
                                                <td><span class="label label-info"><%=rs.getString("USERTYPE")%></span></td>
                                                    <%}%>
                                                <td class='hidden-350'><%=rs.getString("LASTLOGIN")%></td>
                                                <%if (rs.getString("STATUS").equals("active")) {%>
                                                <td><span class="label label-green"><%=rs.getString("STATUS")%></span></td>
                                                <%}else {%>
                                                <td><span class="label label-red"><%=rs.getString("STATUS")%></span></td>
                                                <%}%>

                                                <td class='hidden-480'>
                                                    <div class="aParent" style="height: 30px">
                                                        <div>
                                                    <form action="../../ManageUser" method="post">
                                                        <input type="hidden" name="idUSER" value="<%=rs.getString("idUSER")%>"/>
                                                        <input type="hidden" name="STATUS" value="<%=rs.getString("STATUS")%>"/>

                                                        <button type="submit" class="btn"  title="Manage Status"><i class="icon-cogs"></i></button>
                                                    </form>
                                                        </div>
                                                        <a href="../../DeleteUser?id=<%=rs.getString("idUSER")%>"class="btn"><i class="icon-remove"></i></a>
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
