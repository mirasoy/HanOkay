<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
	.room{
		width:350px;
	}
	
	.exp{
		font-size:8px;
	}
	
	#image_container{
		border: 1px dotted blue;
	}
</style>

<div id="page-wrapper" style="padding-bottom:50px;">
				
			  <!-- 숙소 방 추가 모달로 띄우기-->
			  <form action="/hosting/become-host2_6pop" method="post">
				  <h4>2.개별객실 추가하기</h4><input type="text" name="ACM_NUM" id="ACM_NUM" value="ACM0001" readonly="readonly">
				
				  <div id="image_container" style="width:200px;height:200px;"></div>
				  <input type="file" id="ROM_PURL" name="ROM_PURL" placeholder="객실 사진" onchange="setThumbnail(event);">
				  <div id="rooms">
					  <div class="room" id="room">
						  <select name="ROM_TYPE" id="ROM_TYPE">
						  	<option value="single">싱글</option>
						    <option value="double">더블</option>
						    <option value="premium">프리미엄</option>
						    <option value="dorm">도미토리</option>
						  </select>
						  <input type="text" id="ROM_NAME" name="ROM_NAME" placeholder="객실 이름"><br>
						<input type="text" id="ROM_CAPA" name="ROM_CAPA" placeholder="객실 최대 인원수"><br>
						<input type="text" id="BED_TYPE" name="BED_TYPE" placeholder="침대유형"><br>
						<input type="text" id="BED_CNT" name="BED_CNT" placeholder="침대갯수"><br>
						<input type="text" id="ROM_SIZE" name="ROM_SIZE" placeholder="객실크기"><br>
						<input type="text" id="ROM_LOCA" name="ROM_LOCA" placeholder="객실위치"><br>
						<input type="text" id="ROM_PRICE" name="ROM_PRICE" placeholder="객실가격"><br>
								
					  </div>
				  		<!-- 여기에 appendChild하고 싶닷 -->
				  
				  <h4>2-2.객실 옵션</h4>
				   	
				   <!-- checkbox는 name값을 key값으로 갖기때문에 같게 두고, value값만 다르게 준다 -->	
				   <input type="checkbox" name="ROM_OPTCODE" id="ES" value="ES"><label for="ES">필수품목(수건, 침대시트, 비누, 화장지, 베개)</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="WF" value="WF"><label for="WF">무선인터넷</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="TV" value="TV"><label for="TV">tv</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="HT" value="HT"><label for="HT">난방</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="AC" value="AC"><label for="AC">에어컨</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="IO" value="IO"><label for="IO">다리미</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="WS" value="WS"><label for="WS">샴푸 린스, 로션 </label>
				   <input type="checkbox" name="ROM_OPTCODE" id="HR" value="HR"><label for="HR">헤어드라이어</label><br>
				   <input type="checkbox" name="ROM_OPTCODE" id="CP" value="CP"><label for="CP"> 커피/티메이커 </label>
				   <input type="checkbox" name="ROM_OPTCODE" id="WM" value="WM"><label for="WM"> 세탁기 </label>
				   <input type="checkbox" name="ROM_OPTCODE" id="DK" value="DK"><label for="DK">업무 가능한 공간/책상</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="DW" value="DW"><label for="DW">옷장/서랍장</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="WP" value="WP"><label for="WP">반려동물 동반 가능</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="BT" value="BT"><label for="BT">욕조</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="RG" value="RG"><label for="RG">냉장고</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="BC" value="BC"><label for="BC">발코니/테라스</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="SM" value="SM"><label for="SM">흡연</label>
				   <input type="checkbox" name="ROM_OPTCODE" id="KC" value="KC"><label for="KC">개별주방</label>


			  <br>
			  <button type="button" onclick="romRegit()">등록하기</button>
			</form>
			
		</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	
	function romRegit(){
		var chkArr=[]; //배열 초기화
		
		var acmNum=$("#ACM_NUM").val();//숙소번호
		var romType=$("#ROM_TYPE").val();//룸타입
		var romName=$("#ROM_NAME").val();//객실이름
		var romCapa=$("#ROM_CAPA").val();//객실최대인원수
		var bedType=$("#BED_TYPE").val();//침대유형
		var bedCnt=$("#BED_CNT").val();//침대갯수
		var romSize=$("#ROM_SIZE").val();//객실크기
		var romLoca=$("#ROM_LOCA").val();//객실위치
		var romPrice=$("#ROM_PRICE").val();//객실가격
		
		$("input[name=ROM_OPTCODE]:checked").each(function(i){//체크박스값들을 모조리 배열에 담는다
			//console.log('checkbox값:'+$(this).val());
			chkArr.push($(this).val());
		});
		
		//name/value 형태로 담는다
		var allData={"acmNum":acmNum, "romType":romType,"romName":romName, "romNum":"T0111",
				"romCapa":romCapa, "bedType":bedType, "bedCnt":bedCnt, "romSize":romSize, 
				"romLoca":romLoca,"romPrice":romPrice,"romPurl":"rom.jpg",
				"romOptArr":chkArr		
		}
		
		$.ajax({
			url:'become-host2_6pop',
			type:'post',
			data:allData,
			success: function(data){
				alert("객실이 추가되었습니다.");
				self.close();
			}
		});
		
	}
	
	function setThumbnail(event) { 
		var reader = new FileReader();
			reader.onload = function(event) {
				var img = document.createElement("img"); 
				img.setAttribute("src", event.target.result); 
				img.style.width="200px";
				img.style.height="200px";
				document.querySelector("#image_container").appendChild(img); 
			}; 
		
		reader.readAsDataURL(event.target.files[0]); 
	}
	
	
</script>

