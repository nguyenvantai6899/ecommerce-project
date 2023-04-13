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
    <title>Product list</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
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
    <div class="row mx-3">
        <p>
            <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button"
               aria-expanded="false"
               aria-controls="collapseExample">
                <i class="fa fa-filter" aria-hidden="true"></i>
                Search product by category
            </a>
        </p>
        <div class="collapse" id="collapseExample">
            <div class="card card-body">
                <form action="searchProduct" method="get">
                    <div class="d-flex flex-nowrap">
                        <input type="checkbox" class="btn-check " id="btn-check-6-outlined" name="producer" value="a"
                               checked readonly autocomplete="off">
                        <label class="mx-2" for="btn-check-6-outlined"><h6>Producer</h6></label><br>
                        <input type="checkbox" class="btn-check " id="btn-check-outlined" name="producer" value="Apple"
                               autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-outlined">Apple</label><br>
                        <input type="checkbox" class="btn-check" id="btn-check-2-outlined" name="producer"
                               value="Samsum" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-2-outlined">Samsum</label><br>
                        <input type="checkbox" class="btn-check" id="btn-check-3-outlined" name="producer"
                               value="Xiaomi" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-3-outlined">Xiaomi</label><br>
                        <input type="checkbox" class="btn-check" id="btn-check-4-outlined" name="producer" value="Oppo"
                               autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-4-outlined">Oppo</label><br>
                        <input type="checkbox" class="btn-check" id="btn-check-5-outlined" name="producer" value="Vivo"
                               autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-5-outlined">Vivo</label><br>
                    </div>
                    <div class="d-flex flex-nowrap" style="margin-top: 10px">
                        <input type="checkbox" class="btn-check mx-2" id="btn-check-7-outlined" name="memory" value="a"
                               checked readonly autocomplete="off">
                        <label class="mx-2" for="btn-check-7-outlined"><h6>Memory</h6></label><br>
                        <input type="checkbox" class="btn-check " id="btn-check-8-outlined" name="memory"
                               value="6GB-128GB" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-8-outlined">6GB-128GB</label><br>
                        <input type="checkbox" class="btn-check" id="btn-check-9-outlined" name="memory"
                               value="8GB-128GB" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-9-outlined">8GB-128GB</label><br>
                        <input type="checkbox" class="btn-check " id="btn-check-10-outlined" name="memory"
                               value="8GB-256GB" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-10-outlined">8GB-256GB</label><br>
                        <input type="checkbox" class="btn-check" id="btn-check-11-outlined" name="memory"
                               value="8GB-512GB" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="btn-check-11-outlined">8GB-512GB</label><br>
                    </div>
                    <div class="d-flex flex-nowrap" style="margin-top: 10px">
                        <input type="radio" class="btn-check " name="pin" value="3" id="1" autocomplete="off" checked>
                        <label class="mx-2" for="1"><h6 style="margin-right: 39px;">Pin</h6></label>
                        <input type="radio" class="btn-check " name="pin" value="1" id="2" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="2"> >5000mAh</label>
                        <input type="radio" class="btn-check " name="pin" value="2" id="3" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="3"> <5000mAh</label>
                    </div>
                    <div class="d-flex flex-nowrap" style="margin-top: 10px">
                        <input type="radio" class="btn-check " name="price" value="4" id="4" autocomplete="off" checked>
                        <label class="mx-2" for="4"><h6 style="margin-right: 25px;">Price</h6></label>
                        <input type="radio" class="btn-check " name="price" value="3" id="7" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="7"> < 1000$</label>
                        <input type="radio" class="btn-check " name="price" value="2" id="6" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="6">1000$- 2000$</label>
                        <input type="radio" class="btn-check " name="price" value="1" id="5" autocomplete="off">
                        <label class="btn btn-outline-primary mx-2" for="5"> > 2000$</label>
                    </div>
                    <input type="submit" class="btn btn-success m-2">
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <c:forEach var="p" items="${productList}">
            <div class="col-3 card  my-2 shadow-2-strong mx-2" style="width: 23%">

                <a href="getProductById?id=${p.id}">
                    <img src="${pageContext.request.contextPath}/resources/img/product/${p.image}.jpg"
                         class="card-img-top rounded mx-auto d-block" alt="...">
                    <c:if test="${p.promotion != null}">
                        <div class="">
                            <div class="card-img-overlay  card-text d-flex justify-content-md-end" style="height: 100px">
                                    <span class="rounded-circle bg-danger h-100 " style="width: 70px">
                                        <p class="mx-lg-3 text-white"
                                           style="margin-top: 20px"> ${String.format("%.0f",p.promotion.promotion)}%
                                        </p>
                                    </span>
                            </div>
                        </div>
                    </c:if>
                </a>
                <div class="card-body d-flex flex-column">
                    <p class="card-text ">${p.name}</p>
                    <p class="card-text "><small>Pin: ${p.pin} mA</small></p>
                    <p class="card-text "><small>Memory: ${p.memory}</small></p>
                    <p class="card-text "><small>Camera: ${p.camera}</small></p>
                    <div class="d-flex flex-row">
                        <h5 class="mb-1 me-1 ">$${p.unitPrice}</h5>
                        <c:if test="${p.promotion != null}">
                            <p class="card-text text-danger">
                                <span class="text-danger mx-3"><s>$${String.format("%.0f",p.price)}</s></span>
                            </p>
                        </c:if>
                    </div>
                    <div class="card-footer d-flex align-items-end ">
                        <a href="getProductById?id=${p.id}" class="btn btn-primary shadow-0 me-1 mx-4">Buy now</a>
                        <c:if test="${p.rate != null}">
                            <span class="btn btn-light border icon-hover px-2 pt-2 ">${String.format("%.1f",p.rate)} <i
                                    class="fa fa-star fa-sm text-warning"></i></span>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <nav aria-label="...">
        <ul class="pagination justify-content-md-center">
            <li class="page-item ">
                <a class="page-link" href="getProductList?page=${pageCurrent - 1}">Previous</a>
            </li>
            <c:forEach var="i" items="${pageNumber}">
                <li class="page-item"><a class="page-link" href="getProductList?page=${i}">${i+1}</a></li>
            </c:forEach>
            <li class="page-item">
                <a class="page-link" href="getProductList?page=${pageCurrent + 1}">Next</a>
            </li>
        </ul>
    </nav>

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
