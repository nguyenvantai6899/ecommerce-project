<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 02/07/23
  Time: 7:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- Section: Design Block -->
<section class="text-center text-lg-center " style="width: 70% ;margin-left: 15%">
    <style>
        .cascading-right {
            margin-right: -50px;
        }

        @media (max-width: 991.98px) {
            .cascading-right {
                margin-right: 0;
            }
        }
    </style>

    <!-- Jumbotron -->
    <div class="container py-4">
        <div class="row g-0 align-items-center">
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="card cascading-right" style="
            background: hsla(0, 0%, 100%, 0.55);
            backdrop-filter: blur(30px);
            ">
                    <div class="card-body p-5 shadow-5 text-center">
                        <h2 class="fw-bold mb-5">Sign up now</h2>
                        <form action="login1" method="get">
                            <!-- 2 column grid layout with text inputs for the first and last names -->
                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <div class="form-outline">
                                        <input type="text" name="name" class="form-control" />
                                        <label class="form-label" >Full name</label>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2">
                                    <div class="form-outline">
                                        <input type="date" name="birthday" value="2023-01-01" class="form-control" />
                                        <label class="form-label">Birthday</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-outline mb-2">
                                <input type="text" name="address" class="form-control" />
                                <label class="form-label" >Address</label>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-2">
                                    <div class="form-outline">
                                        <input type="email" id="form3Example1" name="email" class="form-control" />
                                        <label class="form-label" for="form3Example1">Email</label>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-2">
                                    <div class="form-outline">
                                        <input type="text" id="form3Example2" name="phone" class="form-control" />
                                        <label class="form-label" for="form3Example2">Phone number</label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-outline mb-3">
                                <input type="text" id="form3Example3" name="username" class="form-control" />
                                <label class="form-label" for="form3Example3">User name</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-3">
                                <input type="password" id="form3Example4" name="password" class="form-control" />
                                <label class="form-label" for="form3Example4">Password</label>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary btn-block mb-4">
                                Sign up
                            </button>
                            <!-- Register buttons -->
                        </form>
                        <div class="form-outline mb-3 text-lg-start text-warning">
                            <p>${check}</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-6 mb-5 mb-lg-0">
                <img src="https://mdbootstrap.com/img/new/ecommerce/vertical/004.jpg" class="w-100 rounded-4 shadow-4"
                     alt="" />
            </div>
        </div>
    </div>
    <!-- Jumbotron -->
</section>
<!-- Section: Design Block -->
</body>
</html>
