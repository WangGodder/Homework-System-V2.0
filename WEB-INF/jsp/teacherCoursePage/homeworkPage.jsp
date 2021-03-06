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
	<script type="text/javascript" src="../js/teacher_homeworkPage.js">	</script>
</head>
<body class="childrenBody">
	<blockquote class="layui-elem-quote news_search">
		<h2>
		课程作业
		<a class="btn btn-primary text-white"  style="float:right;"  data-toggle="modal" data-target="#box">生成课程作业分数</a>
		<!--  <button style="float:right;" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  		生成课程作业分数
		</button>		
		-->
		</h2>
	</blockquote>
	<div class="layui-form users_list">
	  	<table class="layui-table" >
		    <colgroup>
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
				<tr>
					<th>作业名称</th>
					<th>作业介绍</th>
					<th>截止日期</th>
					<th>查看作业</th>
					<th>编辑作业</th>
					<th>删除作业</th>
				</tr> 
				<c:forEach var="homework" items="${homeworks}" varStatus="status">
				<tr>
					<input class="homeworkIds" type="hidden" value="${homework.getId() }">
					<td><input id="name_${homework.getId() }" type="text" value="${homework.getName() }"></td>
					<td><input id="info_${homework.getId() }" type="text" value="${homework.getInfo() }"></td>
					<td><input id="deadline_${homework.getId() }" type="date" value="${homework.getDeadline() }"></td>
					<td><button class="btn btn-outline-success" id="view_${homework.getId()}" onclick="goHomework(this)">查看作业</button></td>
					<td><button class="btn btn-outline-info" id="editor_${homework.getId()}" onclick="editorHomework(this)">编辑作业</button></td>										
					<td><button class="btn btn-danger" id="delete_${homework.getId()}" onclick="deleteHomework(this)">删除作业</button></td>
				</tr>
				</c:forEach>
		    </thead>
		    <tbody class="users_content"></tbody>
		</table>
		<table class="layui-table" style="margin-top:30px; border-top: 1px solid black;">
			<colgroup>
				<col width="10%">
				<col width="20%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="10%">
		    </colgroup>
		    <thead>
			<tr>
				<td><input id="name_new" type="text" ></td>
				<td><input id="info_new" type="text" ></td>
				<td><input id="deadline_new" type="date" ></td>
				<td><p>作业格式<input style="width:100px;" id="format_new" type="text" placeholder="doc, docx等" title="无要求则为空"></p></td>
				<td><button class="btn btn-outline-primary" id="addHomework" onclick="addHomework()">添加作业</button></td>
				<td> </td>
			</tr>
			</thead>
		</table>
	</div>

<!-- Modal -->
<div class="modal fade" id="box" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">生成课程作业分数</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
				<h2>作业占比确定</h2>
				<table style="display:inline">				
				<col width="30%">
				<col width="20%">
				<c:forEach var="homework" items="${homeworks}">
				<tr>
					<td>${homework.getName()}<td>
					<td><input type="number" id="proportion_${homework.getId()}" value="${homework.getProportion()}" >%</td>
				</tr>
				</c:forEach>
				</table>
      </div>
      <div class="modal-footer">
        <a class="btn btn-secondary" data-dismiss="modal">关闭</a>
        <a href="javascript:homeworkScore();" class="btn btn-primary">生成分数</a>
      </div>
    </div>
  </div>
</div>

</body>
</html>