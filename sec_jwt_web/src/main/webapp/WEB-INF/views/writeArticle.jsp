<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Write Article</h1>
<form name="frm" id="myForm">
	<input type="text" name="title" placeholder="Input title....."><br>
	<input type="text" name="content" placeholder="Input content....."><br>
	<input type="text" name="writer" placeholder="Input writer....."><br>
	<input type="file" name="file">
	<input type="button" value="기사등록" onclick="regArticle()"><br>
</form>
<hr>
<div id="demo"></div>

<hr>

<script>
var writer = localStorage.getItem('writer');
document.querySelector('input[name="writer"]').value = writer;

function regArticle() {
	const form = document.forms['frm'];
	var formData = new FormData(form);
	var params = new URLSearchParams();

    for (var pair of formData.entries()) {
        params.append(pair[0], pair[1]);
    }
	
    var serializedData = params.toString();
    console.log(serializedData);
	
	const token = localStorage.getItem("jwtToken");
	
	const xhttp = new XMLHttpRequest();
	xhttp.onload = function() {
		const result = this.responseText;
		console.log("result : " + result);
		document.getElementById("demo").innerHTML = result;
		document.getElementById('myForm').reset();
		
	}
	xhttp.open("POST", "http://localhost:8888/reporter/article");
	//xhttp.setRequestHeader("Content-type", "multipart/form-data");
	xhttp.setRequestHeader("Authorization", "Bearer " + token);
	xhttp.send(formData);
}

</script>
</body>
</html>