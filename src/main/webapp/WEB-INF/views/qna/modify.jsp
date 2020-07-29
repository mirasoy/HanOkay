<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../includes/qnaheader.jsp" %>

<div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Board Modify</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Board Modify Page
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        
                         <form role="form" action="/qna/modify" method ="post">
                        	<div class="form-group">
                        		<label>Bno</label> <input class="form-control" name='bno' value='<c:out value="${qna.bno}"/>' readonly="readonly">
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>Title</label> <input class="form-control" name='title' value='<c:out value="${qna.title}"/>' >
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>Text area</label> 
                        		<textarea class="form-control" rows="3" name='content'><c:out value="${qna.content}"/></textarea>
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>Writer</label> <input class="form-control" name='writer' value='<c:out value="${qna.writer}"/>' readonly="readonly">
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>RegDate</label> <input class="form-control" name='regDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${qna.regdate}"/>' readonly="readonly">
                        	</div>
                        	
                        	<div class="form-group">
                        		<label>Update Date</label> <input class="form-control" name='updateDate' value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${qna.updateDate}"/>' readonly="readonly">
                        	</div>
                        	<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
                        	<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
                        	
                        	<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
                        	<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
                        	<button type="submit" data-oper='list' class="btn btn-info">List</button>
                        </form>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            <!-- /.row --> 
<script type="text/javascript">
$(document).ready(function(){
	var formObj=$("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation ==='remove'){
			formObj.attr("action","/qna/remove");
		}else if(operation === 'list'){
			//move to list
			formObj.attr("action","/qna/list").attr("method","get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			
			formObj.empty();
			formObj.append(pageNumTag);
			formObj.append(amountTag);
		}
		formObj.submit();
	});
});
</script>
<%@include file="../includes/footer.jsp" %>
       