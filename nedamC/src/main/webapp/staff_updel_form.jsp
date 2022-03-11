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
			$('form').attr("method", "POST").attr("action", "/staff/updateStaff").submit();
		}				
	
	
		$(function(){
			
			$("button[name='update']").on("click" , function(){
				fncUpdateStaff();
			});

			$("button[name='delete']").on("click" , function(){
				
				var searchGender = $("input[name='searchGender']").val();
				var searchGender2 = $("input[name='searchGender2']").val();
				
				alert(searchGender);
				alert(searchGender2);
				
				if(!confirm("���� ���� �Ͻðڽ��ϱ�?")){
					alert("��� �Ǿ����ϴ�.");
					return;
				}else{
					alert("���� �Ǿ����ϴ�.");
					location.href="/staff/deleteStaff?searchGender="+searchGender+"&searchGender2="+searchGender2;
				}
				
			});				
			


			
		})
	</script>
	
</head>
<body>
<div class="container">

	<table border="1" width ="1000" height="100" align = "center" >
		
		    <tr align ="center" color="gray">
				<p><td colspan = "6">��� ���� �˻�</td></p>
		    </tr>
		<form class="form-inline" name="updateStaff">
		  <div class="form-group">
				    <tr align = "center" >
						<td>
							�̸�
						</td>
						<td>
							<input type="text" name="staffName" value="${staff.staffName}" size = "6" maxlength = "6">
						</td>
						<td>�ֹι�ȣ</td>
						<td>
							<c:set var="jumin" value="${staff.juminNo}"/>
								<label><input type="text" name="searchGender" value="${fn:substring(jumin,0,6) }" ></label>
								-
								<label><input type="text" name="searchGender2" value="${fn:substring(jumin,7,14) }"></label>
						</td>
						<td>�μ�</td>
						<td align="center">
							<select name="codeDepartment.departmentCode" id="codeDepartment" style="width:100px" align="center">
								<option>
									<c:if test="${!empty staff.codeDepartment.departmentCode}">
										<c:choose>
											<c:when test="${staff.codeDepartment.departmentCode eq '1'}">
												�����û����
											</c:when>
											<c:when test="${staff.codeDepartment.departmentCode eq '2'}">
												������ũ�����
											</c:when>
											<c:when test="${staff.codeDepartment.departmentCode eq '3'}">
												�����
											</c:when>
											<c:when test="${staff.codeDepartment.departmentCode eq '4'}">
												�ݵ�ü�����
											</c:when>
											<c:when test="${staff.codeDepartment.departmentCode eq '5'}">
												����μ�������
											</c:when>
											<c:when test="${staff.codeDepartment.departmentCode eq '6'}">
												������ȹ��
											</c:when>
											<c:when test="${staff.codeDepartment.departmentCode eq '7'}">
												�濵������
											</c:when>											
										</c:choose>
									</c:if>
								</option>
								<option></option>
								<option value="1">�����û����</option>
								<option value="2">������ũ�����</option>
								<option value="3">si�����</option>
								<option value="4">�ݵ�ü�����</option>
								<option value="5">����μ�������</option>
								<option value="6">������ȹ��</option>
								<option value="7">�濵������</option>
							</select>
						</td>
				    </tr>
				    <tr align = "center">
						<td>�з�</td>
						<td>
							<input type="checkbox" name="codeSchool.schoolCode" id="schooCode" value="1" >����
							<input type="checkbox" name="codeSchool.schoolCode" id="schooCode" value="2" >��������
							<input type="checkbox" name="codeSchool.schoolCode" id="schooCode" value="3" >�Ϲݴ���
						</td>
						<td>���</td>
						<td colspan="3">
							<label><input type="checkbox" id="skillCode1" name="skillCode" value="1">Java</label>
							<label><input type="checkbox" id="skillCode2" name="skillCode" value="2">JSP</label>
							<label><input type="checkbox" id="skillCode3" name="skillCode" value="3">ASP</label>
							<label><input type="checkbox" id="skillCode4" name="skillCode" value="4">PHP</label>
							<label><input type="checkbox" id="skillCode5" name="skillCode" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td>������</td>
						<td colspan="5">
							<c:set var="graduateDay" value="${staff.graduateDay}"/>
						    <label>
						     	<input type="text" name="dateStart1" size = "6" maxlength = "6" value="${fn:substring(graduateDay,0,4) }" >
						      ��
						    </label>
						    <label>
						      <select name="dateStart2" >
						      	<option>${fn:substring(graduateDay,6,7) }</option>
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
						      ��
						    </label>						    						
						    <label>
						     	<input name="dateStart3" size = "6" maxlength = "6" value="${fn:substring(graduateDay,8,10) }" >
						      ��
						    </label>
						    
						</td>
				    </tr>
		  </div>
		</form>
	</table>
	<div align = "center">
		<button type="button" name="update" style="width: 90px;">����</button>	
		<button type="button" name="delete" style="width: 90px;">����</button>
	</div>

</body>
</html>