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
                            <h1>Message Center</h1>
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
                                <a href="../dashboard.jsp">Home</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Message</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="listmessage.jsp">View</a>
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
                                <strong>Success!</strong> ${param.success}.
                            </div>
                           
                            <div class="alert alert-error" style="display: ${param.err}">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Warning!</strong> ${param.error}.
                            </div>
                            <div class="box box-color">
                                <div class="box-title">
                                    <h3>
                                        <i class="icon-reorder"></i>
                                        Message Center
                                    </h3>
                                    <ul class="tabs">
                                        <li class="active">
                                            <a href="#t7" data-toggle="tab">Inbox</a>
                                        </li>
                                        <li>
                                            <a href="#t8" data-toggle="tab">Sent</a>
                                        </li>

                                    </ul>
                                </div>
                                <div class="box-content">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="t7">
                                            <div class="box">
                                               
                                                <div class="box-content nopadding">
                                                    <table class="table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable">
                                                        <thead>
                                                            <tr class='thefilter'>
                                                                 <th class='hidden-1024'>Sender</th>
                                                                <th class='hidden-1024'>Subject</th>
                                                                <th class='hidden-350'>Date</th>
                                                                <th class='hidden-1024'>Option</th>
                                                            </tr>
                                                            <tr>
                                                                <th class='hidden-1024'>Sender</th>
                                                                <th class='hidden-1024'>Subject</th>
                                                                <th class='hidden-350'>Date</th>
                                                                <th class='hidden-1024'>Option</th>
                                                               
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%db.pstm = db.con.prepareStatement("SELECT * FROM MAILHEADER WHERE TOS=? ORDER BY DAYS DESC");
                                                                db.pstm.setInt(1, login.getUserId());
                                                                ResultSet rs = db.pstm.executeQuery();
                                                                while (rs.next()) {
                                                            %>

                                                            <tr>
                                                                <td><span class="label label-orange"><%=rs.getString("FROMS")%></span></td>
                                                                <td style="color: red"><%=rs.getString("SUBJECT")%></td>
                                                                <td><%=rs.getString("DAYS")%></td>
                                                                <td>
                                                                    <div class="aParent" style="height: 30px">
                                                                        <div>
                                                                            
                                                                            <form action="replaymessage.jsp">
                                                                                <input type="hidden" name="idMAILHEADER" value="<%=rs.getString("idMAILHEADER")%>" />
                                                                                <input type="hidden" name="FROMS" value="<%=rs.getString("FROMS")%>" />
                                                                                <input type="hidden" name="SUBJECT" value="<%=rs.getString("SUBJECT")%>" />
                                                                                <input type="hidden" name="DETAILS" value="<%=rs.getString("DETAILS")%>" />
                                                                                <input type="hidden" name="DAYS" value="<%=rs.getString("DAYS")%>" />
                                                                              <button type="submit" class="btn" ><i class="icon-edit"></i></button>  
                                                                            </form>
                                                                        </div>
                                                                              <div>
                                                                                  <a href="../../deleteinbox?id=<%=rs.getInt("idMAILHEADER")%>" class="btn"><i class="icon-remove"></i></a> 
                                                                              </div>
                                                                    </div>
                                                                </td>
                                                                
                                                               
                                                               
                                                            </tr>
                                                            <%}
                                                               db.pstm.close();
                                                                db.closeConnection();
                                                            %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="tab-pane" id="t8">
                                            <div class="box">
                                               
                                                <div class="box-content nopadding">
                                                    <table class="table table-hover table-nomargin table-bordered dataTable-columnfilter dataTable">
                                                        <thead>
                                                            <tr class='thefilter'>
                                                                 <th class='hidden-1024'>Sender</th>
                                                                <th class='hidden-1024'>Subject</th>
                                                                <th class='hidden-350'>Date</th>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <th class='hidden-1024'>Sender</th>
                                                                <th class='hidden-1024'>Subject</th>
                                                                <th class='hidden-350'>Date</th>
                                                               
                                                               
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% 
                                                                String sql="SELECT * FROM MAILHEADER WHERE FROMS='"+login.getUserName()+"'";
                                                                db.connect();
                                                                
                                                                ResultSet rs2 = db.excuteQuery(sql);
                                                                while (rs2.next()) {
                                                            %>

                                                            <tr>
                                                                <td ><%=rs2.getString("FROMS")%></td>
                                                                <td><%=rs2.getString("SUBJECT")%></td>
                                                                <td><%=rs2.getString("DAYS")%></td>
                                                               
                                                               
                                                               
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
                    </div>

                                                        <div class="row-fluid">
                                                                            <div class="span12">
                                                                                <form action="sentmessage.jsp" method="post">
                                                                                    <button class="btn btn-danger btn btn-large">New Message</button>
                                                                                </form>  
                                                                            </div>
                                                                            </div>




                </div>
            </div>
        </div>



    </body>

</html>
