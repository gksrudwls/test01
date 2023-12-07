// DOM이 준비되면
$(function() {
	
	$("#replyWrite").on("click", function() {
		// 자식 요소로 이동 또는 추가하는 것
		console.log($("#replyForm").css("display"));
		console.log($("#replyForm").is(":visible"));
		
		if($("#replyForm").is(":visible")) { // 폼이 현재 보이고 있는 상태
			
			let $prev = $("#replyTitle").prev();
			
			// 현재 폼이 보이고 있는 버튼이 아닐 때만 동작
			if(!$prev.is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			
			setTimeout(function() {
				$("#replyForm").insertBefore("#replyTitle").slideDown(300);
			}, 300);
			
		} else { // 폼이 현재 화면에 보이지 않는 상태 처리
			// 형제 요소의 앞 뒤로 이동
			$("#replyForm").insertBefore("#replyTitle").removeClass("d-none").css({"display":"none"}).slideDown(300);
		}
		
		$("#replyForm").find("form").attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
		$("#replyWriteButton").val("댓글쓰기");
		
	});
	
	// 삭제하기
	$(document).on("click", ".deleteReply", function(e) {
		let no = $(this).attr("data-no");
		let writer = $(this).parent().prev().find("span").text();
		let bbsNo = $("#replyForm input[name=bbsNo]").val();
		let params = "no=" + no + "&bbsNo=" + bbsNo; 
		console.log(params);
		
		$replyForm = $("#replyForm").slideUp(300);
		let result = confirm(writer + "님이 작성한 " + no +"번 댓글을 삭제하시겠습니까?");
		
		if(result) {
		$.ajax({
			url:"replyDelete.ajax", data:params, type:"post", "dataType":"json", 
			success:function(resData, status, xhr) { // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 콜백
				console.log(resData);
			
			$("#replyList").empty();
			$.each(resData, function(index, data) {
				
				let date = new Date(data.regDate);
				let strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + date.getMonth() + 1 : date.getMonth() + 1)
														+ ((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + ""
														+ ((date.getHours() < 10) ? "0" + date.getHours() : date.getHours()) + " : "
														+ ((date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes()) + " : "
														+ ((date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds());
				
				let result = 
				'<div class="replyRow row border border-top-0">'
				 +'<div class="col">'
				 +	'<div class="row p-2 bg-light">'
				 +		'<div class="col-4">'
				 +			'<span>' + data.replyWriter + '</span>'
				 +		'</div>'
				 +		'<div class="col-8 text-end">'
				 +			'<span class="me-3">' + strDate + '</span>'
				 +			'<button data-no="' + data.no + '" class="modifyReply btn btn-outline-success btn-sm">'
				 +				'<i class="bi bi-journal-text">수정</i>'
				 +			'</button>' 
				 +			'<button data-no="' + data.no + '" class="deleteReply btn btn-outline-warning btn-sm">'
				 +				'<i class="bi bi-journal-text">삭제</i>'
				 +			'</button>' 
				 +			'<button onclick="reportReply(\'' + data.no + '\');"class="btn btn-outline-danger btn-sm">'
				 +				'<i class="bi bi-journal-text">신고</i>'
				 +			'</button>'
				 +		'</div>'
				 +	'</div>'
				 +	'<div class="row">'
				 +		'<div class="col p-3">'
				 +			'<pre>' + data.replyContent + '</pre>'
				 +		'</div>'
				 +	'</div>'
				 +'</div>'
				+'</div>';
				
				$("#replyList > .col").append(result);
				
			}); // end $.each()
			
			// 댓글 수정하기가 완료되면 백업한 폼을 원래 자리에 다시 넣는다.
			$("#replyForm").val("");
			$replyForm.css("display", "none");
			$("#global-content>div.col-10").append($replyForm);
			
		}, 
			error:function(xhr, status) { // ajax 통신시 오류 발생할 때 호출 되는 콜백
				console.log("error : ", status);
			}
		});
	}
		return false;
	});
	
	function reportReply(elemId) {
		var result = confirm("이 댓글을 신고하시겠습니까?"); 
		if(result == true) {
		alert("report - " + result); 
		}
		}
	// 댓글 쓰기 폼이 submit 될 때
	$("#replyWriteForm").on("submit", function(e) {
		if($("#replyContent").val().length < 5) {
			alert("댓글은 5자 이상입니다.");
			return false;
		}
		
		let params = $(this).serialize();
		console.log(params);
		
		$.ajax({
			url:"replyWrite.ajax", data:params, type:"post", "dataType":"json", 
			success:function(resData) { // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 콜백
				// console.log(resData);
			// 기존의 내용을 화면에서 삭제
			$("#replyList > .col").empty();
			$.each(resData, function(index, data) {
				
				let date = new Date(data.regDate);
				let strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + date.getMonth() + 1 : date.getMonth() + 1)
														+ ((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + ""
														+ ((date.getHours() < 10) ? "0" + date.getHours() : date.getHours()) + " : "
														+ ((date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes()) + " : "
														+ ((date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds());
				
				let result = 
				'<div class="replyRow row border border-top-0">'
				 +'<div class="col">'
				 +	'<div class="row p-2 bg-light">'
				 +		'<div class="col-4">'
				 +			'<span>' + data.replyWriter + '</span>'
				 +		'</div>'
				 +		'<div class="col-8 text-end">'
				 +			'<span class="me-3">' + strDate + '</span>'
				 +			'<button data-no="' + data.no + '" class="modifyReply btn btn-outline-success btn-sm">'
				 +				'<i class="bi bi-journal-text">수정</i>'
				 +			'</button>' 
				 +			'<button data-no="' + data.no + '" class="deleteReply btn btn-outline-warning btn-sm">'
				 +				'<i class="bi bi-journal-text">삭제</i>'
				 +			'</button>' 
				 +			'<button onclick="reportReply(\'' + data.no + '\');"class="btn btn-outline-danger btn-sm">'
				 +				'<i class="bi bi-journal-text">신고</i>'
				 +			'</button>'
				 +		'</div>'
				 +	'</div>'
				 +	'<div class="row">'
				 +		'<div class="col p-3">'
				 +			'<pre>' + data.replyContent + '</pre>'
				 +		'</div>'
				 +	'</div>'
				 +'</div>'
				+'</div>';
				
				$("#replyList > .col").append(result);
				
			}); // end $.each()
			
			// 댓글 쓰기 완료되면 폼은 숨긴다.
			$("#replyForm").slideUp(300).add("#replyContent").val("");
			
		}, 
			error:function(xhr, status) { // ajax 통신시 오류 발생할 때 호출 되는 콜백
				console.log("error : ", status);
			}
		});
		
		return false;
	});
	
	// 댓글 수정하기 폼이 submit될 때
		$(document).on("submit", "#replyUpdateForm", function(e) {
			if($("#replyContent").val().length < 5) {
				alert("댓글은 5자 이상입니다.");
				return false;
			}
			
			$replyForm = $("#replyForm").slideUp(300);
			
			let params = $(this).serialize() + "&no=" + $("this").attr("data-no");
			console.log(params);
			
			$.ajax({
				url:"replyUpdate.ajax", data:params, type:"post", "dataType":"json", 
				success:function(resData, status, xhr) { // ajax 통신이 성공하고 데이터까지 파싱이 완료되었을 때 호출되는 콜백
					// console.log(resData);
				// 기존의 내용을 화면에서 삭제
				$("#replyList > .col").empty();
				$.each(resData, function(index, data) {
					
					let date = new Date(data.regDate);
					let strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) ? "0" + date.getMonth() + 1 : date.getMonth() + 1)
															+ ((date.getDate() < 10) ? "0" + date.getDate() : date.getDate()) + ""
															+ ((date.getHours() < 10) ? "0" + date.getHours() : date.getHours()) + " : "
															+ ((date.getMinutes() < 10) ? "0" + date.getMinutes() : date.getMinutes()) + " : "
															+ ((date.getSeconds() < 10) ? "0" + date.getSeconds() : date.getSeconds());
					
					let result = 
					'<div class="replyRow row border border-top-0">'
					 +'<div class="col">'
					 +	'<div class="row p-2 bg-light">'
					 +		'<div class="col-4">'
					 +			'<span>' + data.replyWriter + '</span>'
					 +		'</div>'
					 +		'<div class="col-8 text-end">'
					 +			'<span class="me-3">' + strDate + '</span>'
					 +			'<button data-no="' + data.no + '" class="modifyReply btn btn-outline-success btn-sm">'
					 +				'<i class="bi bi-journal-text">수정</i>'
					 +			'</button>' 
					 +			'<button data-no="' + data.no + '" class="deleteReply btn btn-outline-warning btn-sm">'
					 +				'<i class="bi bi-journal-text">삭제</i>'
					 +			'</button>' 
					 +			'<button onclick="reportReply(\'' + data.no + '\');"class="btn btn-outline-danger btn-sm">'
					 +				'<i class="bi bi-journal-text">신고</i>'
					 +			'</button>'
					 +		'</div>'
					 +	'</div>'
					 +	'<div class="row">'
					 +		'<div class="col p-3">'
					 +			'<pre>' + data.replyContent + '</pre>'
					 +		'</div>'
					 +	'</div>'
					 +'</div>'
					+'</div>';
					
					$("#replyList > .col").append(result);
					
				}); // end $.each()
				
				// 댓글 수정하기가 완료되면 백업한 폼을 원래 자리에 다시 넣는다.
				$("#replyForm").val("");
				$replyForm.css("display", "none");
				$("#global-content>div.col-10").append($replyForm);
				
			}, 
				error:function(xhr, status) { // ajax 통신시 오류 발생할 때 호출 되는 콜백
					console.log("error : ", status);
				}
			});
			
			return false;
		});
	
	
	$(document).on("click", ".modifyReply", function() {
		
		let $replyRow = $(this).parents(".replyRow");
		
		console.log($("#replyForm").css("display"));
		console.log($("#replyForm").is(":visible"));
		
		if($("#replyForm").is(":visible")) { // 폼이 현재 보이고 있는 상태
			
			// $("#replyForm").slideUp(300);
			
			// 현재 폼이 보이고 있는 버튼이 아닐 때만 동작
			if(!$replyRow.next().is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			
			setTimeout(function() {
				$("#replyForm").insertAfter($replyRow).slideDown(300);
			}, 300);
			
		} else { // 폼이 현재 화면에 보이지 않는 상태 처리
			// 형제 요소의 앞 뒤로 이동
			$("#replyForm").insertAfter($replyRow).removeClass("d-none").css({"display":"none"}).slideDown(300);
		}
		
		$("#replyForm").find("form").attr({"id":"replyUpdateForm", "data-no": $(this).attr("data-no")});
		$("#replyWriteButton").val("댓글수정");
		
		let reply = $(this).parent().parent().next().find("pre").text();
		$("#replyContent").val($.trim(reply));
		
	});
	
	$(".btnCommend").click(function() {
		let com = $(this).attr("id");
		
		$.ajax({
			url:"recommend.ajax", type:"post", data:{recommend:com, no:$("#no").val()}, dataType:"json", 
			success:function(resData) {
				console.log(resData.recommend, " : " + resData.thank);
				
				let msg = com == 'commend' ? "추천이" : "땡큐가";
				alert(msg + " 반영 되었습니다.");
				
				$("#commend>.recommend").text("(" + resData.recommend + ")");
				$("#thank>.recommend").text("(" + resData.thank + ")");
				
			}, 
			error:function(xhr, status, err) {
				console.log("error : ", status, "-", err);
			}
		});
	});
});


function reportReply(replyNo) {
	let result = confirm("이 댓글을 신고시겠습니까?");
	if(result) {
		alert("신고 기능으로 연결...");
	}
}