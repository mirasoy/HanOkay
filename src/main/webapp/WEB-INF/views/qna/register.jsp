<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp" %>

<div class="container">
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
                        <div class="panel-heading">
                            Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                        <form role="form" action="/qna/register" method ="post">
                        	<div class="form-group">
                        		<label>Title</label> <input class="form-control" name='title'>
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>Text area</label> 
                        		<textarea class="form-control" rows="3" name='content'></textarea>
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>Writer</label> <input class="form-control" name='userName' value='<%=userLastName %> <%=userFstName %>' readonly="readonly">
                        	</div>
                        	
                        	<input class="form-control" type="hidden" name='writer' value='<%=userNum%>'>
                        	
                        	<button type="submit" class="btn btn-default">Submit Button</button>
                        	<button type="reset" class="btn btn-default">Reset Button</button>
                        </form>
                        
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            </div>
            <!-- /.row -->
<%@include file="../includes/footer.jsp" %>
       