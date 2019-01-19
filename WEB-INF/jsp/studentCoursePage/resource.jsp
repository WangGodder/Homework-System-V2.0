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
	function download(bt) {
		var fileName = bt.id;
		var teachCourseId = $("#teachCourseId").val;
		var data = {"fileName": fileName};
		alert(teachCourseId);
		$.ajax({
			url: "resource_download/" + teachCourseId,
			data: data,
			type: "GET",
		});
		}
	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<p>课程资源</p>
	</blockquote>
	<div class="layui-form users_list">
	  	<table class="layui-table">
		    <colgroup>
				<col width="25%">
				<col width="30%">
				<col width="30%">
				<col width="10%">

		    </colgroup>
		    <thead>
				<tr>
					<th>资源名称</th>
					<th>上传日期</th>
					<th>文件大小</th>
					<th>操作</th>
				</tr> 
				<c:forEach var="file" items="${resourceNames}" varStatus="status">
				<tr>
				<td>${file[0] }</td>
					<td>${file[1] }</td>
					<td>${file[2] }</td>
					<td><a href="resource_download/${teachCourseId }?fileName=${file[0]}" >下载资源</a></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
	</div>
	<div id="page"></div>
</body>

</html>