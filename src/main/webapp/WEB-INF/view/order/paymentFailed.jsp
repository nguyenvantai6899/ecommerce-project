<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03/08/23
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

<body>
<section class="bg-danger-subtle">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-8 col-xl-6">
                <div class="card border-top border-bottom border-3" style="border-color: red !important;">
                    <div class="card-body p-5">

                        <p class="lead fw-bold mb-5 text-danger">Purchase Failed</p>

                        <div class="row">
                            <div class="col mb-3">
                                <p class="small text-muted mb-1">Date</p>
                                <p>${totalPriceOrder.date}</p>
                            </div>
                            <div class="col mb-3">
                                <p class="small text-muted mb-1">Order No.</p>
                                <p>${totalPriceOrder.id}</p>
                            </div>
                        </div>

                        <div class="mx-n5 px-5 py-4" style="background-color: #f2f2f2;">
                            <c:forEach var="o" items="${orderDetail}">
                                <div class="row">
                                    <div class="col-md-8 col-lg-9">
                                        <p>${o.productName}</p>
                                    </div>
                                    <div class="col-md-4 col-lg-3">
                                        <p>$ ${o.unitPrice}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <p class="lead fw-bold mb-4 pb-2 text-danger">Total</p>
                        <div class="row my-4">
                            <div class="col-md-4 offset-md-8 col-lg-3 offset-lg-9">
                                <p class="lead fw-bold mb-0 text-danger" >$ ${totalPriceOrder.totalPrice}</p>
                            </div>
                        </div>
                        <div class="row my-4 text-xl-center">
                            <div class="col"><a class="btn btn-outline-danger" href="userOrderHistory">Pay again <i class="fa fa-chevron-right" aria-hidden="true"></i></a></div>
                        </div>

                        <p class="mt-4 pt-2 mb-0">Want any help? <a href="#!" style="color: #f37a27;">Please contact
                            us</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>

