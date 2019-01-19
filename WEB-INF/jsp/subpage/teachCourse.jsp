<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<style>
				#info p {
					font-size: 20px;
				}
			</style>
		</head>

		<body>

			<body>
				<blockquote class="layui-elem-quote news_search">
					<p>任课</p>
				</blockquote>
				<!-- <div style="float:left; width:25%; margin-right:50px; text-align: center;">
		<h2>课程选择</h2>
		<select name="courseSelect" id="courseSelect" style="display:inline; font-size:20px;">
		<c:forEach var="course" items="${courses}">
			<option value="${course.getId()}">${course.getName()}</option>
		</c:forEach>
		</select>
		<c:forEach var="course" items="${courses}">
				<input type="hidden" id="courseInfo_${course.getId()}" value="${course.getInfo()}">
				<input type="hidden" id="courseType_${course.getId()}" value="${course.printType()}">
		</c:forEach>
		<div style="font-size:25px; text-align: left;">
		<p>课程代码：<span id="courseId">${courses[0].getId()}</span></p>
		<p>课程信息：<span id="courseInfo">${courses[0].getInfo()}</span></p>
		<p>课程信息：<span id="courseType">${courses[0].printType()}</span></p>
		</div>
	</div>
	<div style="float:left; width:25%; margin-right:50px; text-align: center;">
		<h2>班级选择</h2>
		<select name="gradeSelect" id="gradeSelect" style="display:inline; font-size:20px;">
			<c:forEach var="grade" items="${grades}">
				<option value="${grade.getId()}">${grade.getName()}</option>
			</c:forEach>
		</select>
		<c:forEach var="grade" items="${grades}">
				<input type="hidden" id="gradeInfo_${course.getId()}" value="${grade.getInfo()}">
		</c:forEach>
		<div style="font-size:25px; text-align: left;">
		<p>班级代码：<span id="gradeId">${grades[0].getId() }</span></p>
		<p>班级信息：<span id="gradeInfo">${grades[0].getInfo() }</span></p>
		</div>
	</div>
	<div style="float:left; width:15%; margin-right:50px; text-align: center;">
		<h2>开课时间</h2>
		<input id="date" type="date">
	</div>
	<div style="float:left; width:20%; text-align: center;">
		<h2>是否公开</h2>
		<p>（表示是否允许所有学生可加入该课程）</p>
		<select id="public" name="public" style="display:inline; font-size:20px;">
			<option value="False">不公开</option>
			<option value="True">公开</option>
		</select>
	</div>
	<div style="float:left; width:5%; margin-top:50px; font-weight:bold; font-size:30px;">
		<a href="javascript:teachNewCourse()">任课</a>
	</div> -->

				<div class="container h-100">
					<div style="margin-top: 10%;">
						<div class="row">
							<div class="w-100 d-flex justify-content-center">
								<p style="font-size: 22px;">选择课程：</p>
								<select class="form-control col-2" name="courseSelect" id="courseSelect" style="display:inline; font-size:20px;">
									<c:forEach var="course" items="${courses}">
										<option value="${course.getId()}">${course.getName()}</option>
									</c:forEach>
								</select>
								<c:forEach var="course" items="${courses}">
									<input type="hidden" id="courseInfo_${course.getId()}" value="${course.getInfo()}">
									<input type="hidden" id="courseType_${course.getId()}" value="${course.printType()}">
								</c:forEach>
							</div>
						</div>



						<div class="row">
							<div class="w-100 d-flex justify-content-center">
								<p style="font-size: 22px;">班级选择：</p>
								<select class="form-control col-2" name="gradeSelect" id="gradeSelect" style="display:inline; font-size:20px;">
									<c:forEach var="grade" items="${grades}">
										<option value="${grade.getId()}">${grade.getName()}</option>
									</c:forEach>
								</select>
								<c:forEach var="grade" items="${grades}">
									<input type="hidden" id="gradeInfo_${course.getId()}" value="${grade.getInfo()}">
								</c:forEach>

							</div>

						</div>

						<div class="row">
							<div class="w-100 d-flex justify-content-center">
								<p style="font-size: 22px;">开课时间：</p>
								<input class="form-control col-2" id="date" type="date">

							</div>

						</div>

						<div class="row">
							<div class="w-100 d-flex justify-content-center">
								<p style="font-size: 22px;">是否公开：</p>
								<select class="form-control col-2" id="public" name="public" style="display:inline; font-size:20px;">
									<option value="False">不公开</option>
									<option value="True">公开</option>
								</select>
							</div>

						</div>
					</div>
					<hr>
					<div id="info" class="container-fluid col-3" style="display: block">
						<div class="row">
							<p class=" p-2">课程代码：
								<span id="courseId">${courses[0].getId()}</span>
							</p>
						</div>
						<div class="row">
							<p class=" p-2">课程信息：
								<span id="courseInfo">${courses[0].getInfo()}</span>
							</p>
						</div>

						<div class="row">
							<p class=" p-2">课程信息：
								<span id="courseType">${courses[0].printType()}</span>
							</p>
						</div>

						<div class="row">
							<p class=" p-2">班级代码：
								<span id="gradeId">${grades[0].getId() }</span>
							</p>
						</div>


						<div class="row">
							<p class=" p-2">班级信息：
								<span id="gradeInfo">${grades[0].getInfo() }</span>
							</p>
						</div>



					</div>
					<div class="d-flex justify-content-center">
						<a class=" btn btn-primary btn-large" href="javascript:teachNewCourse()">&nbsp;&nbsp;&nbsp;任课&nbsp;&nbsp;&nbsp;</a>
					</div>
				</div>

			</body>
			<script type="text/javascript" src="js/teachCourse.js"></script>

		</html>