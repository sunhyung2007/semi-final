<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.2/dist/sandstone/bootstrap.min.css">
<title>인증</title>
</head>
<body>


<div>
<h1>내 정보 수정</h1>

<form action="checkpwd" method = "post">
	<div class="form-floating" style = "display: flex">
    <input type="password" class="form-control" name = "mPwd" id = "mPwd" style = "width:300px" id="floatingPassword" placeholder="Password">
    &nbsp; &nbsp;&nbsp;<input type = "submit" class="btn btn-primary" value = "확인">
    <label for="floatingPassword" style = "">Password</label>
  </div>
</form>

</div>
</body>
</html>