<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/Hostheader.jsp"%>
<!-- nav-sidebar -->
<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <!-- 사업자 등록도 받을것 -->
                    
                    <ul class="nav" id="side-menu">
                        <li>
                           <a>user님 안녕하세요!<br> 숙소 등록을 시작해볼까요?</a> 
                        </li>
                        <li>
                            <a href="/hosting/become-host"><i class="fa fa-gear fa-fw"></i> 숙소정보</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host1_6"><i class="fa fa-male fa-fw"></i> 상세 정보</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host2_6"><i class="fa fa-camera fa-fw"></i> 객실 추가</a>
                        </li>
                        <li>
                            <a href="/hosting/become-host-complete"><i class="fa fa-files-o fa-fw"></i> 검토하기</a>
                        </li>
                        
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav> 
	<!-- nav-end -->
<div id="page-wrapper" style="padding-bottom:50px;">
		
		<!-- 기억하기가 되면 좋겠다  중간저장?-->
			<form action="/hosting/become-host" method="post">
				<h4><br><br>1.게스트가 묵게 될 숙소의 유형을 골라주세요(중복허용)</h4><br>
				<input type="checkbox" id="acmType_house" name="acmType" value="house"><label for="rentType1">집 천제</label> 
				<input type="checkbox" id="acmType_priv" name="acmType" value="priv"><label for="rentType2">개인실</label> 
				<input type="checkbox" id="acmType_multi" name="acmType" value="multi"><label for="rentType3">도미토리</label> 
			
				
						  
			  <h4>2.숙소 이름과 정보</h4><br>
			   <input type="text" id="acmName" name="acmName" placeholder="숙소의 이름"><br>
			   <!-- 구글 API추가해야함 -->
			   <input type="text" id="acmCity" name="acmCity" placeholder="숙소 시도"><br>
			   <input type="text" id="acmDistr" name="acmDistr" placeholder="숙소 구군"><br>
			   <input type="text" id="acmDetailaddr" name="acmDetailaddr" placeholder="숙소 상세주소"><br>
			   <input type="text" id="repPhone" name="repPhone" placeholder="숙소 대표번호"><br>
			   <input type="text" id="acmFax" name="acmFax" placeholder="숙소  팩스번호"><br>
			   <input type="text" id="acmEmail" name="acmEmail" placeholder="숙소  이메일 주소"><br>
			  
			  <br><br>
			  <h4>3.Ana에 숙소를 등록하시려면 사업자 등록증은 필수입니다!</h4><br>
			  <input type="text" id="bizRegnum" name="bizRegnum" placeholder="사업자등록번호"><br>
			  <input type="file" id="bizRegpurl" name="bizRegpurl" placeholder="사업자등록증"><br>
			  
			  <h4>4.숙소의 체크인 체크아웃 타임을 설정해주세요</h4><br>
			  <label for="checkinTime">체크인시간</label>
				<select name="checkinTime" id="checkinTime">
				  <option value="pm12">점심12시이후</option>
				  <option value="pm01">1시이후</option>
				  <option value="pm02">2시이후</option>
				  <option value="pm03">3시이후</option>
				  <option value="pm04">4시이후</option>
				  <option value="pm05">5시이후</option>
				  <option value="pm06">6시이후</option>
				  <option value="pm07">7시이후</option>
				  <option value="pm08">8시이후</option>
				  <option value="pm09">9시이후</option>
				  <option value="pm10">10시이후</option>
				  <option value="anytime">상관없음</option>
				</select>
			  <label for="checkouTime">체크아웃시간</label>
				<select name="checkoutTime" id="checkoutTime">
				  <option value="am09">오전9시이전</option>
				  <option value="am10">오전10시이전</option>
				  <option value="am11">오전11시이전</option>
				  <option value="pm12">12시이전</option>
				  <option value="pm01">1시이전</option>
				  <option value="pm02">2시이전</option>
				  <option value="pm03">3시이전</option>
				  <option value="pm04">4시이전</option>
				  <option value="pm05">5시이전</option>
				</select>
			  
			  
			  <br><br><br>
			  <button type="submit" onclick="">다음으로</button><!-- ajax처리안함 -->
			</form>
		</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function acmRegitstart(){
		var chkArr=[];
		
		var acmName=$("#acmName").val();
		var acmCity=$("#acmCity").val();
		var acmDistr=$("#acmDistr").val();
		var acmDetailaddr=$("#acmDetailaddr").val();
		var repPhone=$("#repPhone").val();
		var acmFax=$("#acmFax").val();
		var acmEmail=$("#acmEmail").val();
		var bizRegnum=$("#bizRegnum").val();
		//var bizRegpurl=$("#bizRegpurl").val();
		
		$("input[name=acmType]:checked").each(function(i){//체크박스값들을 모조리 배열에 담는다
			console.log('checkbox값:'+$(this).val());//크롬쪽에서 확인할수있다
			chkArr.push($(this).val());
		});
		
		var allData={"acmName":acmName, "acmCity":acmCity, "acmDistr":acmDistr, "acmDetailaddr":acmDetailaddr,
				"repPhone":repPhone,"acmFax":acmFax, "acmEmail":acmEmail, "bizRegnum":bizRegnum, //"bizRegpurl":"-",
				"acmTypeArr":chkArr		
		}
		
		$.ajax({
			url:"/hosting/become-host",
			type:"POST",
			data:allData,
			success: function(data){
				alert("객실 등록을 시작합니다.");
				//window.location.href = "/hosting/become-host1_6";

			}, error:function(){
	            alert("에러 발생~~ ");
	        }
		});
		
	}



</script>

