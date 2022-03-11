<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<script>
		
		$(function(){
			
			$("button[name='update']").on("click" , function(){
				location.href="/staff/updateStaff"
			});

			$("button[name='delete']").on("click" , function(){
				location.href="/staff/deleteStaff"
			});				
			
		})
	</script>
	
</head>
<body>
<div class="container">

	<table border="1" width ="1000" height="100" align = "center" >
		
		    <tr align ="center" color="gray">
				<p><td colspan = "6">사원 정보 검색</td></p>
		    </tr>
		<form class="form-inline" name="updateStaff">
		  <div class="form-group">
				    <tr align = "center" >
						<td>
							이름
						</td>
						<td>
							<input type="text" name="staffName" value="${! empty staffName ? staffName : ""}" size = "6" maxlength = "6">
						</td>
						<td>주민번호</td>
						<td>
							<label><input type="text" name="searchGender"></label>
							-
							<label><input type="text" name="searchGender2"></label>
						</td>
						<td>부서</td>
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
						<td>학력</td>
						<td>
							<input type="checkbox" name="codeSchool.schoolCode" id="schooCode" value="1" >고졸
							<input type="checkbox" name="codeSchool.schoolCode" id="schooCode" value="2" >전문대졸
							<input type="checkbox" name="codeSchool.schoolCode" id="schooCode" value="3" >일반대졸
						</td>
						<td>기술</td>
						<td colspan="3">
							<label><input type="checkbox" id="skillCode" name="skillCode" value="1">Java</label>
							<label><input type="checkbox" id="skillCode" name="skillCode" value="2">JSP</label>
							<label><input type="checkbox" id="skillCode" name="skillCode" value="3">ASP</label>
							<label><input type="checkbox" id="skillCode" name="skillCode" value="4">PHP</label>
							<label><input type="checkbox" id="skillCode" name="skillCode" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td>졸업일</td>
						<td colspan="5">
						    <label>
						     	<input type="text" name="dateStart1" size = "6" maxlength = "6">
						      년
						    </label>
						    <label>
						      <select name="dateStart2">
						      	<option></option>
						        <option value="01">1</option>
						        <option value="02">2</option>
						        <option value="03">3</option>
						        <option value="04">4</option>
						        <option value="05">5</option>
						        <option value="06">6</option>
						        <option value="07">7</option>
						        <option value="08">8</option>
						        <option value="09">9</option>
						        <option value="10">10</option>
						        <option value="11">11</option>
						        <option value="12">12</option>
						      </select>
						      월
						    </label>						    						
						    <label>
						     	<input name="dateStart3" size = "6" maxlength = "6">
						      일
						    </label>
						    
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