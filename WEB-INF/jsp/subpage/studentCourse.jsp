<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>我的课程</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="css/studentCourse.css" media="all" />
	<script type="text/javascript" src="studentCourse.js"></script>
	<style>
		.card-body h4 {
			font-size: 20px;
		}

		.card-body h5 {
			font-size: 18px;
		}
	</style>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<p>我的课程</p>
	</blockquote>
	<!-- <div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="18%">
				<col width="8%">
				<col width="12%">
				<col width="12%">
				<col width="18%">
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr>
					<th>课程</th>
					<th>课程代码</th>
					<th>开课学期</th>
					<th>任课教师</th>
					<th>所得分数</th>
					<th>操作</th>
				</tr> 
				<c:forEach var="info" items="${studentCourses}" varStatus="status">
				<tr>
					<td>${info[0] }</td>
					<td>${info[1] }</td>
					<td>${info[2] }</td>
					<td>${info[3] }</td>
					<td>${info[4] }</td>
					<td><a href="student_teachCourse/${info[5]}" target="_blank">进入课程</a></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div> -->

	<div class="layui-form users_list" style="display: inline;">

			<c:forEach var="info" items="${studentCourses}" varStatus="status">
			<div class="card" style="width: 18rem; float:left; margin:20px;">
			  <div class="card-body">
			<h4 class="card-title"><strong>${info[0] }</strong></h4>
			<h5 class="card-subtitle mb-2 text-muted">课程代码：${info[1] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">开课学期：${info[2] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">任课教师：${info[3] }</h5>
			<h5 class="card-subtitle mb-2 text-muted">所得分数：${info[4] }</h5>
			<a href="student_teachCourse/${info[5]}" style="font-size: 18px;" class="btn btn-outline-primary" target="_blank">进入课程</a>
			  </div>
			</div>
					
			</c:forEach>
			
			</div>
	
	<div id="page"></div>
</body>
</html>