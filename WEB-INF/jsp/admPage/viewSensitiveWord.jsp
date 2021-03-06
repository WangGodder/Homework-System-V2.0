<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<script type="text/javascript">
function addWord() {
	var word = $("#sensitiveWord").val();
	$.ajax({
		url: "addSensitiveWord",
		type: "POST",
		data: {"word": word},
		success: function(data) {
			alert("操作成功");
			viewSensitiveWord();
		},
		error: function() {
			alert("错误，字符过长或身份不正确");
		}
	})
}
</script>
</head>
<body>
	<blockquote class="layui-elem-quote news_search">
		<h3>敏感词列表</h3>
	</blockquote>
	<table class="table" style="text-align:center;">
		<thead class="thead-light">
		<input id="sensitiveWord" type="text">
		<button class="btn btn-primary ml-1" onclick="addWord()">添加敏感词</button>
		</thead>
		<tbody>
			<c:forEach var="word" items="${words}" varStatus="status">
					<tr>
						<td>${word}</td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	
	
</html>