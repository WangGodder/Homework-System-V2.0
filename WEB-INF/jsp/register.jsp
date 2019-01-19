﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>作业提交系统V2.0</title>
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="" />
			<!-- Custom Theme files -->
			<!-- <link href="css/register.css" rel="stylesheet" type="text/css" media="all" /> -->
			<link rel="stylesheet" href="css/bootstrap.css">
			<!-- //Custom Theme files -->
			<script type="text/javascript" src="js/jquery-3-3-1-min.js"></script>
			<script src="js/register.js"></script>

			<style>
				html,
				body {
					height: 100%;
				}

				body {
					text-align: center;
					display: -ms-flexbox;
					display: flex;
					-ms-flex-align: center;
					align-items: center;
					padding-top: 40px;
					padding-bottom: 40px;
					background-color: #f5f5f5;
				}

				.form-signin {
					width: 100%;
					max-width: 330px;
					padding: 15px;
					margin: auto;
				}

				.form-signin .checkbox {
					font-weight: 400;
				}

				.form-signin .form-control {
					position: relative;
					box-sizing: border-box;
					height: auto;
					font-size: 16px;
				}

				.form-signin .form-control:focus {
					z-index: 2;
				}

				.form-signin input[type="stuNumber"] {
					margin-bottom: -1px;
					border-bottom-right-radius: 0;
					border-bottom-left-radius: 0;
				}

				.form-signin input[type="name"] {
					margin-bottom: -1px;
					border-top-left-radius: 0;
					border-top-right-radius: 0;
				}

				.form-signin input[type="phone"] {
					margin-bottom: -1px;
					border-top-left-radius: 0;
					border-top-right-radius: 0;
				}
				.form-signin input[type="password"] {
					margin-bottom: -1px;
					border-top-left-radius: 0;
					border-top-right-radius: 0;
				}
				.form-signin input[type="password2"] {
					margin-bottom: 10px;
					border-top-left-radius: 0;
					border-top-right-radius: 0;
				}
			</style>
		</head>

		<body>
			<!-- main -->
			<!-- <div class="main-agilerow" style="margin-top: 10%">
			<div class="signup-w3left wthree">
				<img src="images/img1.png" alt=""/>
				<h6>Let's study together</h6> 
				<h2>作业提交系统<br><span class="agileinfo">注册</span> </h2>  
			</div>	
			<div class="">
				<form > 
					<input id="id" class="form-control" type="text" name="学号" placeholder="学号/教工号" required=""> 
					<input id="name" type="text" class="w3-agilename2" name="姓名" placeholder="姓名" required=""/> 
					<input id="tel" type="text" class="w3-agilename3" name="Number" placeholder="手机号" required="">
					<input id="ps1" type="password" class="w3-agilename5" name="password" placeholder="密码" required="">	
					<input id="ps2" type="password" class="w3-agilename6" name="confirm password" placeholder="确认密码" required="">
					<select id="grade" name="grade">
						<c:forEach var="grade" items="${grades }">
							<option value="${grade.getId() }">${grade.getName() }</option>
						</c:forEach>
					</select>
					<a href="javascript:registerStudent();">注册</a> 
				</form> 
			</div>	
			<div class="clear"> </div>
		</div>	
	</div>	 -->
			<form class="form-signin">
				<img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
				<h1 class="h3 mb-3 font-weight-normal">账号注册：</h1>
				<input type="stuNumber" id="id"  name="学号" class="form-control" placeholder="学号" required autofocus>
				<input type="name" id="name" name="姓名" class="form-control" placeholder="姓名" required>
				<input type="phone" id="tel"  name="Number" class="form-control" placeholder="手机号" required>
				<input type="password" id="ps1" name="password" class="form-control" placeholder="密码" required>
				<input type="password" id="ps2" name="confirm password" class="form-control" placeholder="确认密码" required>
				
				<select class="form-control" id="grade" name="grade">
					<c:forEach var="grade" items="${grades }">
						<option value="${grade.getId() }">${grade.getName() }</option>
					</c:forEach>
				</select>
				<br>
		
				<a class="btn btn-lg btn-primary btn-block" href="javascript:registerStudent();">注册 </a>
				<p class="mt-5 mb-3 text-muted">&copy; 2018</p>
			</form>

		</body>

		</html>