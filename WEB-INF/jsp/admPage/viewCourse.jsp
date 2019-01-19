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
			<blockquote class="layui-elem-quote news_search">
				<h3>课程列表</h3>
			</blockquote>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="20%">
					<col width="10%">
					<col width="10%">
				</colgroup>
				<thead class="thead-light">
					<tr>
						<th>课程编号</th>
						<th>课程名称</th>
						<th>课程类型</th>
						<th>课程信息</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="course" items="${courses}" varStatus="status">
						<tr>
							<td>${course.getId()}"</td>
							<td>
								<input id="name_${course.getId()}" value="${course.getName() }">
							</td>
							<td>
								<select name="type" id="courseType" style="display:inline; value=" ${course.getType()} "">
									<option value="1">通识选必课</option>
									<option value="2">通识选修课</option>
									<option value="3">专业必修课</option>
									<option value="4">专业修选课</option>
								</select>
							</td>
							<td>
								<input id="" value="${course.getInfo() }">
							</td>
							<td>
								<button class="btn btn-info" id="bt_editor_${course.getId()}">编辑</button>
							</td>
							<td>
								<button class="btn btn-danger" id="bt_delete_${course.getId() }">删除</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


			<script type="text/javascript" src="js/createCourse.js"></script>

		</html>