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
	<link rel="stylesheet" href="../css/studentCourse.css" media="all" />
	<script type="text/javascript">
	function goHomework(bt) {
		var tourl = "goHomework/" + bt.id;
		var teachCourseId = $("#teachCourseId").val();
		$.ajax({
			url: tourl,
			type: "GET",
			data: {"teachCourseId": teachCourseId},
			success: function(data) {
				$("#subpage").html(data);
			}, 
			error: function(data) {
				alert("错误，请重试");
			}
		});
	}
	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<p>课程作业</p>
	</blockquote>
	<div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="10%">
				<col width="8%">
				<col width="12%">
				<col width="12%">
				<col width="10%">
				<col width="20%">
				<col width="15%">
		    </colgroup>
		    <thead>
				<tr>
					<th>作业名称</th>
					<th>作业介绍</th>
					<th>截止日期</th>
					<th>提交日期</th>
					<th>获得分数</th>
					<th>教师评价</th>
					<th>提交作业</th>
				</tr> 
				<c:forEach var="info" items="${homeworkInfos}" varStatus="status">
				<tr>
					<td>${info[0] }</td>
					<td>${info[1] }</td>
					<td>${info[2] }</td>
					<td>${info[3] }</td>
					<td>${info[4] }</td>
					<td>${info[7] }</td>
					<td><button id="${info[5] }" ${info[6]} onclick="goHomework(this)">提交作业</button></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
</body>
</html>