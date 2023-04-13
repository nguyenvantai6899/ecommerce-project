<%@ page import="java.util.List" %>
<%@ page import="entity.Cart" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Payment</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
    <% int i = 0;%>
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
<div class="container my-4 ">
    <form:form action="userPayment"  method="post" class="justify-content-md-center">
        <div class="row justify-content-md-center my-3 " >
            <div class="col-2 ">
                <div class="input-group">
                    <span class="input-group-text">ID Order</span>
                    <input class="form-control" name="idOrder" readonly aria-label="With textarea" value="${orderId}"></input>
                </div>
            </div>
            <div class="col-2">
                <div class="input-group">
                    <span class="input-group-text">Total Price</span>
                    <input class="form-control" name="totalP" readonly aria-label="With textarea" value="${totalP}"></input>
                </div>
            </div>
        </div>
        <div class="row mx-lg-5 border border-danger">
        <div class="col-12">
            <label class="form-label">Name on card</label>
            <input type="text" name="name" class="form-control">
        </div>
        <div class="col-6">
            <label class="form-label">Card id</label>
            <input type="text" name="fromAcc" class="form-control">
        </div>
        <div class="col-4">
            <label class="form-label">Expiration date</label>
            <input type="text" name="date" class="form-control">
        </div>
        <div class="col-2">
            <label class="form-label">Code</label>
            <input type="text" name="code"
                   class="form-control">
        </div>
        <div class="col-12">
            <label for="inputAddress" class="form-label">Address</label>
            <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
        </div>
        <div class="col-12">
            <label for="inputAddress2" class="form-label">Address 2</label>
            <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor">
        </div>
        <div class="col-md-6">
            <label for="inputCity" class="form-label">City</label>
            <input type="text" class="form-control" id="inputCity">
        </div>
        <div class="col-md-4">
            <label for="inputState" class="form-label">State</label>
            <select id="inputState" class="form-select">
                <option selected>Choose...</option>
                <option>...</option>
            </select>
        </div>
        <div class="col-md-2">
            <label for="inputZip" class="form-label">Zip</label>
            <input type="text" class="form-control" id="inputZip">
        </div>
        <div class="col-12">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="gridCheck">
                <label class="form-check-label" for="gridCheck">
                    Check me out
                </label>
            </div>
        </div>
        <div class="row justify-content-md-center my-3">
            <input type="submit" class="col-8 text-xxl-center btn btn-outline-danger" value="Pay now">
        </div>
        </div>
    </form:form>
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
        © 2023 Copyright:
    </div>
    <!-- Copyright -->
</footer>
</body>
</html>
