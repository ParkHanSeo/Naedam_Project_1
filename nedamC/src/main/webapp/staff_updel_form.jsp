<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script>
		function fncUpdateStaff(){
			
			var updateStaff = $("form[name=updateStaff]").serialize();
			var skillCode = [];
			$("input[name=skillCode]:checked").each(function(){
				skillCode.push($(this).val());
			});
			
			
			$.ajax({
 			 	 url : "/staff/updateStaff",
	  		  	 type : "POST",
	  		  	 data : updateStaff,
 		  	 	 dataType : "json",
   		 	 success : function(JSONData, status){
   		 		
   		 	 } 	 	 
	  		});
			 alert("수정이 완료되었습니다.")
			 window.close();
			
			$('form').attr("method", "POST").attr("action", "/staff/updateStaff").submit();
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
			
			$("button[name='update']").on("click" , function(){
				fncUpdateStaff();
			});

			$("button[name='delete']").on("click" , function(){
				

				if(!confirm("정말 삭제 하시겠습니까?")){
					alert("취소 되었습니다.");
					return;
				}else{
					var searchGender = $("input[name='searchGender']").val();
					var searchGender2 = $("input[name='searchGender2']").val();
					
					$.ajax({
						url : "/staff/deleteStaff?searchGender="+searchGender+"&searchGender2="+searchGender2,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"	 						
	 					} ,
						success : function(JSONData, status){
		   					
		   				}
	 					
					})
					alert("삭제 되었습니다.");
					opener.document.location.reload();
 					window.close();
					
				}
				
			});				
			


			
		})
	</script>
	
</head>
<body>
<div class="container">

	<table border="1" width ="1000" height="100" align = "center" >
		
		    <tr align ="center" style="background-color:gray;">
				<p><td colspan = "6">사원 정보 수정</td></p>
		    </tr>
		<form class="form-inline" name="updateStaff">
		  <div class="form-group">
				    <tr align = "center" >
						<td style="background-color:gray;">
							이름
						</td>
						<td>
							<input type="text" name="staffName" value="${staff.staffName}" size = "6" maxlength = "6">
						</td>
						<td style="background-color:gray;">주민번호</td>
						<td>
							<c:set var="jumin" value="${staff.juminNo}"/>
								<label><input type="text" name="searchGender" value="${fn:substring(jumin,0,6) }" ></label>
								-
								<label><input type="text" name="searchGender2" value="${fn:substring(jumin,7,14) }"></label>
						</td>
						<td style="background-color:gray;">부서</td>
						<td align="center">
							<select name="codeDepartment.departmentCode" id="codeDepartment" style="width:100px" align="center">
								
								<c:if test="${!empty staff.codeDepartment.departmentCode}">
									<c:choose>
										<c:when test="${staff.codeDepartment.departmentCode eq '1'}">
											<option value="1">컨설팅사업부</option>
										</c:when>
										<c:when test="${staff.codeDepartment.departmentCode eq '2'}">
											<option value="2">하이테크사업부</option>
										</c:when>
										<c:when test="${staff.codeDepartment.departmentCode eq '3'}">
											<option value="3">si사업부</option>
										</c:when>
										<c:when test="${staff.codeDepartment.departmentCode eq '4'}">
											<option value="4">반도체사업부</option>
										</c:when>
										<c:when test="${staff.codeDepartment.departmentCode eq '5'}">
											<option value="5">기업부설연구소</option>
										</c:when>
										<c:when test="${staff.codeDepartment.departmentCode eq '6'}">
											<option value="6">전략기획팀</option>
										</c:when>
										<c:when test="${staff.codeDepartment.departmentCode eq '7'}">
											<option value="7">경영지원팀</option>
										</c:when>											
									</c:choose>
								</c:if>
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
							<input type="checkbox" name="codeSchool.schoolCode" id="schoolCode" value="1" ${staff.codeSchool.schoolCode eq '1' ? 'CHECKED' : '' }>고졸
							<input type="checkbox" name="codeSchool.schoolCode" id="schoolCode" value="2" ${staff.codeSchool.schoolCode eq '2' ? 'CHECKED' : '' }>전문대졸
							<input type="checkbox" name="codeSchool.schoolCode" id="schoolCode" value="3" ${staff.codeSchool.schoolCode eq '3' ? 'CHECKED' : '' }>일반대졸
						</td>
						<td style="background-color:gray;">기술</td>
						<td colspan="3">
								
									<label><input type="checkbox" id="skillCode1" name="skillCode" value="1" ${skillCode1 eq '1' ? 'CHECKED' : '' }>Java</label>
									<label><input type="checkbox" id="skillCode2" name="skillCode" value="2" ${skillCode2 eq '2' ? 'CHECKED' : '' }>JSP</label>
									<label><input type="checkbox" id="skillCode3" name="skillCode" value="3" ${skillCode3 eq '3' ? 'CHECKED' : '' }>ASP</label>
									<label><input type="checkbox" id="skillCode4" name="skillCode" value="4" ${skillCode4 eq '4' ? 'CHECKED' : '' }>PHP</label>
									<label><input type="checkbox" id="skillCode5" name="skillCode" value="5" ${skillCode5 eq '5' ? 'CHECKED' : '' }>Delphi</label>
						</td>
				    </tr>
				    <tr align = "center" >
						<td style="background-color:gray;">졸업일</td>
						<td colspan="5">
							<c:set var="graduateDay" value="${staff.graduateDay}"/>
						    <label>
						     	<select name="dateStart1" id="year">
						     		<option>${fn:substring(graduateDay,0,4)}</option>
						     	</select>
						      년
						    </label>
						    <label>
						      <select name="dateStart2" >
						      	<option>${fn:substring(graduateDay,5,7)}</option>
						      	<option>02</option>
						      	<option>08</option>
						      </select>
						      월
						    </label>						    						
						    <label>
						     	<select name="dateStart3" id="day">
						     		<option>${fn:substring(graduateDay,8,10)}</option>
						     	</select>
						      일
						    </label>
							<input type="hidden" id="graduate" name="graduate" value="${fn:substring(graduateDay,6,7)}" >
						</td>
				    </tr>
		  </div>
		</form>
	</table>
	<div align = "center">
		<button type="button" name="update" style="width: 90px;">수정</button>	
		<button type="button" name="delete" style="width: 90px;">삭제</button>
	</div>

</body>
</html>