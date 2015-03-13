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

        <script type="text/javascript">

            function data() {
                document.getElementById("select").value = document.getElementById("typ").value;
                //  document.getElementsByName("TRANSPORT").value=<%=request.getParameter("TRANSPORT")%>;

            }
        </script>
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

    <body onload="data()">
        <%@include file="../header.jsp" %>
        <div class="container-fluid nav-hidden" id="content">

            <div id="main">
                <div class="container-fluid">
                    <div class="page-header">
                        <div class="pull-left">
                            <h1>Edit Product</h1>
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
                                <a href="view.jsp">Products</a>
                                <i class="icon-angle-right"></i>
                            </li>
                            <li>
                                <a href="#">Edit Product</a>
                            </li>
                        </ul>
                        <div class="close-bread">
                            <a href="#"><i class="icon-remove"></i></a>
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
                            <div class="box box-color box-bordered">
                                <div class="box-title">
                                    <h3><i class="icon-th-list"></i> Product Form</h3>
                                </div>
                                <div class="box-content nopadding">
                                    <form action="../../editProduct" method="POST" class='form-horizontal form-bordered' enctype='multipart/form-data'>

                                        <div class="control-group">
                                            <label for="textfield" class="control-label" style="color: red">Product ID</label>
                                            <div class="controls">
                                                <div class="input-append">
                                                    <input type="text" name="NAME" readonly value="${param.idPRODUCT}"/>

                                                </div>

                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Product Name</label>
                                            <div class="controls">
                                                <div class="input-append">
                                                    <input type="text" name="NAME" value="${param.NAME}">

                                                </div>
                                                <span class="help-block">
                                                    Please enter product name
                                                </span>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Category</label>
                                            <div class="controls">
                                                <div class="input-xlarge"><select name="select" id="select" class='chosen-select'>
                                                        <option value="1">Beauty</option>
                                                        <option value="2">Electronics</option>
                                                        <option value="3">Jewelry</option>
                                                        <option value="4">Fashion</option>
                                                        <option value="5">Home</option>
                                                        <option value="6">Supplies</option>
                                                        <option value="7">Other</option>

                                                    </select></div>
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="autocom" class="control-label">Quantity</label>
                                            <div class="controls">
                                                <input type="text" name="QUANTITYONHAND" id="textfield"  class="spinner input-mini" value="${param.QUANTITYONHAND}">
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Sell Price</label>
                                            <div class="controls">
                                                <input type="text" d name="SELLPRICE"  value="${param.SELLPRICE}" >
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Shipping Cost</label>
                                            <div class="controls">
                                                <input type="text"  name="SHIPPINGCOST"  value="${param.SHIPPINGCOST}" >
                                            </div>
                                        </div>
                                        <div class="control-group">
                                            <label for="textfield" class="control-label">International Shipping</label>
                                            <div class="controls">
                                                <div class="check-line">
                                                    <input type="radio" id="c7" class='icheck-me' name="TRANSPORT" data-skin="square" data-color="blue" value="Yes"> <label class='inline' for="c7">Yes</label>
                                                </div>
                                                <div class="check-line">
                                                    <input type="radio" id="c8" class='icheck-me' name="TRANSPORT" data-skin="square" data-color="blue"  value="No"> <label class='inline' for="c8">No</label>
                                                </div>
                                            </div>
                                        </div>


                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Image  </label>
                                            <div class="controls">

                                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <div class="input-append">
                                                        <div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" name="aaaa" /></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>

                                                    </div>


                                                </div>
                                                <a href="../../${param.IMAGEURL}" target="_blank"><i class="icon-search"></i></a>View Current Image


                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Image 2</label>
                                            <div class="controls">

                                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <div class="input-append">
                                                        <div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" name="aaaa" /></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
                                                    </div>
                                                </div>

                                                <a href="../../${param.IMAGEURL2}" ><i class="icon-search"></i></a>View Current Image
                                            </div>
                                        </div>

                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Image 3</label>
                                            <div class="controls">

                                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <div class="input-append">
                                                        <div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" name="aaaa" /></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
                                                    </div>
                                                </div>

                                                <a href="../../${param.IMAGEURL3}" ><i class="icon-search"></i></a>View Current Image
                                            </div>
                                        </div>


                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Image 4</label>
                                            <div class="controls">

                                                <div class="fileupload fileupload-new" data-provides="fileupload">
                                                    <div class="input-append">
                                                        <div class="uneditable-input span3"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Select file</span><span class="fileupload-exists">Change</span><input type="file" name="aaaa" /></span><a href="#" class="btn fileupload-exists" data-dismiss="fileupload">Remove</a>
                                                    </div>
                                                </div>
                                                <a href="../../${param.IMAGEURL4}" ><i class="icon-search"></i></a>View Current Image
                                            </div>

                                        </div>        



                                        <div class="control-group">
                                            <label for="textfield" class="control-label">Description</label>
                                            <div class="controls">
                                                <div class="input-xlarge"><textarea name="DESC"  rows="5" cols="100" style="margin-left: 0px; margin-right: 0px; width: 200%;">
                                                        ${param.DESCS}
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

