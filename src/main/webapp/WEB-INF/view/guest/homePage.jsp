<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02/03/23
  Time: 7:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.js"></script>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

</head>
<body class="font-monospace">
<header>
    <!-- Navbar -->
    <nav class="navbar navbar-light bg-secondary">
        <a class="navbar-brand mx-5 " href="homePage">
            <img src="${pageContext.request.contextPath}/resources/img/1.jpg" width="50" height="50"
                 class="d-inline align-top " alt="">
            <div class="d-inline text-light display-6 m-lg-3">taistore</div>
        </a>
        <!-- Search form -->
        <form class="d-flex input-group w-25" action="searchProductByName">
            <input type="search" class="form-control border-3" placeholder="Search" name="name" aria-label="Search"/>
            <input class="btn btn-outline-primary" type="submit" value="Search" data-mdb-ripple-color="dark">
            </input>
        </form>
        <div class="row mx-5 ">
            <div class="col">
                <a class="btn btn-light navbar-brand m-lg-3" href="userCart">
                    <span class="" style="font-size: 1rem; font-weight: bold">Cart</span>
                    <i class="fa fa-shopping-cart " aria-hidden="true">
                        <c:if test="${cart.size() != null}">
                            <span class="w-75"> (${cart.size()})</span>
                        </c:if>
                        <c:if test="${cart.size() == null}">
                            <span class="w-75"> (0)</span>
                        </c:if>
                    </i>
                </a>
            </div>
            <div class="col">
                <div class="dropdown">
                    <c:choose>
                        <c:when test="${userId != null}">
                            <a class="btn btn-light navbar-brand m-lg-3" type="button" id="dropdownMenuButton1"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="" style="font-size: 1rem; font-weight: bold">User</span>
                                <i class="fa fa-user " aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu" style="margin-right: 50px" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item" href="account">Accounts & security</a></li>
                                <li><a class="dropdown-item" href="#">Bank account/ Bank card</a></li>
                                <li>
                                    <form class="dropdown-item" action="j_spring_security_logout" method="post">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <input type="submit" value="Logout"/>
                                    </form>
                                </li>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-light navbar-brand m-lg-3" type="button" id="dropdownMenuButton1"
                               data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="" style="font-size: 1rem; font-weight: bold">User</span>
                                <i class="fa fa-user " aria-hidden="true"></i>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">

                                <li><a class="dropdown-item" href="login">Sign in</a></li>
                                <li><a class="dropdown-item" href="resigter">Register</a></li>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="col">
                <a class="btn btn-light navbar-brand m-lg-3" href="userOrderHistory">
                    <span class="" style="font-size: 1rem; font-weight: bold">Order history</span>
                    <i class="fa fa-bookmark" aria-hidden="true"></i>
                    <span class="badge bg-secondary"></span>
                </a>
            </div>
        </div>
    </nav>
</header>


<!-- Start your project here-->
<div class="bg-light">
    <div class="">
        <nav class="navbar navbar-expand-lg navbar-collapse ">
            <!-- Container wrapper -->
            <div class="container-fluid  " style="width: 1090px">
                <!-- Collapsible wrapper -->
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <!-- Left links -->
                    <ul class="navbar-nav  ">
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link active" aria-current="page" href="homePage"><i class="fa fa-home" aria-hidden="true"></i>
                                Home
                            </a>
                        </li>
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link" href="getProductList"> <i class="fa fa-mobile" aria-hidden="true"></i>
                                Smart
                                phone</a>
                        </li>
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link" href="#"><i class="fa fa-laptop" aria-hidden="true"></i> Laptop</a>
                        </li>
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link" href="#"><i class="fa fa-tablet" aria-hidden="true"></i> Tablet</a>
                        </li>
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link" href="#"><i class="fa fa-headphones" aria-hidden="true"></i>
                                Accessory</a>
                        </li>
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link" href="#"><i class="fa fa-newspaper-o" aria-hidden="true"></i> Tech news</a>
                        </li>
                        <li class="nav-item mx-lg-3">
                            <a class="nav-link" href="#"><i class="fa fa-headphones" aria-hidden="true"></i> Trick
                                corner</a>
                        </li>
                    </ul>
                    <!-- Left links -->


                </div>
                <!-- Collapsible wrapper -->
            </div>
            <!-- Container wrapper -->
        </nav>
    </div>
</div>
<div class="container my-4 text-center">
    <div class="row justify-content-xl-center">
        <div class="col-8">
            <div id="carouselExampleIndicators" class="carousel slide justify-content-center" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
                            class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                            aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                            aria-label="Slide 3"></button>
                </div>
                <div class="carousel-inner my-2">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/resources/img/slide/img.png"
                             class="rounded d-block w-100" style="width: 855px;height: 415px;"
                             alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/resources/img/slide/img_1.png"
                             class=" rounded d-block w-100" style="width: 855px;height: 415px;"
                             alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/resources/img/slide/img_2.png"
                             class="rounded d-block w-100" style="width: 855px;height: 415px;"
                             alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="col-4">
            <img src="${pageContext.request.contextPath}/resources/img/slide/img_3.png" class="rounded img-fluid my-2"
                 style="width: 395px;height: 205px;"
                 style="width: 95%">
            <img src="${pageContext.request.contextPath}/resources/img/slide/img_4.png" class="rounded img-fluid "
                 style="width: 395px;height: 202px;"
                 style="width: 95%">
        </div>
    </div>
    <div class="row container my-4 text-center ">
        <div class="col-sm-12 my-3 border border-danger border-5 rounded-5">
            <div>
                <h1 class="text-danger-emphasis fst-italic fw-bold">Sale</h1>
            </div>
            <section>
                <div id="owl-demo1" class="owl-carousel owl-theme text-sm-start ">
                    <c:forEach var="p" items="${promotion}">
                        <div class="item mx-1">
                            <a href="getProductById?id=${p.product.id}">
                                <img src="${pageContext.request.contextPath}/resources/img/product/${p.product.image}.jpg">
                                <div class="card-img-overlay ">
                                    <div class="card-text d-flex justify-content-md-end" style="height: 50px">
                                    <span class="rounded-circle bg-danger h-100 " style="width: 50px">
                                        <p class="mx-lg-2 text-white"
                                           style="margin-top: 10px"> ${String.format("%.0f",p.promotion)}% </p>
                                    </span>
                                    </div>
                                </div>
                            </a>

                            <div class="my-2" style="margin-left: 20px">
                                <div class="card-body">
                                    <p class="card-text fw-bold text-xl-center"><small>${p.product.name}</small></p>
                                    <p class="card-text mx-3"><small>Pin: ${p.product.pin} mA</small></p>
                                    <p class="card-text mx-3"><small>Memory: ${p.product.memory}</small></p>
                                    <p class="card-text mx-3"><small>Camera: ${p.product.camera}</small></p>
                                </div>
                                <div class="d-flex flex-row m-2">
                                    <h5 class="mb-1 me-1 ">$${p.product.unitPrice}</h5>
                                    <c:if test="${p.promotion != null}">
                                        <p class="card-text text-danger">
                                            <span class="text-danger mx-3"><s>$${String.format("%.0f",p.product.price)}</s></span>
                                        </p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>
        <div class="col-sm-12 my-3 border border-warning border-5 rounded-5">
            <div>
                <h1 class="text-warning-emphasis fst-italic fw-bold">Top 8 best-selling products</h1>
            </div>
            <section>
                <div id="owl-demo" class=" owl-carousel owl-theme text-sm-start ">
                    <c:forEach var="p" items="${topProduct}">
                        <div class="item mx-1">
                            <a href="getProductById?id=${p.id}">
                                <img src="${pageContext.request.contextPath}/resources/img/product/${p.image}.jpg">
                                <c:if test="${p.promotion != null}">
                                    <div class="card-img-overlay ">
                                        <div class="card-text d-flex justify-content-md-end" style="height: 50px">
                                    <span class="rounded-circle bg-danger h-100 " style="width: 50px">
                                        <p class="mx-lg-2 text-white"
                                           style="margin-top: 10px"> ${String.format("%.0f",p.promotion.promotion)}%
                                        </p>
                                    </span>
                                        </div>
                                    </div>
                                </c:if>
                            </a>

                            <div class="my-2" style="margin-left: 20px">
                                <div class="card-body">
                                    <p class="card-text fw-bold text-xl-center"><small>${p.name}</small></p>
                                    <p class="card-text mx-3"><small>Pin: ${p.pin} mA</small></p>
                                    <p class="card-text mx-3"><small>Memory: ${p.memory}</small></p>
                                    <p class="card-text mx-3"><small>Camera: ${p.camera}</small></p>

                                </div>
                                <div class="d-flex flex-row m-2">
                                    <h5 class="mb-1 me-1 ">$${p.unitPrice}</h5>
                                    <c:if test="${p.promotion != null}">
                                        <p class="card-text text-danger">
                                            <span class="text-danger mx-3"><s>$${String.format("%.0f",p.price)}</s></span>
                                        </p>
                                    </c:if>
                                </div>
                                <p class="m-2">Sold: ${p.sold}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
        </div>
    </div>
    <div class="row container my-4 text-center ">
        <div class="border border-primary border-5 rounded-5">
            <div>
                <h1 class="text-primary-emphasis fst-italic fw-bold ">New product</h1>
            </div>
            <section>
                <div id="owl-demo2" class="owl-carousel owl-theme text-sm-start ">
                    <c:forEach var="p" items="${products}">
                        <div class="item mx-1">
                            <a href="getProductById?id=${p.id}">
                                <img src="${pageContext.request.contextPath}/resources/img/product/${p.image}.jpg">
                                <c:if test="${p.promotion != null}">
                                    <div class="card-img-overlay ">
                                        <div class="card-text d-flex justify-content-md-end" style="height: 50px">
                                    <span class="rounded-circle bg-danger h-100 " style="width: 50px">
                                        <p class="mx-lg-2 text-white"
                                           style="margin-top: 10px"> ${String.format("%.0f",p.promotion.promotion)}%
                                        </p>
                                    </span>
                                        </div>
                                    </div>
                                </c:if>
                            </a>

                            <c:if test="${p.promotion != null}">
                                <div class="card-img-overlay"><p class="card-text">${p.promotion.promotion} %</p></div>
                            </c:if>
                            <div class="my-2" style="margin-left: 20px">
                                <div class="card-body">
                                    <p class="card-text fw-bold text-xl-center"><small>${p.name}</small></p>
                                    <p class="card-text mx-3"><small>Pin: ${p.pin} mA</small></p>
                                    <p class="card-text mx-3"><small>Memory: ${p.memory}</small></p>
                                    <p class="card-text mx-3"><small>Camera: ${p.camera}</small></p>
                                </div>
                                <div class="d-flex flex-row m-2">
                                    <h5 class="mb-1 me-1 ">$${p.unitPrice}</h5>
                                    <c:if test="${p.promotion != null}">
                                        <p class="card-text text-danger">
                                            <span class="text-danger mx-3"><s>$${String.format("%.0f",p.price)}</s></span>
                                        </p>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </section>
            <div class="col text-sm-end">
                <a href="getProductList">See more >></a>
            </div>
        </div>
    </div>
</div>
<!-- End your project here-->

<footer class="bg-secondary text-white text-center text-lg-start">
    <!-- Grid container -->
    <div class="container p-4">
        <!--Grid row-->
        <div class="row">
            <!--Grid column-->
            <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                <h5 class="text-uppercase">About me</h5>
                <p>
                    Nothing
                </p>
            </div>
        </div>
        <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2020 Copyright:
    </div>
    <!-- Copyright -->
</footer>
</body>
<script>
    $(document).ready(function () {
        $("#owl-demo").owlCarousel({

            autoPlay: 3000, //Set AutoPlay to 3 seconds

            items: 5,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]

        });

    });
    $(document).ready(function () {
        $("#owl-demo1").owlCarousel({

            autoPlay: 3000, //Set AutoPlay to 3 seconds

            items: 5,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]

        });

    });
    $(document).ready(function () {
        $("#owl-demo2").owlCarousel({

            autoPlay: 3000, //Set AutoPlay to 3 seconds

            items: 5,
            itemsDesktop: [1199, 3],
            itemsDesktopSmall: [979, 3]

        });

    });
</script>
</html>
