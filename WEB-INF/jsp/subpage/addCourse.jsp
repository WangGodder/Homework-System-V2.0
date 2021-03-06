<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="css/studentCourse.css" media="all" />
	<script type="text/javascript">
		function attendCourse(bt) {
			var teachCourseId = bt.id;
			$.ajax({
				url: "attendCourse",
				data: {"teachCourseId": teachCourseId},
				type: "GET",
				success: function(data) {
					if (data == "error") {
						alert("错误发生，没有权限加入该课程");
					}
					if (data == "success") {
						alert("添加成功,请前往我的课程查看");
						addCourse();
					}
				},
				error: function() {
					alert("错误发生，请重新登陆再试")
				}
			})
		}
	</script>
		<style>
				.card-body h4{
					font-size: 20px;
				}
			
				.card-body h5{
					font-size: 18px;
				}
				</style>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<p>可加入课程</p>
	</blockquote>
	<!-- <div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="14%">
				<col width="8%">
				<col width="10%">
				<col width="8%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
				<tr>
					<th>课程</th>
					<th>课程代码</th>
					<th>开课学期</th>
					<th>课程类型</th>
					<th>任课教师</th>
					<th>开课班级</th>
					<th>是否公开</th>
					<th>操作</th>
				</tr> 
				<c:forEach var="info" items="${nonAttendCourses}" varStatus="status">
				<tr>
					<td>${info[0] }</td>
					<td>${info[1] }</td>
					<td>${info[2] }</td>
					<td>${info[3] }</td>
					<td>${info[4] }</td>
					<td>${info[5] }</td>
					<td>${info[6] }</td>
					<td><button id="${info[7] }" onclick="attendCourse(this)">添加课程</button></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div> -->

	<div class="layui-form users_list" style="display: inline;">

			<c:forEach var="info" items="${nonAttendCourses}" varStatus="status">
			<div class="card" style="width: 18rem; float:left; margin:20px;">
			  <div class="card-body">
			<h4 class="card-title"><strong>${info[0] }</strong></h4>
			<h5 class="card-subtitle mb-2 text-muted">课程代码：${info[1] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">开课学期：${info[2] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">课程类型：${info[3] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">任课教师：${info[4] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">开课班级：${info[5] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">是否公开：${info[6] }</h5>
			<a href="#" id="${info[7] }"  style="font-size: 18px;" class="btn btn-outline-primary" onclick="attendCourse(this)">添加课程</a>
			  </div>
			</div>
					
			</c:forEach>
			
			</div>
	

	<div id="page"></div>
	<script type="text/javascript" src="addCourse.js"></script>
</body>
</html>