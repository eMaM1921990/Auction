<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- PageGuide -->
        <link rel="stylesheet" href="../css/plugins/pageguide/pageguide.css">
        <!-- Fullcalendar -->
        <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.css">
        <link rel="stylesheet" href="../css/plugins/fullcalendar/fullcalendar.print.css" media="print">
        <!-- Tagsinput -->
        <link rel="stylesheet" href="../css/plugins/tagsinput/jquery.tagsinput.css">
        <!-- chosen -->
        <link rel="stylesheet" href="../css/plugins/chosen/chosen.css">
        <!-- multi select -->
        <link rel="stylesheet" href="../css/plugins/multiselect/multi-select.css">
        <!-- timepicker -->
        <link rel="stylesheet" href="../css/plugins/timepicker/bootstrap-timepicker.min.css">
        <!-- colorpicker -->
        <link rel="stylesheet" href="../css/plugins/colorpicker/colorpicker.css">
        <!-- Datepicker -->
        <link rel="stylesheet" href="../css/plugins/datepicker/datepicker.css">
        <!-- Daterangepicker -->
        <link rel="stylesheet" href="../css/plugins/daterangepicker/daterangepicker.css">
        <!-- Plupload -->
        <link rel="stylesheet" href="../css/plugins/plupload/jquery.plupload.queue.css">
        <!-- select2 -->
        <link rel="stylesheet" href="../css/plugins/select2/select2.css">
        <!-- icheck -->
        <link rel="stylesheet" href="../css/plugins/icheck/all.css">
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
        <script src="../js/plugins/jquery-ui/jquery.ui.spinner.js"></script>
        <script src="../js/plugins/jquery-ui/jquery.ui.slider.js"></script>
        <!-- Bootstrap -->
        <script src="../js/bootstrap.min.js"></script>
        <!-- Bootbox -->
        <script src="../js/plugins/bootbox/jquery.bootbox.js"></script>
        <!-- Masked inputs -->
        <script src="../js/plugins/maskedinput/jquery.maskedinput.min.js"></script>
        <!-- TagsInput -->
        <script src="../js/plugins/tagsinput/jquery.tagsinput.min.js"></script>
        <!-- Datepicker -->
        <script src="../js/plugins/datepicker/bootstrap-datepicker.js"></script>
        <!-- Daterangepicker -->
        <script src="../js/plugins/daterangepicker/daterangepicker.js"></script>
        <script src="../js/plugins/daterangepicker/moment.min.js"></script>
        <!-- Timepicker -->
        <script src="../js/plugins/timepicker/bootstrap-timepicker.min.js"></script>
        <!-- Colorpicker -->
        <script src="../js/plugins/colorpicker/bootstrap-colorpicker.js"></script>
        <!-- Chosen -->
        <script src="../js/plugins/chosen/chosen.jquery.min.js"></script>
        <!-- MultiSelect -->
        <script src="../js/plugins/multiselect/jquery.multi-select.js"></script>
        <!-- CKEditor -->
        <script src="../js/plugins/ckeditor/ckeditor.js"></script>
        <!-- PLUpload -->
        <script src="../js/plugins/plupload/plupload.full.js"></script>
        <script src="../js/plugins/plupload/jquery.plupload.queue.js"></script>
        <!-- Custom file upload -->
        <script src="../js/plugins/fileupload/bootstrap-fileupload.min.js"></script>
        <script src="../js/plugins/mockjax/jquery.mockjax.js"></script>
        <!-- select2 -->
        <script src="../js/plugins/select2/select2.min.js"></script>
        <!-- icheck -->
        <script src="../js/plugins/icheck/jquery.icheck.min.js"></script>
        <!-- complexify -->
        <script src="../js/plugins/complexify/jquery.complexify-banlist.min.js"></script>
        <script src="../js/plugins/complexify/jquery.complexify.min.js"></script>
        <!-- Mockjax -->
        <script src="../js/plugins/mockjax/jquery.mockjax.js"></script>


        <!-- Theme framework -->
        <script src="../js/eakroko.min.js"></script>
        <!-- Theme scripts -->
        <script src="../js/application.min.js"></script>
        <!-- Just for demonstration -->
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
                            <h1>Edit Message</h1>
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
                                <a href="View.jsp">Message</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="Edit.jsp">Edit Message</a>
                            </li>
                        </ul>
                        <div class="close-bread">
                            <a href="#"><i class="icon-remove"></i></a>
                        </div>
                    </div>


                    <div class="row-fluid">
                        <div class="span12">
                            <div class="alert alert-success">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Warning!</strong> Best check yo self, you're not looking too good.
                            </div>
                            <div class="alert alert-info">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Warning!</strong> Best check yo self, you're not looking too good.
                            </div>
                            <div class="alert alert-error">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <strong>Warning!</strong> Best check yo self, you're not looking too good.
                            </div>
                            <div class="box box-color box-bordered">
                                <div class="box-title">
                                    <h3><i class="icon-th-list"></i> Message Form</h3>
                                </div>
                                <div class="box-content nopadding">
                                    <form action="../../MessageEdit" method="POST" class='form-horizontal form-bordered'>

                                        <div class="control-group">
                                            <label for="textfield" class="control-label" style="color: red">Message ID</label>
                                            <div class="controls">
                                                <div class="input-append">
                                                    <input type="text" name="idGLOBALMESSAGE" readonly value="${param.idGLOBALMESSAGE}"/>

                                                </div>
                                               
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Category</label>
                                            <div class="controls">
                                                <div class="input-xlarge"><select name="TYPE" id="select" class='chosen-select'>
                                                        <option value="Seller Payment Confirmation">Seller Payment Confirmation</option>
                                                        <option value="Buyer Payment Confirmation">Buyer Payment Confirmation</option>
                                                        <option value="Complete Auction For Seller">Complete Auction For Seller</option>
                                                        <option value="Complete Auction For Buyer">Complete Auction For Buyer</option>


                                                    </select></div>
                                            </div>
                                        </div>

                                       <div class="control-group">
                                            <label for="textfield" class="control-label">Message Content</label>
                                            <div class="controls">
                                                <div class="input-xlarge"><textarea name="CONTENT"  rows="10" cols="200" style="margin-left: 0px; margin-right: 0px; width: 1102px;">
                                                    ${param.CONTENT}
                                                    </textarea></div>
                                            </div>
                                        </div>

                                        










                                        <div class="form-actions">
                                            <button type="submit" class="btn btn-primary">Save changes</button>
                                            <button type="reset" class="btn">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>






                </div>
            </div>
        </div>

    </body>

</html>

