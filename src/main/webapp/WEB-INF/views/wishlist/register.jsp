<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	session.setAttribute("loginUserNum", "U1");
String name = (String) session.getAttribute("loginUserNum");
%>

<%@include file="../includes/header.jsp"%>



<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Register</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">


			<!-- /.panel-heading -->
			<div class="panel-body">

				<form role="form" action="/wishlist/register" method="post">

					

					<div class="form-group">
						<label>userNum</label> <input class="form-control" name='userNum'>
					</div>

					<div class="form-group">
						<label>acmNum</label> <input class="form-control" name='acmNum'>
					</div>

					<div class="form-group">
						<label>listTitle</label> <input class="form-control" name='listTitle'>
					</div>

					<div class="form-group">
						<label>listContent</label> <input class="form-control" name='listContent'>
					</div>




					<button type="submit" class="btn btn-default">Submit
						Button</button>
					<button type="reset" class="btn btn-default">Reset Button</button>
				</form>

			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>