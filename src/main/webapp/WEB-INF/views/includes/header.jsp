<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
	<title>Alcoholic</title>
    <!-- plugin css, js, etc...-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/main/fullcalendar-5.11.4/lib/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/images/favicon.png" />
    <script src="${pageContext.request.contextPath}/resources/vendors/base/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/chart.js/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendors/progressbar.js/progressbar.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/chartjs-plugin-datalabels/chartjs-plugin-datalabels.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/justgage/raphael-2.1.4.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendors/justgage/justgage.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.cookie.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/dashboard.js"></script>
    <!-- plugin css, js, etc...-->
    
    <div class="horizontal-menu">
      <nav class="navbar top-navbar col-lg-12 col-12 p-0">
        <div class="container-fluid">
          <div class="navbar-menu-wrapper d-flex align-items-center justify-content-between">
            <ul class="navbar-nav navbar-nav-left">
              <li class="nav-item nav-search d-none d-lg-block ms-3">
                <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text" id="search">
                        
                      </span>
                    </div>
                    <input type="text" class="form-control" aria-label="search" aria-describedby="search">
                </div>
              </li>	
            </ul>
            <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                <a class="navbar-brand brand-logo" href="/main"><img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo" style="width: 400px; height: auto;"/></a>
                <a class="navbar-brand brand-logo-mini" href="/main">
    			<img src="${pageContext.request.contextPath}/resources/images/logo-mini.png" alt="logo"/>
				</a>
            </div>
            <ul class="navbar-nav navbar-nav-right">
                <li class="nav-item dropdown d-lg-flex d-none">
                  
                  <a class="btn btn-outline-danger btn-fw" id="nreportDropdown" href="/main/logout">
                  	로그아웃
                  </a>
                </li>
                <li class="nav-item nav-profile dropdown">
                  <a class="nav-link dropdown-toggle" href="" data-bs-toggle="dropdown" id="profileDropdown">
                    <span class="nav-profile-name">	${sessionScope.emp_department}팀  ${sessionScope.emp_name}님</span>
                    <span class="online-status"></span>
                    <img src="${pageContext.request.contextPath}/resources/images/faces/face28.png" alt="profile"/>
                  </a>
                  <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="nreportDropdown">
                      <p class="mb-0 font-weight-medium float-left dropdown-header">${sessionScope.emp_name}님 환영합니다</p>
                      <a class="dropdown-item">
                        <i class="mdi mdi-account text-primary"></i>
                         	접속 ID : ${sessionScope.emp_id}
                      </a>
                      <a class="dropdown-item">
                        <i class="mdi mdi-account-card-details text-primary"></i>
                         	부서 : ${sessionScope.emp_department}팀
                      </a>
                       <a href="/main/logout" class="dropdown-item">
                        <i class="mdi mdi-logout text-primary"></i>
                        	로그아웃
                      </a>
                  </div>
                </li>
            </ul>

          </div>
        </div>
      </nav>
      <nav class="bottom-navbar">
        <div class="container">
            <ul class="nav page-navigation">
              <li class="nav-item">
                <a class="nav-link" href="" >
                  <i class="mdi mdi-account menu-icon" style="font-size: 30px; "></i>
                  <span class="menu-title">사원 관리</span>
                </a>
                <div class="submenu">
                      <ul class="submenu-item">
                      	  <li class="nav-item"><a class="nav-link" href="">사원 조회</a></li>
                          <li class="nav-item"><a class="nav-link" href="">사원 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">사원 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="">사원 삭제</a></li>
                      </ul>
                  </div>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="">
                    <i class="mdi mdi-finance menu-icon" style="font-size: 30px;"></i>
                  <span class="menu-title">영업 관리</span>
                </a>
                <div class="submenu">
                      <ul class="submenu-item">
                          <li class="nav-item"><a class="nav-link" href="/contract/list">수주 목록</a></li>
<!--                           <li class="nav-item"><a class="nav-link" href="">수주 등록</a></li> -->
<!--                           <li class="nav-item"><a class="nav-link" href="">수주 조회</a></li> -->
<!--                           <li class="nav-item"><a class="nav-link" href="">수주 수정</a></li> -->
<!--                           <li class="nav-item"><a class="nav-link" href="">수주 삭제</a></li> -->
                          <li class="nav-item"><a class="nav-link" href="/customer/list">거래처 목록</a></li>
<!--                           <li class="nav-item"><a class="nav-link" href="">거래처 등록</a></li> -->
<!--                           <li class="nav-item"><a class="nav-link" href="">거래처 조회</a></li> -->
<!--                           <li class="nav-item"><a class="nav-link" href="">거래처 수정</a></li> -->
<!--                           <li class="nav-item"><a class="nav-link" href="">QR코드 생성</a></li> -->
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="" class="nav-link">
                    <i class="mdi mdi-chart-areaspline menu-icon" style="font-size: 30px;"></i>
                    <span class="menu-title">구매 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                      <ul>
                         <li class="nav-item"><a class="nav-link" href="">자재 등록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 수정</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 삭제</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 저장</a></li>
                         <li class="nav-item"><a class="nav-link" href="">자재 검색</a></li>
                         <li class="nav-item"><a class="nav-link" href="">재고 검색</a></li>
                         <li class="nav-item"><a class="nav-link" href="">현 재고량</a></li>
                         <li class="nav-item"><a class="nav-link" href="">발주 현황</a></li>
                         <li class="nav-item"><a class="nav-link" href="">발주 등록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">입고 목록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">미입고</a></li>
                         <li class="nav-item"><a class="nav-link" href="">입고 완료</a></li>
                         <li class="nav-item"><a class="nav-link" href="">출고 목록</a></li>
                         <li class="nav-item"><a class="nav-link" href="">출고 조회</a></li>
                         <li class="nav-item"><a class="nav-link" href="">출고 처리</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="" class="nav-link">
                    <i class="mdi mdi-package-variant-closed menu-icon" style="font-size: 30px;"></i>
                    <span class="menu-title">생산 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                    <ul>
                          <li class="nav-item"><a class="nav-link" href="">작업 지시 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">작업 지시 상세</a></li>
                          <li class="nav-item"><a class="nav-link" href="">작업 지시 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">생산 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">생산 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">품질 관리 목록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">검수 등록</a></li>
                      </ul>
                  </div>
              </li>
              <li class="nav-item">
                  <a href="" class="nav-link">
                    <i class="mdi mdi-grid menu-icon" style="font-size: 30px;"></i>
                    <span class="menu-title">창고 관리</span>
                    <i class="menu-arrow"></i>
                  </a>
                  <div class="submenu">
                   	<ul>
                          <li class="nav-item"><a class="nav-link" href="">창고 관리</a></li>
                          <li class="nav-item"><a class="nav-link" href="">창고 등록</a></li>
                          <li class="nav-item"><a class="nav-link" href="">창고 수정</a></li>
                          <li class="nav-item"><a class="nav-link" href="">창고 삭제</a></li>
                    </ul>
                  </div>
              </li>
            </ul>
        </div>
      </nav>
    </div>