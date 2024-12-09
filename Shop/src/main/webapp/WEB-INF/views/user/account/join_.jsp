<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h2>회원가입</h2>
		<hr>
		<form action="joinOk.do" method="post">
			<table>
				<tr>
					<th align="right">아이디 : </th>
					<td><input type="text" name="user_id"></td>
				</tr>
				<tr>
					<th align="right">비밀번호 : </th>
					<td><input type="password" name="user_password"></td>
				</tr>
				<tr>
					<th align="right">이름 : </th>
					<td><input type="text" name="user_name"></td>
				</tr>
				<tr>
					<th align="right">이메일 : </th>
					<td><input type="email" name="user_email"></td>
				</tr>
				<tr>
					<th align="right">연락처 : </th>
					<td><input type="text" name="user_phone"></td>
				</tr>
			</table>
			<button>회원가입</button>
		</form>
	</body>
</html>