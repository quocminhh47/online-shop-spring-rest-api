<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/adminsrc/css/styles.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="index.html">QLBX</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                <li><a class="dropdown-item" href="                <li><a class="dropdown-item" href="/logout">Logout</a></li>
                ">Logout</a></li>
            </ul>
        </li>
    </ul>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
<%--                <div class="nav">--%>
<%--                    <a class="nav-link" href="/admin/bill">--%>
<%--                        <div class="sb-nav-link-icon"></div>--%>
<%--                        Bill--%>
<%--                    </a>--%>
<%--                    <a class="nav-link" href="/admin/bill/approveOrder">--%>
<%--                        <div class="sb-nav-link-icon"></div>--%>
<%--                        Approve Order--%>
<%--                    </a>--%>
<%--                    <a class="nav-link" href="/admin/bill/salesStatistics">--%>
<%--                        <div class="sb-nav-link-icon"></div>--%>
<%--                        Sales Statistics--%>
<%--                    </a>--%>
<%--                </div>--%>
    <%@include file="/WEB-INF/views/include/admin/sidebar.jsp" %>

            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as: <security:authorize access="isAuthenticated()">
                    <security:authentication property="principal.username"/>
                </security:authorize></div>

            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Bills</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Admin</a></li>
                    <li class="breadcrumb-item active">Bills</li>
                </ol>
                <div class="card mb-4">
                    <div class="card-header" style="color: #9d0303;">
                        <i class="fas fa-table me-1"></i>
                        <strong>Total: <fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${priceTotal}" />
                            VND</strong>
                    </div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th></th>
                                <th>BillID</th>
                                <th>Create Date</th>
                                <th>Customer</th>
                                <th>Discount Total</th>
                                <th>Price Total</th>
                                <th>Status</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${bills}" varStatus="count" var="item">
                                <tr>
                                    <th scope="row">${count.count}</th>
                                    <td>${item.ID}</td>
                                    <td><fmt:formatDate pattern="dd/MM/yyyy" value="${item.createDate}" /></td>
                                    <td>${item.user.getFirst_name()} ${item.user.getLast_name()}</td>
                                    <td><fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${item.discountTotal}" />
                                        VND
                                            </td>
                                    <td><fmt:formatNumber type = "number" maxIntegerDigits = "15" value = "${item.priceTotal}" />
                                        VND
                                            </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${item.status == 0}">
                                                Not Approve
                                            </c:when>
                                            <c:otherwise>
                                                Approve
                                            </c:otherwise>
                                        </c:choose></td>
                                    <td>
                                        <a href="/user/bill/${item.ID}">Details</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2021</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/adminsrc/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/adminsrc/js/datatables-simple-demo.js"></script>

</body>
</html>
