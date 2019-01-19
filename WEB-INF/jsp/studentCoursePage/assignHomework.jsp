<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">	
	<script type="text/javascript">
		function assignHomework() {
			 var formData = new FormData($( "#assignHomeworkForm" )[0]);  
		     $.ajax({  
		          url: 'assignHomework/${homework.getId()}' ,  
		          type: 'POST',  
		          data: formData,  
		          cache: false,  
		          contentType: false,  
		          processData: false,  
		          success: function (returndata) {  
		              if(returndata == "empty") {
		            	  alert("上传文件为空");
		            	  return;
		              } 
		              if(returndata == "success") {
		            	  alert("上传成功");
		            	  homework();
		            	  return;
		              }
		              alert("格式错误,要求格式：" + returndata);
		          },  
		          error: function (returndata) {  
		              alert(returndata);  
		          }  
		     });  
		}
	</script>
</head>
<body>
	<h2>文件上传</h2>
	<h3>${homework.getName()}</h3>
	<h3>要求格式：${homework.getFormat()}</h3>
    <form id="assignHomeworkForm">
        <table>
            <tr>
                <td>请选择文件:</td>
                <td><input type="file" name="file"></td>
               	<input id="submitTeachCourseId" type="hidden" name="teachCourseId">
            </tr>
            <tr>
                <td><input id="submitbt" type="button" value="上传" onclick="assignHomework()"/></td>
            </tr>
        </table>
    </form>

</body>
<script type="text/javascript">
$("#submitTeachCourseId").val($("#teachCourseId").val());
</script>
</html>