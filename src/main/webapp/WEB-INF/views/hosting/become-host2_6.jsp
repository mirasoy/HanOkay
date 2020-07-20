<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.room{
		float:left;
		width:350px;
		height:250px;
	}
	
	.exp{
		font-size:8px;
	}
</style>

<%@include file="../includes/hostheader.jsp"%>
<!-- nav-sidebar -->
<nav>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       <li>
                           <a><c:out value="${userFstname}"/>님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                        </li>
                        <li>
                            <a href=""><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href=""><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;">
	<br>			
  <form action="become-host-complete" method="post">
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h4>6.개별객실 추가하기</h4><input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
  <h3 align="left">총 <c:out value="${size}"/>개의 방</h3>
			
			  
		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				객실 목록
				<button id='regBtn' type="button" class="btn btn-xs pull-right" onclick='openPop()'>새 객실 등록</button>
			</div>

			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>객실 사진</th>
							<th>객실이름</th>
							<th>객실유형</th>
							<th>침대갯수</th>
							<th>최대인원수</th>
						</tr>
					</thead>

					<c:forEach items="${list}" var="room">
						<tr>
							<td><c:out value="${room.romPurl}" /></td>
							<td>
								<a class='move' href='<c:out value="${room.romNum}"/>'>
									<c:out value="${room.romName}" />
								</a>
							</td>
							<td><c:out value="${room.romType}" /></td>
							<td><c:out value="${room.bedCnt}" /></td>
							<td><c:out value="${room.romCapa}" /></td>
						</tr>
					</c:forEach>
				</table>
				
				
				  <br>
				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
			
			
		<button type="submit" onclick="">다음으로</button>
		</form>	
			
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
				
			
		</div>


<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	
	
	var openWin;//자식창
	function openPop(){
		// window.name = "부모창 이름"; 
		
		var _width='850';
		var _height='400';
		
		var _left=Math.ceil((window.screen.width-_width)/2);
		var _top=Math.ceil((window.screen.width-_height)/2);
		
		var acmNum=$('#acmNum').val();
		
        window.name = "parentForm";
        

        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
        openWin = window.open('/hosting/become-host2_6pop?acmNum='+acmNum,'childForm',
        		'width='+_width+', height='+_height+', left='+_left+', top='+_top+', resizable = no, scrollbars = no');   
        
	}

	
	
	
	
	$(document).ready(function(){
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='romNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/hosting/getRom");
			actionForm.submit();
		});
	});
	
</script>




