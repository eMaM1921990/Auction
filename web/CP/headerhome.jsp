<%-- 
    Document   : header
    Created on : May 3, 2014, 11:07:09 PM
    Author     : emam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="beans.LoginBeans" %>
<%session = request.getSession();
    beans.LoginBeans login;
    login = (beans.LoginBeans) session.getAttribute("login");
    String username = "";
    int userid = 0;
    int type = 0;
    if (login.getUserName() != null) {
        username = login.getUserName();
        userid = login.getUserId();
        type = login.getUserType();
    } else {
        response.sendRedirect(request.getContextPath() + "/Redirect.jsp");
    }

%>
<link rel="stylesheet" type="text/css" href="style/freeow/freeow.css" />
<link rel="stylesheet" type="text/css" href="css/demo.css" />

<script type="text/javascript" src="js/jquery.freeow.js"></script>
<script type="text/javascript">

    var automax = setInterval(function()
    {
        $('#message').load('../backendunreadmessage').fadeIn("slow");
    }, 1000000); // refresh every 5000 milliseconds


</script>
<!DOCTYPE html>

<div id="navigation">
    <div class="container-fluid">
        <a href="#" id="brand">Auction </a>

        <ul class='main-nav'>
            <li class='active'>
                <a href="../FO/Portal.jsp">
                    <i class="icon-exchange"></i>
                </a>
            </li>
            <li >

                <a href="index.jsp">
                    <span>Dashboard</span>
                </a>
            </li>
            <li >
                <a href="#" data-toggle="dropdown" class='dropdown-toggle'>
                    <span>Product & List</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <%if (type == 1) {%>
                    <li>
                        <a href="product/view.jsp">Manage Product</a>
                    </li>
                    <li >
                        <a href="product/sellerproduct.jsp">Seller Product</a>
                    </li>
                    <li>
                        <a href="List/view.jsp">Manage List</a>
                    </li>
                    <li>
                        <a href="List/sellerList.jsp">Seller List</a>
                    </li>
                    <%} else if (type == 2) {%>
                    <li>
                        <a href="product/view.jsp">Manage Product</a>
                    </li>

                    <li>
                        <a href="List/view.jsp">Manage List</a>
                    </li>
                    <%}%>
                </ul>
            </li>
            <li>
                <a href="#" data-toggle="dropdown" class='dropdown-toggle'>
                    <span>Auction</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="auction/view.jsp">Auction Statistics</a>
                    </li>

                </ul>
            </li>
            <%if (type == 1) {%>
            <li>
                <a href="#" data-toggle="dropdown" class='dropdown-toggle'>
                    <span>User</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="user/view.jsp">Manage Users</a>
                    </li>

                </ul>
            </li>

            <li>
                <a href="#" data-toggle="dropdown" class='dropdown-toggle'>
                    <span>Financial</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="Finance/viewFees.jsp">Fees</a>
                    </li>
                    <li>
                        <a href="Finance/MyRevenu.jsp">My Auctions Revenue</a>
                    </li>
                    <li>
                        <a href="Finance/MyReveneFromSeller.jsp">My Revenue from seller </a>
                    </li>
                    <li>
                        <a href="Finance/Payment.jsp"> Payment Not Received</a>
                    </li>

                </ul>
            </li>
            <%} else if (type == 2) {%>

            <li>
                <a href="#" data-toggle="dropdown" class='dropdown-toggle'>
                    <span>Financial</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">

                    <li>
                        <a href="SellerRevenu/MyRevenu.jsp">My Auctions Revenue</a>
                    </li>
                    


                </ul>
            </li>
            <%}%>
            <%if (type == 1) {%>
            <li>
                <a href="#" data-toggle="dropdown" class='dropdown-toggle'>
                    <span>General Setting</span>
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="Message/View.jsp">Message Template</a>
                    </li>
                </ul>
            </li>
            <%}%>

        </ul>
        <div class="user">
            <ul class="icon-nav">
                <li class='dropdown'>
                    <a href="#" class='dropdown-toggle' data-toggle="dropdown"><i class="icon-envelope"></i><span class="label label-lightred"><div id="message"></div></span></a>
                    <ul class="dropdown-menu pull-right message-ul">



                        <li>
                            <a href="collaboration/listmessage.jsp" class='more-messages'>Go to Message center <i class="icon-arrow-right"></i></a>
                        </li>
                    </ul>
                </li>



                <li class='dropdown language-select'>
                    <a href="#" class='dropdown-toggle' data-toggle="dropdown"><img src="img/demo/flags/us.gif" alt=""><span>US</span></a>


                </li>
            </ul>
            <div class="dropdown">
                <a href="#" class='dropdown-toggle' data-toggle="dropdown"><%=username%><img src="img/demo/user-avatar.jpg" alt=""></a>
                <ul class="dropdown-menu pull-right">
                    <li>
                        <a href="../FO/UpdateProfile.jsp">Edit profile</a>
                    </li>

                    <li>
                        <a href="../Logout">Sign out</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div id="freeow" class="freeow freeow-bottom-right "></div>