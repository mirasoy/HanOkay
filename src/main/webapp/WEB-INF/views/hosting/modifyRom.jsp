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
	
	 input[type=checkbox] {
        display:none;
        margin:10px;
    }

    input[type=checkbox] + label {
        display:inline-block;
        margin:2px;
        padding: 4px 10px;
        background-color: #e7e7e7;
        border-color: #ddd;
        border-radius: 10px;
    }
    /*
     Change background color for label next to checked radio button
     to make it look like highlighted button
    */
    input[type=checkbox]:checked + label {
       background-image: none;
        background-color:cornflowerblue;
        color: white;
    }
</style>

<%@include file="../includes/hostheader.jsp"%>
<!-- nav-sidebar -->
<nav>
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                     <ul class="nav" id="side-menu">
                   		<li>
                           <a></a> 
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
  <!-- 수정, 삭제 가능하게  -->
  		  
	<div class="row">
  <div class="col-lg-12">
    <h4><c:out value="${thisrom.romName }"/>의  정보 수정하기</h4>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">
	<input type="hidden" name='acmNum' id='acmNum' value='<c:out value="${thisrom.acmNum }"/>' readonly="readonly">
	<input type="hidden" name='romNum' id='romNum' value='<c:out value="${thisrom.acmNum }"/>' readonly="readonly">
   
      <div class="panel-heading">객실 수정
      <label class="pull-right"><c:out value="${thisrom.acmNum }"/><c:out value="${thisrom.romNum }"/></label>
      </div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
      <form id="actionForm">
        <div class="form-group">
          <label>객실이름</label> <input class="form-control" style="width:100px;display:inline-block;" id="romName"
          name='romName' value='<c:out value="${thisrom.romName }"/>'>
        </div>
        <div class="form-group">
          <label>객실 타입</label><br> 
          <select class="form-control" name="romType" id="romType" style="width:100px;display:inline-block;">
            <option value="싱글룸">싱글</option>
            <option value="더블룸">더블</option>
            <option value="프리미엄">프리미엄</option>
            <option value="도미토리">도미토리</option>
         </select>
         </div>
        <div class="form-group">
          <label>객실최대수용인원</label> <br>
          <select class="form-control" style="width:100px;display:inline-block;" name="romCapa" id="romCapa">
            <option value="1">1명</option>
            <option value="2">2명</option>
            <option value="3">3명</option>
            <option value="4">4명</option>
            <option value="5">5명</option>
            <option value="6">6명</option>
            <option value="7">7명</option>
            <option value="8">8명</option>
            <option value="9">9명</option>
            <option value="10">10명</option>
         </select>
            
        </div>
        <div class="form-group">
           <label for="BED_TYPE">침대 유형</label>
          	<select class="form-control" style="width:120px;display:inline-block;" name="bedType" id="bedType" onchange="categChange(this)">
	            <option value="온돌">온돌(이불)</option>
	            <option value="싱글">싱글</option>
	            <option value="퀸">퀸</option>
	            <option value="킹">킹</option>
	            <option value="2층침대">2층침대</option>
        	</select>
        </div>
		<div class="form-group">
           <label for="BED_CNT">침대 갯수</label>
          <select class="form-control" style="width:120px;display:inline-block;" name="bedCnt" id="bedCnt">
            <option value="0">온돌(이불)</option>
         </select></div>
		<div class="form-group">
          <label>객실 크기</label> <input class="form-control" id="romSize" name='romSize' style="width:100px;display:inline-block;"
            value='<c:out value="${thisrom.romSize }"/>'>
        </div>
        <div class="form-group">
          <label>객실 1박요금</label> <input class="form-control" id="romPrice" name='romPrice' style="width:100px;display:inline-block;"
            value='<c:out value="${thisrom.romPrice }"/>'>
        </div>
        <div class="form-group">
          <label>객실 사진</label> <input class="form-control" id="romPurl" name='romPurl' style="width:300px;display:inline-block;"
            value='<c:out value="${thisrom.romPurl }"/>' readonly="readonly">
        </div>
		<!-- 편의시설 -->
		
		<div class="form-group">
          <label>객실 옵션 수정</label><br> 
          <input type="checkbox" name="romOptcode" id="RM_OPT_ES" value="1"><label for="RM_OPT_ES">필수품목(수건,화장지, 이불, 씻는도구)</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_WF" value="2"><label for="RM_OPT_WF">무선인터넷</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_TV" value="4"><label for="RM_OPT_TV">tv</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_HT" value="8"><label for="RM_OPT_HT">난방/에어컨</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_IO" value="16"><label for="RM_OPT_IO">다림질 도구</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_HR" value="32"><label for="RM_OPT_HR">헤어드라이어</label><br>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_CP" value="64"><label for="RM_OPT_CP"> 커피/티메이커 </label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_WM" value="128"><label for="RM_OPT_WM"> 세탁기 </label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_DK" value="256"><label for="RM_OPT_DK">업무 가능한 공간/책상</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_DW" value="512"><label for="RM_OPT_DW">옷장/서랍장</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_WP" value="1024"><label for="RM_OPT_WP">반려동물 동반 가능</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_BT" value="2048"><label for="RM_OPT_BT">욕조</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_RG" value="4096"><label for="RM_OPT_RG">냉장고</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_BC" value="8192"><label for="RM_OPT_BC">발코니/테라스</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_SM" value="16384"><label for="RM_OPT_SM">흡연</label>
	      <input type="checkbox" name="romOptcode" id="RM_OPT_KC" value="32768"><label for="RM_OPT_KC">개별주방</label>
  		</div>
		<div class="form-group">
          <label>객실 등록일</label> <input class="form-control" name='romRegdate'  style="width:300px;display:inline-block;"
            value='<c:out value="${thisrom.romRegdate }"/>' readonly="readonly">
        </div>
        <div class="form-group">
          <label>객실 최근 수정일</label> <input class="form-control" name='romUpdatedate'  style="width:300px;display:inline-block;"
            value='<c:out value="${thisrom.romUpdatedate }"/>' readonly="readonly">
        </div>

	
			<button data-oper='modify' class="btn btn-default">수정완료</button>
			<button data-oper='getRom' class="btn btn-info">수정취소</button>
				
		</form>
		</div>
</div>
</div>
</div>
</div>

	
				

<script type="text/javascript">
function categChange(e){
    var bed_ondol=["이불"];
    var bed_single=["1","2","3"];
    var bed_queen=["1","2","3"];
    var bed_king=["1","2","3"];
    var bed_2f=["1","2","3","4","5"];
    var target=document.getElementById("bedCnt");
    
    if(e.value=="온돌")var cnt=bed_ondol;
    else if(e.value=="싱글")var cnt=bed_single;
    else if(e.value=="퀸")var cnt=bed_queen;
    else if(e.value=="킹")var cnt=bed_king;
    else if(e.value=="2층침대")var cnt=bed_2f;
    
    target.options.length = 0;

    for (x in cnt) {
       var opt = document.createElement("option");
       opt.value = cnt[x];
       opt.innerHTML = cnt[x];
       target.appendChild(opt);
    }   
 }
 
	$(document).ready(function(){
		var formObj = $("#actionForm");
		var acmNum = $("#acmNum").val();
		var chkArr = []; //배열 초기화
		var romOptcode=0;
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			
			var operation=$(this).data("oper");
			console.log(operation);
			
			//취소 버튼을 누르면 getRom으로 
			if(operation==='getRom'){
				alert("수정이 취소되었습니다");
				//formObj안에 romNum값이 있으니~
				formObj.attr("action","/hosting/getRom");	
				
			} else if(operation==='modify'){//수정완료버튼
				var flag=true;
				
				$("input").each(function () {
					val = $(this).val().trim();
					if (val == '') {
						alert('모든 항목을 입력해주십시오.');
						$(this).focus();
						flag = false;
						return flag; // break
					}
				});
				
				$("input[name=romOptcode]:checked").each(function (i) {//체크박스값들을 모조리 배열에 담는다
					//console.log('checkbox값:'+$(this).val());
					chkArr.push($(this).val());
					romOptcode=parseInt(romOptcode)+parseInt($(this).val());
				});
				//alert("rom:"+romOptcode);
				if(romOptcode==0)flag=false;
				
				if(flag){
					alert("객실 수정이 완료되었습니다");
					formObj.attr("method","post");
					formObj.attr("action","/hosting/modifyRom");//홈의 내용과 다같이 들어간다
				
				}else return;
			}
			
			actionForm.submit();
		});
	});

	//숫자만 입력가능하게만드는 부분
	$("input:text[numberOnly]").on("keyup", function () {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});

</script>





