<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>review List</title>
</head>
<body>
	<h1>it is review time</h1>

	<table >
		<thead>
			<tr>
				<th>#숙소번호</th>
				<th>숙소 이름</th>
				<th>지역</th>
				<th>번호</th>
				<th>숙소설명</th>
			</tr>
		</thead>

		<c:forEach items="${list }" var="rev">


			<tr>
				
			
				<td><c:out value="${rev.pstNum }" /></td>
				<td><c:out value="${rev.brdCode }" /></td>
				<td><c:out value="${rev.userNum }" /></td>
				<td><c:out value="${rev.revPurl }" /></td>
				<td><c:out value="${rev.stisf }" /></td>
				<td><c:out value="${rev.acmNum }" /></td>
				<td><c:out value="${rev.bookNum }" /></td>
				<td><c:out value="${rev.content }" /></td>
				<td><c:out value="${rev.title }" /></td>
				<%-- 
				<td><c:out value="${rev.pRegDate }" /></td>
				<td><c:out value="${rev.pUpdateDate }" /></td> --%>
			</tr>
		</c:forEach>
		</table>
</body>


</html>