<%-- 
    Document   : cart_detail
    Created on : Oct 12, 2020, 11:05:57 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Divisima | eCommerce Template</title>
        <meta charset="UTF-8">
        <meta name="description" content=" Divisima | eCommerce Template">
        <meta name="keywords" content="divisima, eCommerce, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Favicon -->
        <link href="img/favicon.ico" rel="shortcut icon"/>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,300i,400,400i,700,700i" rel="stylesheet">


        <!-- Stylesheets -->
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css"/>
        <link rel="stylesheet" href="css/flaticon.css"/>
        <link rel="stylesheet" href="css/slicknav.min.css"/>
        <link rel="stylesheet" href="css/jquery-ui.min.css"/>
        <link rel="stylesheet" href="css/owl.carousel.min.css"/>
        <link rel="stylesheet" href="css/animate.css"/>
        <link rel="stylesheet" href="css/style.css"/>


        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header section -->
        <header class="header-section">
            <div class="header-top">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-2 text-center text-lg-left">
                            <!-- logo -->
                            <a href="HomeController"><h4>Hello ${sessionScope.USER.fullName}</h4></a>
                        </div>
                        <div class="col-xl-6 col-lg-5">
                            <form class="header-search-form">
                                <input type="text" placeholder="Search on cake name ...." name="searchCake"
                                       value="${param.searchCake}">
                                <button type="submit" name="btnAction" value="SearchCake"><i class="flaticon-search"></i>
                                </button>
                            </form>
                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="user-panel">
                                <div class="up-item">
                                    <i class="flaticon-profile"></i>
                                    <a href="login.jsp">Sign</a> In or <a href="LogoutController?btnAction=Logout">Logout</a>
                                </div>
                                <div class="up-item">
                                    <a href="CartDetailController">| Shopping Cart | </a>
                                </div>
                                <div class="up-item">
                                    <a href="track_order.jsp">Track Order</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Header section end -->


        <!-- Page info -->
        <div class="page-top-info">
            <div class="container">
                <h4>Your cart</h4>
                <div class="site-pagination">
                    <a href="">Home</a> /
                    <a href="">Your cart</a>
                </div>
            </div>
        </div>

        <p style="color: red">${requestScope.CHECK_OUT_MESSAGE}</p>
        <!-- Page info end -->
        <c:set var="listCake" value="${requestScope.LIST_CAKE_IN_CART}"/>
        <c:if test="${listCake != null}">
            <c:set var="total" value="${0}"/>
            <!-- cart section end -->
            <section class="cart-section spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="cart-table">
                                <h3>Your Cart</h3>
                                <div class="cart-table-warp">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="product-th">Product</th>
                                                <th class="quy-th">Quantity</th>
                                                <th class="total-th">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <c:forEach var="cake" items="${listCake}">
                                            <form>
                                                <input type="hidden" name="cakeId" value="${cake.id}"/>
                                                <tr>
                                                    <td class="product-col">
                                                        <img src="images/${cake.imagePath}" alt="">
                                                        <div class="pc-title">
                                                            <h4>${cake.name}</h4>
                                                            <p>$ ${cake.price}</p>
                                                        </div>
                                                    </td>
                                                    <td class="quy-col">
                                                        <div class="quantity">
                                                            <div class="pro-qty">
                                                                <input type="text" name="quantity" value="${cake.quantity}">
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td class="size-col"><h4>Size M</h4></td>
                                                    <td class="total-col"><h4>$ ${cake.price * cake.quantity}</h4></td>
                                                    <c:set var="total" value="${total + cake.price * cake.quantity}"/>
                                                    <td><input type="submit" name="btnAction" class="btn btn-outline-warning"
                                                               value="Update cart"/></td>
                                                    <td>
                                                        <button type="button" class="btn btn-outline-danger" value="Delete"
                                                                onclick="showDialogDeleteItem('${cake.id}')">Delete
                                                        </button>
                                                    </td>
                                                </tr>

                                            </form>
                                        </c:forEach>
                                        <p style="color: red">${requestScope.CART_MESSAGE}</p>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="total-cost">
                                    <h6>Total <span>$ ${total}</span></h6>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 card-right">
                            <a href="confirm_information.jsp" class="site-btn">Check out Cart</a>
                        </div>
                        <p>Payment: cash</p>
                    </div>
                </div>
            </section>
            <!-- cart section end -->
        </c:if>


        <!-- Footer section -->
        <section class="footer-section">
            <div class="container">
                <div class="footer-logo text-center">
                    <a href="index.html"><img src="./img/logo-light.png" alt=""></a>
                </div>
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget about-widget">
                            <h2>About</h2>
                            <p>Donec vitae purus nunc. Morbi faucibus erat sit amet congue mattis. Nullam frin-gilla faucibus
                                urna, id dapibus erat iaculis ut. Integer ac sem.</p>
                            <img src="img/cards.png" alt="">
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget about-widget">
                            <h2>Questions</h2>
                            <ul>
                                <li><a href="">About Us</a></li>
                                <li><a href="">Track Orders</a></li>
                                <li><a href="">Returns</a></li>
                                <li><a href="">Jobs</a></li>
                                <li><a href="">Shipping</a></li>
                                <li><a href="">Blog</a></li>
                            </ul>
                            <ul>
                                <li><a href="">Partners</a></li>
                                <li><a href="">Bloggers</a></li>
                                <li><a href="">Support</a></li>
                                <li><a href="">Terms of Use</a></li>
                                <li><a href="">Press</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget about-widget">
                            <h2>Questions</h2>
                            <div class="fw-latest-post-widget">
                                <div class="lp-item">
                                    <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/1.jpg"></div>
                                    <div class="lp-content">
                                        <h6>what shoes to wear</h6>
                                        <span>Oct 21, 2018</span>
                                        <a href="#" class="readmore">Read More</a>
                                    </div>
                                </div>
                                <div class="lp-item">
                                    <div class="lp-thumb set-bg" data-setbg="img/blog-thumbs/2.jpg"></div>
                                    <div class="lp-content">
                                        <h6>trends this year</h6>
                                        <span>Oct 21, 2018</span>
                                        <a href="#" class="readmore">Read More</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="footer-widget contact-widget">
                            <h2>Questions</h2>
                            <div class="con-info">
                                <span>C.</span>
                                <p>Your Company Ltd </p>
                            </div>
                            <div class="con-info">
                                <span>B.</span>
                                <p>1481 Creekside Lane Avila Beach, CA 93424, P.O. BOX 68 </p>
                            </div>
                            <div class="con-info">
                                <span>T.</span>
                                <p>+53 345 7953 32453</p>
                            </div>
                            <div class="con-info">
                                <span>E.</span>
                                <p>office@youremail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="social-links-warp">
                <div class="container">
                    <div class="social-links">
                        <a href="" class="instagram"><i class="fa fa-instagram"></i><span>instagram</span></a>
                        <a href="" class="google-plus"><i class="fa fa-google-plus"></i><span>g+plus</span></a>
                        <a href="" class="pinterest"><i class="fa fa-pinterest"></i><span>pinterest</span></a>
                        <a href="" class="facebook"><i class="fa fa-facebook"></i><span>facebook</span></a>
                        <a href="" class="twitter"><i class="fa fa-twitter"></i><span>twitter</span></a>
                        <a href="" class="youtube"><i class="fa fa-youtube"></i><span>youtube</span></a>
                        <a href="" class="tumblr"><i class="fa fa-tumblr-square"></i><span>tumblr</span></a>
                    </div>

                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    <p class="text-white text-center mt-5">Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">Colorlib</a></p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->

                </div>
            </div>
        </section>
        <!-- Footer section end -->


        <!--====== Javascripts & Jquery ======-->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.slicknav.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <script src="js/main_1.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>