<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<c:forEach var="course" items="${courses}">
		<input class="courseNames" type="hidden" value="${course.getName() }">
	</c:forEach>

	<blockquote class="layui-elem-quote news_search">
		<p>创建课程</p>
	</blockquote>
	<!-- <div style="width: 20%; float:left; margin-right: 50px; text-align: center;">
		<h2>课程名称</h2>
		<input type="text" name="courseName" id="courseName" style="font-size:25px;"/>	
	</div>
	<div style="width: 30%; float:left; margin-right: 50px; text-align: center;">
		<h2>课程信息</h2>
		<textarea name="courseInfo" id="courseInfo" cols="25" rows="4" style="font-size:25px;"></textarea>
	</div>
	<div style="width: 10%; float:left; margin-right: 50px; text-align: center;">
		<h2>课程类型</h2>
		<select name="type" id="courseType" style="display:inline; font-size:25px;">
			<option value="1">通识选必课</option>
			<option value="2">通识选修课</option>
			<option value="3">专业必修课</option>
			<option value="4">专业修选课</option>
		</select>
	</div>
	<div style="float:left; width:15%; margin-top:50px; font-weight:bold; font-size:30px;">
		<a href="javascript:createCourse()">创建课程</a>
	</div> -->


<div class="container">
	<form>
		<div class="form-group">
		  <label for="courseName">课程名称</label>
		  <input type="text" class="form-control" style="display:inline;" id="courseName"  name="courseName" />
	
		
		</div>
		<div class="form-group">
		  <label for="courseType">课程类型</label>
			<div class="form-group">
			  <select class="form-control" name="type" id="courseType" style="display:inline; ">
				<option value="1">通识选必课</option>
				<option value="2">通识选修课</option>
				<option value="3">专业必修课</option>
				<option value="4">专业修选课</option>
			</select>
			</div>
		</div>
		<div class="form-group">
		  <label for="courseInfo" >课程信息</label>
		  <textarea class="form-control" id="courseInfo"  name="courseInfo" rows="3"></textarea>
		</div>
		<div class="d-flex justify-content-center">
			<a class="btn btn-primary btn-large" href="javascript:createCourse()">创建课程</a>
		</div>
	</form>
	</div>
</body>
<script type="text/javascript" src="js/createCourse.js"></script>
</html>