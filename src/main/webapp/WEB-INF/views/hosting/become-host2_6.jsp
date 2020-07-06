<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<%@include file="../includes/Hostheader.jsp"%>
<!-- nav-sidebar -->
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                           <a>user님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                        </li>
                        
                        <li>
                            <a href="/hosting/become-host"><i class="fa fa- fa-fw"></i> 시작하기</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host1_6"><i class="fa fa-gear fa-fw"></i> 숙소 정보</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host2_6"><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host3_6"><i class="fa fa-map fa-fw"></i> 숙소 설명</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host4_6"><i class="fa fa-male fa-fw"></i> 게스트 설정</a>
                            
                        </li>
                        <li>
                            <a href="/hosting/become-host5_6"><i class="fa fa-calendar fa-fw"></i> 달력 및 예약 가능여부</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host6_6"><i class="fa fa-credit-card fa-fw"></i> 요금</a>
                            
                        </li>
                        <li>
                            <a href="/hosting/become-host_complete"><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                            
                        </li>
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;">
				
			  <!-- 숙소 방 추가 모달로 띄우기-->
			  <form action="" method="post">
			  <h4>3.개별객실 추가하기</h4>
			  <h3>총 <span id=roomcount></span>개의 방</h3>
			  <button type="submit">제출하기</button>
			  
			  <br><br>
			  <div id="rooms">
				  <div class="room" id="room1">
					  <select name="roomtype" id="roomtype1">
					  	<option value="single">싱글</option>
					    <option value="double">더블</option>
					    <option value="premium">프리미엄</option>
					    <option value="dorm">도미토리</option>
					  </select>
					  <input type="text" id="roomname1" name="roomname" placeholder="방이름"><br>
					  <input type="file" id="roompic1" name="roompic" placeholder="방의 사진" onchange="setThumbnail(event);">
		
					  <div id="image_container1" style="width:200px;height:200px;"></div>
				  </div>
			  		<!-- 여기에 appendChild하고 싶닷 -->
			  
			  <h4>2-2.객실 옵션</h4>
			   	
			   <input type="checkbox" id="RM_OPT_ES" name="RM_OPT_ES"><label for="RM_OPT_ES">필수품목(수건, 침대시트, 비누, 화장지, 베개)</label>
			   <input type="checkbox" id="op_wifi" name="op_wifi"><label for="op_wifi">무선인터넷</label>
			   <input type="checkbox" id="op_tv" name="op_tv"><label for="op_tx">tv</label>
			   <input type="checkbox" id="op_warm" name="op_warm"><label for="op_warm">난방</label>
			   <input type="checkbox" id="op_aircon" name="op_aircon"><label for="op_aircon">에어컨</label>
			   <input type="checkbox" id="op_iron" name="op_iron"><label for="op_iron">다리미</label>
			   <input type="checkbox" id="op_wash" name="op_wash"><label for="op_wash">샴푸 린스, 로션 </label>
			   <input type="checkbox" id="op_hdryer" name="op_hdryer"><label for="op_hdryer">헤어드라이어</label><br>
			   <input type="checkbox" id="op_brf" name="op_brf"><label for="op_brf"> 커피/티메이커 </label>
			   <input type="checkbox" id="op_brf" name="op_brf"><label for="op_brf"> 세탁기 </label>
			   <input type="checkbox" id="op_desk" name="op_desk"><label for="op_desk">업무 가능한 공간/책상</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">옷장/서랍장</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">반려동물 동반 가능</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">욕조</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">냉장고</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">발코니/테라스</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">흡연</label>
			   <input type="checkbox" id="op_drawer" name="op_drawer"><label for="op_drawer">개별주방</label>
			   
			   
			  	
			  
			  </div>
			 	 <button type="button" onclick="appendNew()" style="float:left;"><i class="fa fa-plus-circle fa-fw"></i></button><!-- 추가하면 위의 양식이 똑같이 추가됨 -->
			  <br><br>
			  
			  <br>
			</form>
			
		</div>


<%@include file="../includes/footer.jsp"%>
<script>
	var count=1;
	$(document).ready(function(){
		$('#roomcount').text(count);
	});

</script>
<script> 

	function setThumbnail(event) { 
		var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result); 
				img.style.width="200px";
				img.style.height="200px";
				document.querySelector("div#image_container").appendChild(img); 
			}; 
		
		reader.readAsDataURL(event.target.files[0]); 
	}
	
	function appendNew(){
		var addedFormDiv = document.getElementById("rooms");
		
		var str='<select>'+'<option value="single">싱글</option>'
		+'<option value="double">더블</option>'
		+'<option value="premium">프리미엄</option>'
		+'</select>'
		+'<input type="text" placeholder="방이름">'
		+'<input type="file" placeholder="방의 사진" onchange="setThumbnail(event);">'
		+'<div id="image_container" style="width:200px;height:200px;">'
		+'</div>';
		
		if(count<=8){
			var addedDiv = document.createElement("div"); //div를 하나 만들고 
			addedDiv.setAttribute("id","room"+count);
			addedDiv.setAttribute("class","room");
			addedDiv.innerHTML=str;//div내용 삽입
			addedFormDiv.appendChild(addedDiv);//삽입할 div에 새div 삽입
			
			var newselect = $('select');
			newselect[newselect.length-1].setAttribute("id","roomtype"+count);
			var newinput = $('input');
			newinput[newinput.length-2].setAttribute("id","roomname"+count);
			newinput[newinput.length-1].setAttribute("id","roompic"+count);

			count++;			
			$('#roomcount').text(count);
		} else {
			alert("8개까지 등록 가능합니다.")
		}
		
	}

</script>
<!-- <select>
		  	<option value='single'>싱글</option>
		    <option value='double'>더블</option>
		    <option value='premium'>프리미엄</option>
		    <option value='dorm'>도미토리</option>
		  </select>"+"
		  <input type='text' placeholder='방이름'><br>
		  <input type='file' placeholder='방의 사진' onchange='setThumbnail(event);'>"+"
		  <div id='image_container' style='width:200px;height:200px;'></div> 
		  
		  var newdiv=$('#room'+count).find('div');
			newdiv.setAttribute("id","image_container"+count);
			
		  
		  
		  -->
