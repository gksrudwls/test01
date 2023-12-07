<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    /* 추가된 CSS 스타일 */
    #preview {
        max-width: 100%; /* 이미지의 최대 너비를 100%로 설정 */
        max-height: 100%; /* 이미지의 최대 높이를 100%로 설정 */
        object-fit: contain; /* 이미지를 가로 및 세로 비율을 유지하면서 요소에 맞게 조절 */
    }
</style>
	<!-- content 영역 -->

<div class="row">
	<form class="col-6 offset-3 mt-5 rounded-4" action="biddingProcess" method="post" enctype="multipart/form-data" style="background-color:#93a5a8">
	<input type="hidden" name="no" id="no" value="${product.no}"/>
		<div class="row m-3">
			<div class="col fs-1 text-center text-white">
				Bidding
			</div>
		</div>
		<div class="row bg-white m-3 rounded-4 p-5">
			<div class="col">
				<div class="row mt-5 mb-2">
					<div class="col-md-6 offset-md-3 text-center">
		             	<img src="resources/upload/${product.file1 }" name="preview" id="preview" class="img-fluid" alt="${product.file1 }"/>
		            </div>
				</div>
				<div class="row mb-3 justify-content-center">
		            <div class="col-4">
			 			<input type="file" class="form-control form-control-sm border border-1" name="file1" id="file1" onchange="readURL(this);">
		            </div>
		        </div>
				<div class="row mb-5 text-center">
					<div class="col">
						<input type="text" class="order border-0 text-center" name="price" id="price" value="${product.price }">			
					</div>
				</div>
				<div class="row mb-5 text-center">
					<div class="col">
						<label class="fs-6">Available time to purchase</label>
						<br>
						<input type="text" class="border border-1 rounded-4 text-center" name="regDate" id="datepicker">
					</div>
				</div>
				<div class="row mb-5 text-center">
					<div class="col">
						<input type="text" class="form-control" name="title" id="title" value="${product.title}">
					</div>
				</div>
				<div class="row mb-5 text-center">
					<div class="col">
						<pre><textarea class="form-control" name="content" id="detailedDescription" rows="3">${product.content}</textarea></pre>
					</div>
				</div>
				<div class="row text-center mb-5">
					<div class="col">
						<input type="submit" value=Update name="update" id="update" class="btn text-white" style="background-color:#93a5a8"></input>
					</div>
					<%-- <div class="col">
						<input type="button" onclick="location.href='deleteProduct?no=${product.no}'" value="Delete" name="delete" id="delete" class="btn text-white" style="background-color:#93a5a8"></input>
					</div> --%>
				</div>
			</div>
		</div>	
	</form>
</div>






<script>
	function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
	}
	

	
	
	
	  $(function() {
	       //input을 datepicker로 선언
	       $("#datepicker").datepicker({
	           dateFormat: 'yy-mm-dd' //달력 날짜 형태
	           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
	           ,changeYear: true //option값 년 선택 가능
	           ,changeMonth: true //option값  월 선택 가능                
	           //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
	           ,buttonText: "선택" //버튼 호버 텍스트              
	           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
	           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
	           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
	           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
	           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
	           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
	           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
	       });                    
	       
	       //초기값을 오늘 날짜로 설정해줘야 합니다.
	       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
	   });
</script>