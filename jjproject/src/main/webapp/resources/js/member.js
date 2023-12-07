function findZipcode() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
            	addr = data.roadAddress;
                // addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                addr += extraAddr;
            
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#zipcode").val(data.zonecode);
            $("#address1").val(addr);
            // 커서를 상세주소 필드로 이동한다.
            $("#address2").focus();
        }
    }).open();
}

function inputCharReplace() {
	let regExp = /[^A-Za-z0-9]/gi;
	
	// 입력 값이 숫자 또는 영문자인지 판단 - 정규표현식
	if(regExp.test($(this).val())) {
		alert("영문 대소문자와 숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

function inputEmailDomainReplace() {
	let regExp = /^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$/gi;
	
	if(regExp.test($(this).val())) {
		alert("영문 대소문자와 숫자만 입력할 수 있습니다.");
		$(this).val($(this).val().replace(regExp, ""));
	}
}

function joinFormCheck(elem) {
	if($("#id").val().length == 0) {
		alert("아이디를 입력해 주세요");
		return false;
	}
	if($("#name").val().length == 0) {
		alert("이름을 입력해 주세요");
		return false;
	}
}

// DOM이 준비되면

/*$(function() {
	$("#memberUpdateForm").on("submit", function() {
		// 비밀번호 확인했는지 체크
		if(!$("#btnPassCheck").prop("disabled")) {
			alert("먼저 비밀번호 확인을 해주세요");
			return false;
		}
		
		return joinFormCheck(this);
	});
});*/

$(function() {
	
	$("#joinForm").on("submit", function() {
		
		let regExp = /^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$/gi;
		
		if($("#name").val().length <= 0) {
			alert("이름을 입력해 주세요.");
			
			return false;
		}
		if($("#id").val().length <= 0) {
			alert("아이디를 입력해 주세요.");
			
			return false;
		}
		if($("#pass1").val().length <= 0) {
			alert("비밀번호를 입력해 주세요.");
			
			return false;
		}
		if($("#zipcode").val().length <= 0) {
			alert("우편번호를 입력해 주세요.");
			
			return false;
		}
		if($("#email").val().length <= 0) {
			alert("이메일을 입력해 주세요.");
			
			return false;
		}
		
		if(regExp.test($("#email").val())) {
			alert("asgag");
			
			return false;
		}
		
		if($("#phone").val().length <= 0) {
			alert("전화번호를 입력해 주세요.");
			
			return false;
		}
		
		alert("회원가입에 성공했습니다.");
		
	});
	
	$("#btnPassCheck").on("click", function() {
		
		let id = $("#id").val();
		let pass = $("#oldPass").val();
		
		if(pass.length == 0) {
			alert("기존 비밀번호를 입력해 주세요");
			return;
		}
		
		let data = "id=" + id + "&pass=" + pass;
		
		$.ajax({
			"url" : "passCheck.ajax", "data" : data, "type" : "post", "dataType" : "json", "success" : function(resData) {
			console.log(resData.result);
			// 비밀번호가 맞으면
			if(resData.result) {
				alert("비밀번호가 확인 되었습니다.");
				$("#btnPassCheck").prop("disabled", true);
				$("#oldPass").prop("readonly", true);
				$("#btnZipcode").focus();
			} else { // 비밀번호가 틀리면
				alert("비밀번호가 틀립니다.");
				$("#oldPass").val("").focus();
			}
			
			
		}, "error" : function(xhr, statusText, err) {
			console.error("error ....");
		}
		});
	});
	
$("#btnZipcode").on("click", findZipcode);
	
	$("#pass1").on("keyup", inputCharReplace);
	$("#pass2").on("keyup", inputCharReplace);
	
	$("#id").on("keyup", function() {
		
		let id = $(this).val();
		let regExp = /[^A-Za-z0-9]/gi;
		
		// 입력 값이 숫자 또는 영문자인지 판단 - 정규표현식
		if(regExp.test(id)) {
			alert("영문 대소문자와 숫자만 입력할 수 있습니다.");
			$(this).val($(this).val().replace(regExp, ""));
		}
	});
	
	$("#btnIdCheckClose").on("click", (e) => {
		let id = $(e.target).attr("data-id-value");
		opener.document.joinForm.id.value = id;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	});
	
	$("#idCheckForm").submit(() => {
		let id = $("#checkId").val();
		
		if(id.length == 0) {
			alert("아이디를 입력해 주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디를 5자 이상 입력해주세요");
			return false;
		}
	});
	
	// 회원 아이디 중복 확인 버튼이 클릭되면
	$("#btnOverlapId").on("click", () => {
		let id = $("#id").val();
		url = "overlapIdCheck?id=" + id;
		if(id.length == 0) {
			alert("아이디를 입력해 주세요");
			return false;
		}
		
		if(id.length < 5) {
			alert("아이디를 5자 이상 입력해주세요");
			return false;
		}
		
		window.open(url, "idCheck", "toolbar=no, location=no, status=no, menubar=no, width=400, height=400");
		
	});
	
	$("#loginForm").submit(() => {
		var id = $("#userId").val();
		var pass = $("#userPass").val();
		
		if(id.length <= 0) {
			alert("아이디가 입력되지 않았습니다.");
			$("#userId").focus();
			return false;
		}
		
		if(pass.length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.");
			$("#userPass").focus();
			return false;
		}
	});
	
});