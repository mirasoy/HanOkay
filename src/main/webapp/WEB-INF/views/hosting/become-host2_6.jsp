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

<%@include file="../includes/becomehostheader.jsp"%>
<!-- nav-sidebar -->
<nav>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                       <li>
                           <a><c:out value="${userFstname}"/>님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                        </li>
                        <li>
                            <a><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                        </li>
                        <li>
                            <a><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a class="active"><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
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
	<div class="pull-right">
		<button data-oper='next' class="form-control"style="width:150px;">객실 추가 완료</button>
	 </div>
  <form action="become-host-complete" method="post">
  <!-- 숙소 방 추가 모달로 띄우기-->
  <h4>숙소 '<c:out value="${acmName}"/>'에 객실 추가하기</h4>
  <input type="hidden" id="acmNum" name="acmNum" value=" <c:out value='${acmNum}'/>" readonly="readonly">
  <h3 align="left">총 <span><c:out value='${size}'/></span>개의 객실</h3>
			
			  
		
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				객실 목록
				<button data-oper='openpop'  class="btn btn-xs pull-right">새 객실 등록</button>
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
						<tr style = "height: 220px;">
							<td style="width: 350px;">
							<img style=' width: auto; height: 200px; max-width: 300px; margin-left :20px; ' id='rPicture' src='/review/display?fileName=<c:out value="${room.romPurl}" /><c:out value="${room.romPname }" />'>
							</td>
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
			
			
		</form>	
			
		<!-- 빈 폼 -->
		<form id="actionForm">
		</form>
</div>


<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">
	
	$(document).ready(function(){
		$(".move").on("click", function(e){
			var actionForm = $("#actionForm");
			
			e.preventDefault();
			actionForm.append("<input type='hidden' name='romNum' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/hosting/getRom");
			actionForm.submit();
		});
		
	});

	
	$(document).ready(function(){
		var formObj = $("#actionForm");
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			if(operation==='next'){
				var size=document.querySelector('span');
				
				if(size.innerText=="0"){
					alert("한개이상의 객실이 등록되어야합니다");
					return;
				}else{
					alert("객실등록이 완료되었습니다");
					formObj.append("<input type='hidden' name='acmNum' value='"+$('#acmNum').val()+"'>");
					formObj.attr("action","/hosting/become-host-complete");	
					actionForm.submit();
				}
			}else if(operation=='openpop'){
				var openWin;//자식창
				
				var _width='800';
				var _height='500';
				
				var _left=Math.ceil((window.screen.width-_width)/2);
				var _top=Math.ceil((window.screen.width-_height)/2);
				
				var acmNum=$('#acmNum').val();
				
		        window.name = "parentForm";
		        

		        // window.open("open할 window", "자식창 이름", "팝업창 옵션");
		        openWin = window.open('/hosting/become-host2_6pop?acmNum='+acmNum,'childForm',
		        		'width='+_width+', height='+_height+', left='+_left+', top='+_top+', resizable = no, scrollbars = no');   
		        
				
			}
		});
	});
	
	
</script>




