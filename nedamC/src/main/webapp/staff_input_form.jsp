<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script>
		// 동기처리 방법
		function fncAddStaff(){
			
			var staffName = $("#staffName").val();
			var searchGender = $("#searchGender").val();
			var searchGender2 = $("#searchGender2").val();
			var codeDepartment = $("#codeDepartment").val();
			var codeSchool = $('input:checkbox[name="codeSchool.schoolCode"]').val();
			
			var dateStart1 = $("#dateStart1").val();
			var dateStart2 = $("#dateStart2").val();
			var dateStart3 = $("#dateStart3").val();
			
			var skillCode = [];
			$("input[name=skillCode]:checked").each(function(){
				skillCode.push($(this).val());
			});
			
			
			
			if(staffName == null || staffName == ""){
				alert("이름을 입력해주세요.")
				return;
			}
			
			if(searchGender == "" || searchGender == null && searchGender2 == "" || searchGender2 == null) { 
	              alert("주민등록번호 13자리를 적어주세요."); 
	              return; 
	      	}
		    
		    if (searchGender.length != 6) { 
	              alert("주민등록번호 앞자리를 다시 입력하세요."); 
	              return; 
	      	}		    		

		    if (searchGender2.length != 7) { 
	              alert("주민등록번호 뒷자리를 다시 입력하세요."); 
	              return; 
	      	}		 
		    
			if(codeDepartment == null || codeDepartment == ""){
				alert("부서를 선택해주세요.")
				return;
			}
			if(codeSchool == null || codeSchool == ""){
				alert("학력을 선택해주세요.")
				return;
			}
			if(skillCode == null || skillCode == ""){
				alert("하나 이상의 스킬을 선택해주세요.")
				return;
			}
			if(dateStart1 = null || dateStart1 == ""){
				alert("년도를 입력해주세요.")
				return;
			}
			if(dateStart2 = null || dateStart2 == ""){
				alert("월를 입력해주세요.")
				return;
			}
			if(dateStart3 = null || dateStart3 == ""){
				alert("일자를 입력해주세요.")
				return;
			}
			
			alert("등록이 완료되었습니다.");
			

			$("form[name='addStaff']").attr("method", "POST").attr("action", "/staff/addStaff").submit();
			
		}
		
		$(document).ready(function(){ 
			var now = new Date(); 
			var year = now.getFullYear();  
			var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 
			//년도 selectbox만들기 
			for(var i = 1990 ; i <= year ; i++) { 
				$('#year').append('<option value="' + i + '">' + i + '년</option>'); 
			} 
			// 일별 selectbox 만들기 
			for(var i=1; i <= 31; i++) { 
				var dd = i > 9 ? i : "0"+i ; 
				$('#day').append('<option value="' + dd + '">' + dd+ '일</option>'); 
			} 
			$("#year > option[value='']").attr("selected", "true"); 
			$("#day > option[value='']").attr("selected", "true"); 
		})	    


	
		$(function(){
			
			
			// 비동기처리 동기처리를 하여 팝업창을 종료하려고 하면 데이터가 전송이 안 되는 상황이 있었다.
			// 비동기식으로 처리하면 데이터를 전송하며 팝업창도 종료할 수 있다.
			$("button[name='input']").on("click" , function(){			
				
				var staffName = $("#staffName").val();
				var searchGender = $("#searchGender").val();
				var searchGender2 = $("#searchGender2").val();
				var codeDepartment = $("#codeDepartment").val();
				var codeSchool = $('input:checkbox[name="codeSchool.schoolCode"]').val();
				
				var dateStart1 = $("#dateStart1").val();
				var dateStart2 = $("#dateStart2").val();
				var dateStart3 = $("#dateStart3").val();
				
				var addStaff = $("form[name=addStaff]").serialize();
				
				var skillCode = [];
				$("input[name=skillCode]:checked").each(function(){
					skillCode.push($(this).val());
				});
				
				if(staffName == null || staffName == ""){
					alert("이름을 입력해주세요.")
					return;
				}
				
				if(searchGender == "" || searchGender == null && searchGender2 == "" || searchGender2 == null) { 
		              alert("주민등록번호 13자리를 적어주세요."); 
		              return; 
		      	}
			    
			    if (searchGender.length != 6) { 
		              alert("주민등록번호 앞자리를 다시 입력하세요."); 
		              return; 
		      	}		    		

			    if (searchGender2.length != 7) { 
		              alert("주민등록번호 뒷자리를 다시 입력하세요."); 
		              return; 
		      	}		 
			    
				if(codeDepartment == null || codeDepartment == ""){
					alert("부서를 선택해주세요.")
					return;
				}
				if(codeSchool == null || codeSchool == ""){
					alert("학력을 선택해주세요.")
					return;
				}
				if(skillCode == null || skillCode == ""){
					alert("하나 이상의 스킬을 선택해주세요.")
					return;
				}
							
				
				$.ajax({
	  			 	 url : "/staff/json/addStaff/",
		  		  	 type : "POST",
		  		  	 data : addStaff,
	  		  	 	 dataType : "json",
	    		 	 success : function(JSONData, status){
	  		  	 	 } 	 	 
		  		});
				alert("등록이 완료되었습니다.");
				opener.document.location.reload();
				self.close();
				
			});
			
			

			$("button[name='reset']").on("click" , function(){
				location.href="/staff_input_form.jsp"
			});		
			
			
		})
				
			
		
		
	</script>
	
</head>
<body>
<div class="container">

	<table border="1" width ="1000" height="100" align = "center" >
		
		    <tr align ="center" style="background-color:gray;">
				<p><td colspan = "6">사원 정보 등록</td></p>
		    </tr>
		<form class="form-inline" name="addStaff">
		  <div class="form-group">
				    <tr align = "center" >
						<td style="background-color:gray;">
							이름
						</td>
						<td>
							<input type="text" name="staffName" id="staffName" value="${! empty staffName ? staffName : ""}" size = "6" maxlength = "6">
						</td>
						<td style="background-color:gray;">주민번호</td>
						<td>
							<label><input type="text" name="searchGender" id="searchGender" ></label>
							-
							<label><input type="text" name="searchGender2"id="searchGender2" ></label>
						</td>
						<td style="background-color:gray;">부서</td>
						<td align="center">
							<select name="codeDepartment.departmentCode" id="codeDepartment" style="width:100px" align="center">
								<option></option>
								<option value="1">컨설팅사업부</option>
								<option value="2">하이테크사업부</option>
								<option value="3">si사업부</option>
								<option value="4">반도체사업부</option>
								<option value="5">기업부설연구소</option>
								<option value="6">전략기획팀</option>
								<option value="7">경영지원팀</option>
							</select>
						</td>
				    </tr>
				    <tr align = "center">
						<td style="background-color:gray;">학력</td>
						<td>
							<input type="checkbox" name="codeSchool.schoolCode" value="1" >고졸
							<input type="checkbox" name="codeSchool.schoolCode" value="2" >전문대졸
							<input type="checkbox" name="codeSchool.schoolCode" value="3" >일반대졸
						</td>
						<td style="background-color:gray;">기술</td>
						<td colspan="3">
							<label><input type="checkbox" name="skillCode" value="1">Java</label>
							<label><input type="checkbox" name="skillCode" value="2">JSP</label>
							<label><input type="checkbox" name="skillCode" value="3">ASP</label>
							<label><input type="checkbox" name="skillCode" value="4">PHP</label>
							<label><input type="checkbox" name="skillCode" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td style="background-color:gray;">졸업일</td>
						<td colspan="5">
   						    <label>
					     	<select name="dateStart1" id="year">
					     		<option></option>
					     	</select>
						      년
						    </label>
						    <label>
						      <select name="dateStart2" id="month">
						      	<option></option>
						      	<option>02</option>
						      	<option>08</option>
						      </select>
						      월
						    </label>						    						
						    <label>
						     	<select name="dateStart3" id="day">
						     		<option></option>
						     	</select>
						      일 ~
						    </label>
						</td>
				    </tr>
		  </div>
		</form>
	</table>
	<div align = "center">
		<button type="button" name="input" style="width: 90px;">등록</button>	
		<button type="button" name="reset" style="width: 90px;">초기화</button>
	</div>

</body>
</html>