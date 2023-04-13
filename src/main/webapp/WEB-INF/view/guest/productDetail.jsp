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
    <title>Product detail</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <style>
        .rating-color {
            color: #fbc634 !important;
        }
    </style>
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
<div class="container my-4">
    <div class="container mt-5 mb-5">
        <div class="row justify-content-center bg-success-subtle">
            <div class="col-8 my-2">
                <div class="card" style="height: 470px">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="images p-3">
                                <img src="${pageContext.request.contextPath}/resources/img/product/${product.image}.jpg"
                                     class="img-fluid" alt="...">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="product p-4">
                                <div class="mt-4 mb-3"><span
                                        class="text-uppercase text-muted brand"><h2>${product.name}</h2></span>
                                    <div><span class="fs-3 ">$ ${product.unitPrice}</span> <strike
                                            class="product_discount"> <span
                                            style='color:black'> $ ${product.price}</span> </strike></div>
                                    <div><span class="product_saved">You Saved:</span> <span
                                            style='color:black'>$ ${product.price-product.unitPrice}</span></div>
                                    <div class=" align-items-center">
                                        <p class="product_info my-2">
                                            <c:if test="${product.rate != null}">
                                                <span>Rate: </span>
                                                <span class="px-2 pt-2 ">${String.format("%.1f",product.rate)} <i class="fa fa-star fa-sm text-warning"></i></span>
                                            </c:if>
                                        </p>
                                        <p class="product_info my-2">Brand new 100% genuine.</p>
                                        <p class="product_info my-2">Original box, full accessories from the
                                            manufacturer.</p>
                                        <p class="product_info my-2">Accessories include: Cable, sim stick, manual.</p>
                                        <p class="product_info my-2">In Stock: ${product.sold} units sold. </p>
                                    </div>
                                    <div class="row my-3">
                                        <a href="userCart2?name=${product.name}&price=${product.unitPrice}&image=${product.image}&id=${product.id}&bl=0&quantity=1"
                                           class="col btn btn-danger mx-2">Buy now</a>
                                        <a href="userCart2?name=${product.name}&price=${product.unitPrice}&image=${product.image}&id=${product.id}&bl=1&quantity=1"
                                           class="col btn btn-primary  mx-2">Add to cart</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" col-4 my-2">
                <div class="card " style="height: 470px">
                    <div class="p-4 text-center">
                        <div class="mt-4 mb-3"><span
                                class="text-uppercase text-muted brand"><h2>Specifications</h2></span>
                        </div>
                    </div>
                    <div class="row m-3">
                        <table class="table table-striped ">
                            <tr>
                                <td>Pin:</td>
                                <td>${product.pin}</td>
                            </tr>
                            <tr>
                                <td>Memory:</td>
                                <td>${product.memory}</td>
                            </tr>
                            <tr>
                                <td>Camera:</td>
                                <td>${product.camera}</td>
                            </tr>
                            <tr>
                                <td>Producer:</td>
                                <td>${product.producer }</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="row bg-success-subtle justify-content-center">
            <div class=" justify-content-center">
                <div class="col-lg-12 ">
                    <div class="card text-dark">
                        <div class="card-body p-4">
                            <h4 class="mb-0">Recent comments</h4>
                            <p class="fw-light mb-4 pb-2">Latest Comments section by users who have purchased( ${bought})</p>
                            <c:forEach items="${CR}" var="cr">
                                <div class="d-flex flex-start my-2">
                                    <img class="rounded-circle shadow-1-strong me-3"
                                         src="${pageContext.request.contextPath}/resources/img/user.png" alt="avatar"
                                         width="60"
                                         height="60"/>
                                    <div>
                                        <div>
                                            <h6 class="fw-bold mb-1">${cr.customerCR.fullName}</h6>
                                            <p class="mb-1">${cr.date}</p>
                                            <div class="d-flex align-items-center mb-3">
                                                <c:if test="${cr.rate == 5}">
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                </c:if>
                                                <c:if test="${cr.rate == 4}">
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                </c:if>
                                                <c:if test="${cr.rate == 3}">
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                </c:if>
                                                <c:if test="${cr.rate == 2}">
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                </c:if>
                                                <c:if test="${cr.rate == 1}">
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                    <i class="fa fa-star fa-sm text-warning"></i>
                                                </c:if>
                                            </div>
                                            <p class="mb-0">
                                                    ${cr.comment}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <hr class="my-0"/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 my-2">
                    <div class="card">
                        <div class="card-body p-4">
                            <div class="d-flex flex-start w-100">
                                <div class="w-100">
                                    <form action="userComment" method="get">
                                        <h5>Rating</h5>
                                        <input type="hidden" value="${product.id}" name="id">
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rate"
                                                   value="1">
                                            <label class="form-check-label">1 <i
                                                    class="fa fa-star rating-color"></i></label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rate"
                                                   value="2">
                                            <label class="form-check-label">2 <i
                                                    class="fa fa-star rating-color"></i></label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rate"
                                                   value="3">
                                            <label class="form-check-label">3 <i
                                                    class="fa fa-star rating-color"></i></label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rate"
                                                   value="4">
                                            <label class="form-check-label">4 <i
                                                    class="fa fa-star rating-color"></i></label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="rate"
                                                   value="5">
                                            <label class="form-check-label">5 <i
                                                    class="fa fa-star rating-color"></i></label>
                                        </div>
                                        <h5 class="my-lg-3">Add a comment</h5>
                                        <div class="form-outline">
                                                <textarea class="form-control" name="content" rows="4"
                                                          placeholder="What is your view?"></textarea>
                                        </div>
                                        <div class="text-end my-3">
                                            <button type="reset" class="btn btn-danger">
                                                Cancel <i class="fa fa-times"></i>
                                            </button>
                                            <button type="submit" class="btn btn-success">
                                                Send <i class="fa fa-long-arrow-right"></i>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            <!--Grid column-->

            <!--Grid column-->
            <!--Grid column-->
        </div>
        <!--Grid row-->
    </div>
    <!-- Grid container -->

    <!-- Copyright -->
    <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2)">
        © 2023 Copyright:
    </div>
    <!-- Copyright -->
</footer>
</body>
</html>
