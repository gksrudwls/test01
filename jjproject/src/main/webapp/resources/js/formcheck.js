$(function() {
	
	const clock1 = document.querySelector(".clock1"); 
	const clock2 = document.querySelector(".clock2"); 
	const clock3 = document.querySelector(".clock3"); 
	const clock4 = document.querySelector(".clock4"); 
	const clock5 = document.querySelector(".clock5"); 
	const clock6 = document.querySelector(".clock6"); 


	
	// 매 초마다 나머지 시간을 업데이트하는 함수
	function updateRemainingTime() {
	    // 현재 날짜와 시간 가져오기
	    const currentDate = new Date();

	    let rg1 = $("#rg1").text();	    
	    let rg2 = $("#rg2").text();	    
	    let rg3 = $("#rg3").text();	    
	    let rg4 = $("#rg4").text();	    
	    let rg5 = $("#rg5").text();	    
	    let rg6 = $("#rg6").text();	    
	    
	    // 마감일 설정 (여기에 특정 마감일을 넣어주세요)
	    const deadlineDate1 = new Date(rg1);
	    const deadlineDate2 = new Date(rg2);
	    const deadlineDate3 = new Date(rg3);
	    const deadlineDate4 = new Date(rg4);
	    const deadlineDate5 = new Date(rg5);
	    const deadlineDate6 = new Date(rg6);

	    // 초로 나타낸 나머지 시간 계산
	    const remainingTimeInSeconds1 = Math.floor((deadlineDate1 - currentDate) / 1000);
	    const remainingTimeInSeconds2 = Math.floor((deadlineDate2 - currentDate) / 1000);
	    const remainingTimeInSeconds3 = Math.floor((deadlineDate3 - currentDate) / 1000);
	    const remainingTimeInSeconds4 = Math.floor((deadlineDate4 - currentDate) / 1000);
	    const remainingTimeInSeconds5 = Math.floor((deadlineDate5 - currentDate) / 1000);
	    const remainingTimeInSeconds6 = Math.floor((deadlineDate6 - currentDate) / 1000);

	    // 시간, 분, 초 계산
	    const hours1 = Math.floor(remainingTimeInSeconds1 / 3600);
	    const minutes1 = Math.floor((remainingTimeInSeconds1 % 3600) / 60);
	    const seconds1 = remainingTimeInSeconds1 % 60;
	    
	    const hours2 = Math.floor(remainingTimeInSeconds2 / 3600);
	    const minutes2 = Math.floor((remainingTimeInSeconds2 % 3600) / 60);
	    const seconds2 = remainingTimeInSeconds2 % 60;

	    const hours3 = Math.floor(remainingTimeInSeconds3 / 3600);
	    const minutes3 = Math.floor((remainingTimeInSeconds3 % 3600) / 60);
	    const seconds3 = remainingTimeInSeconds3 % 60;
	    
	    const hours4 = Math.floor(remainingTimeInSeconds4 / 3600);
	    const minutes4 = Math.floor((remainingTimeInSeconds4 % 3600) / 60);
	    const seconds4 = remainingTimeInSeconds4 % 60;
	    
	    const hours5 = Math.floor(remainingTimeInSeconds5 / 3600);
	    const minutes5 = Math.floor((remainingTimeInSeconds5 % 3600) / 60);
	    const seconds5 = remainingTimeInSeconds5 % 60;
	    
	    const hours6 = Math.floor(remainingTimeInSeconds6 / 3600);
	    const minutes6 = Math.floor((remainingTimeInSeconds6 % 3600) / 60);
	    const seconds6 = remainingTimeInSeconds6 % 60;
	    

	    // 나머지 시간을 표시
	    clock1.innerText = hours1 + ' : ' + minutes1 + ' : ' + seconds1;
	    clock2.innerText = hours2 + ' : ' + minutes2 + ' : ' + seconds2;
	    clock3.innerText = hours3 + ' : ' + minutes3 + ' : ' + seconds3;
	    clock4.innerText = hours4 + ' : ' + minutes4 + ' : ' + seconds4;
	    clock5.innerText = hours5 + ' : ' + minutes5 + ' : ' + seconds5;
	    clock6.innerText = hours6 + ' : ' + minutes6 + ' : ' + seconds6;
	}

	// 초기에 나머지 시간 업데이트
	updateRemainingTime();

	// 매 초마다 나머지 시간 업데이트
	setInterval(updateRemainingTime, 1000);
	
	
	$("#biddingBtn").on("click", function() {
	    if ($("#isLogin").val() != "true") {
	        alert("로그인 후 이용하세요");
	    } else {
	        let currentPrice = parseFloat($("#price").val());
	        let message = prompt("희망 가격을 입력해주세요", "");

	        if (!isNaN(message) && message.trim() !== "") {
	            let bidPrice = parseFloat(message);

	            if (bidPrice > currentPrice) {
	                $("#price").val(bidPrice);
	                alert("희망 가격이 " + bidPrice + "으로 업데이트되었습니다.");
	            } else {
	                alert("입력한 가격이 현재 가격보다 낮습니다. 높은 가격을 입력해 주세요.");
	            }
	        } else {
	            alert("정확한 가격을 입력해 주세요");
	        }
	    }
	});



	
	$("#myListBtn").on("click", function() {
		if($("#isLogin").val() != "true") {
			alert("로그인 후 이용하세요");
		} else {
			location.href="myList";
		}
	});
	
	$("#writeBtn").on("click", function() {
		if($("#isLogin").val() != "true") {
			alert("로그인 후 이용하세요");
		} else {
			location.href="writeForm";
		}
	});
	
	$("#deleteBtn").on("click", function() {
		
		if($("#memberId").val() != $("#loginId").val()) {
			alert("작성자만 삭제 가능합니다.");
		} else {
			if(confirm("바로 삭제 하시겠습니까?")) {
				location.href="deleteProduct?no=" + $("#no").val();
			} else {
				alert("취소되었습니다.");
			}
		}
	});
	
	$("#updateBtn").on("click", function() {
			
			if($("#memberId").val() != $("#loginId").val()) {
				alert("작성자만 수정 가능합니다.");
			} else {
				if(confirm("바로 수정 하시겠습니까?")) {
					location.href="productUpdate?no=" + $("#no").val();
				} else {
					alert("취소되었습니다.");
				}
			}
		});
	
	$("#detailUpdate").on("click", function() {
		let pass = $("#pass").val();
		if(pass.length <= 0) {
			alert("비밀번호를 입력해 주세요");
			return false;
		}
		
		$("#rPass").val(pass);
		$("#checkForm").attr("action", "update");
		$("#checkForm").submit();
		
	});
	
	// 게시 글 수정 폼이 서브밋 될 때 유효성 검사	
	$("#updateForm").on("submit", function() {
		
		if($("#writer").val().length <= 0 ) {
			alert("작성자를 입력해 주세요");
			$("#writer").focus();
			return false;
		}
		
		if(("#title").val().length <= 0) {
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}
		
		if(("#pass").val().length <= 0) {
			alert("비밀번호를 입력해 주세요");
			$("#pass").focus();
			return false;
		}
		
		if(("#content").val().length <= 0) {
			alert("내용을 입력해 주세요");
			$("#content").focus();
			return false;
		}		
		
	});	
	
	// 게시 글 쓰기 폼이 서브밋 될 때 유효성 검사	
	$("#writeForm").on("submit", function() {
		
		if(("#file1").val().length <= 0) {
			alert("파일을 업로드 주세요");
			$("#file1").focus();
			return false;
		}
		
		if(("#price").val().length <= 0) {
			alert("가격을 입력해 주세요");
			$("#price").focus();
			return false;
		}
		
		if(("#regDate").val().length <= 0) {
			alert("날짜를 입력해 주세요");
			$("#regDate").focus();
			return false;
		}
		
		if(("#title").val().length <= 0) {
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}
		
		if(("#content").val().length <= 0) {
			alert("내용을 입력해 주세요");
			$("#content").focus();
			return false;
		}	
		
		$("#regDate").val($("#regDate").val() + " 00:00:00.0");
		
		alert($("#regDate").val());
		
	});
	
});