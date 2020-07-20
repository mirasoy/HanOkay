<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../includes/header.jsp"%>

 <div class="container">
      <div class="col-lg-12">
         <div class="panel panel-default">
            <div class="panel-heading">
               <h1>Write Review</h1>
            </div>
            <div class="panel-body">
               <form id="form">
                  <table class="table table-striped table-bordered table-hover bookList">
                     <tr>
                        <td colspan="2">
                           <c:out value="${review.acmName }" />
                        </td>
                     </tr>
                     <tr>
                        <td><label>별점</label></td>
                        <td>
                           <P id="star">
                              <a href="#" value="1">★</a> <a href="#" id="2" value="2">★</a> <a href="#" value="3">★</a>
                              <a href="#" value="4">★</a> <a href="#" value="5">★</a>
                           </p>
                           <input type="hidden" name="stisf" id="stisf" value='<c:out value="${review.stisf }" />'>
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <input type="text" name='title' id='title' value='<c:out value="${review.title }" />'
                              required autofocus />
                        </td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <textarea name='content' rows="10" style="resize: none; width:100%;"
                              required><c:out value="${review.content } " /></textarea>
                           <input type="hidden" name="bookNum" value='<c:out value="${review.bookNum }" />'>
                           <input type="hidden" name="pstNum" value='<c:out value="${review.pstNum }" />'>
                        </td>
                     </tr>
                     <td colspan="2">
                        <button class="btn btn-primary movebtn" data-oper="modify">수정하기</button>
                        <button class="btn btn-red movebtn" data-oper="delete">삭제하기</button>
                        <a href="/review/list"><button class="btn" type="button">리스트로</button></a>
                     </td>
                     </tr>
                  </table>


               </form>
            </div>
         </div>
      </div>
   </div>

   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
      //기존별점불러오기
      $('#star').children().eq(<c:out value="${review.stisf }" /> - 1).addClass("on").prevAll("a").addClass("on");
      //별점변경 메서드
      $('#star a').click(function () {
         $(this).parent().children("a").removeClass("on");
         $(this).addClass("on").prevAll("a").addClass("on");
         $('#stisf').val($(this).attr("value"));
      });

      //글자수 제한
      $('input[name=title]').on('keyup', function () {
         if ($(this).val().length > 20) {
            alert("글자수는 20자로 이내로 제한됩니다.");
            $(this).val($(this).val().substring(0, 20));

         }

      });

      $('textarea[name=content]').on('keyup', function () {
         if ($(this).val().length > 500) {
            alert("글자수는 500자로 이내로 제한됩니다.");
            $(this).val($(this).val().substring(0, 500));

         }

      });


      let formObj = $("form");


      //버튼에 따라 컨트롤러에서 다른 서비스를 부르게함
      $('.movebtn').on("click", function (e) {
         e.preventDefault();
         let operation = $(this).data("oper");
         //지울때
         if (operation === 'delete') {

            formObj.attr("action", "/review/delete");
            formObj.attr("method", "post");
            $(this).attr("type", "submit");
            formObj.submit();
         }
         //수정할때
         if (operation === 'modify') {
            formObj.attr("action", "/review/modify");
            //내용여부 유효성검사
            if ($('input[name=title]').val().trim() == "") {
               $(this).attr("type", "button")
               $('input[name=title]').focuce();
               alert("제목을 입력해주세요");
            } else if ($('textarea[name=content]').val().trim() == "") {
               $(this).attr("type", "button")
               alert("내용을 입력해주세요");
            } else if ($('textarea[name=content]').val().trim() == "") {
               $(this).attr("type", "button")
               alert("내용을 입력해주세요");
            } else {
               formObj.attr("method", "post");
               $(this).attr("type", "submit");
               formObj.submit();
            }


         }


      }); 
   </script>

</body>
<%@include file="../includes/footer.jsp"%>

</html>