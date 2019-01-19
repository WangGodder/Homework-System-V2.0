function login_student() {
	var id = $("#stu_username_hide").val();
	var ps = $("#stu_password_hide").val();
	var data = {"id": id, "password":ps};

	$.ajax({
		url: "login_student",
		type: "POST",
		data: data,
		async: false,
		success: function(data) {
			if (data == "wrong") {
				alert("学号或密码错误");
				$("#stu_password_hide").val = "";
			}	
			if (data == "success") {
				window.location.href = "main_student";
			}
		},
		error: function(){
			alert("error");
		}
	});
}

function login_teacher() {
	var id = $("#tea_username_hide").val();
	var ps = $("#tea_password_hide").val();
	var data = {"id": id, "password":ps};

	$.ajax({
		url: "login_teacher",
		type: "POST",
		data: data,
		async: false,
		success: function(data) {
			if (data == "wrong") {
				alert("教职工号或密码错误");
				$("#tea_password_hide").val = "";
			}	
			if (data == "success") {
				window.location.href = "main_teacher";
			}
		},
		error: function(){
			alert("error");
		}
	});
}
