<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Booking Form HTML Template</title>

<link href="https://fonts.googleapis.com/css?family=Alegreya:700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:400"
	rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="../resources/css/bootstrap.min.css" />

	<link type="text/css" rel="stylesheet" href="../resources/css/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Tables</h1>
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">숙소 상세 페이지</div>

				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>이름</th>
								<th>인원</th>
								<th>타입</th>
								<th>갯수</th>
								<th>크기</th>
								<th>가격</th>
								<th>사진</th>
								<th>위치</th>
							</tr>
						</thead>

						<c:forEach items="${list }" var="rom">
							<tr>
								<td><c:out value="${rom.roomName}" /></td>
								<td><c:out value="${rom.capacity}" /></td>
								<td><c:out value="${rom.bedType}" /></td>
								<td><c:out value="${rom.bedCnt}" /></td>
								<td><c:out value="${rom.romSize}" /></td>
								<td><c:out value="${rom.price}" /></td>
								<td><c:out value="${rom.romPurl}" /></td>
								<td><c:out value="${rom.romLocaInfo}" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	</div>