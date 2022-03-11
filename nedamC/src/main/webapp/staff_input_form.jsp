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
			alert(skillCode);
			
			
			if(staffName == null || staffName == ""){
				alert("�̸��� �Է����ּ���.")
				return;
			}
			
			if(searchGender == "" || searchGender == null && searchGender2 == "" || searchGender2 == null) { 
	              alert("�ֹε�Ϲ�ȣ 13�ڸ��� �����ּ���."); 
	              return; 
	      	}
		    
		    if (searchGender.length != 6) { 
	              alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���."); 
	              return; 
	      	}		    		

		    if (searchGender2.length != 7) { 
	              alert("�ֹε�Ϲ�ȣ ���ڸ��� �ٽ� �Է��ϼ���."); 
	              return; 
	      	}		 
		    
			if(codeDepartment == null || codeDepartment == ""){
				alert("�μ��� �������ּ���.")
				return;
			}
			if(codeSchool == null || codeSchool == ""){
				alert("�з��� �������ּ���.")
				return;
			}
			if(skillCode == null || skillCode == ""){
				alert("�ϳ� �̻��� ��ų�� �������ּ���.")
				return;
			}
			if(dateStart1 = null || dateStart1 == ""){
				alert("�⵵�� �Է����ּ���.")
				return;
			}
			if(dateStart2 = null || dateStart2 == ""){
				alert("���� �Է����ּ���.")
				return;
			}
			if(dateStart3 = null || dateStart3 == ""){
				alert("���ڸ� �Է����ּ���.")
				return;
			}
			
			alert("����� �Ϸ�Ǿ����ϴ�.");
			

			$("form[name='addStaff']").attr("method", "POST").attr("action", "/staff/addStaff").submit();
		}
		
	    


	
		$(function(){
			
			
			
			$("button[name='input']").on("click" , function(){			
				fncAddStaff();
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
		
		    <tr align ="center" color="gray">
				<p><td colspan = "6">��� ���� �˻�</td></p>
		    </tr>
		<form class="form-inline" name="addStaff">
		  <div class="form-group">
				    <tr align = "center" >
						<td>
							�̸�
						</td>
						<td>
							<input type="text" name="staffName" id="staffName" value="${! empty staffName ? staffName : ""}" size = "6" maxlength = "6">
						</td>
						<td>�ֹι�ȣ</td>
						<td>
							<label><input type="text" name="searchGender" id="searchGender" ></label>
							-
							<label><input type="text" name="searchGender2"id="searchGender2" ></label>
						</td>
						<td>�μ�</td>
						<td align="center">
							<select name="codeDepartment.departmentCode" id="codeDepartment" style="width:100px" align="center">
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
							<input type="checkbox" name="codeSchool.schoolCode" value="1" >����
							<input type="checkbox" name="codeSchool.schoolCode" value="2" >��������
							<input type="checkbox" name="codeSchool.schoolCode" value="3" >�Ϲݴ���
						</td>
						<td>���</td>
						<td colspan="3">
							<label><input type="checkbox" name="skillCode" value="1">Java</label>
							<label><input type="checkbox" name="skillCode" value="2">JSP</label>
							<label><input type="checkbox" name="skillCode" value="3">ASP</label>
							<label><input type="checkbox" name="skillCode" value="4">PHP</label>
							<label><input type="checkbox" name="skillCode" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td>������</td>
						<td colspan="5">
						    <label>
						     	<input type="text" name="dateStart1" id="dateStart1" size = "6" maxlength = "6">
						      ��
						    </label>
						    <label>
						      <select name="dateStart2" id="dateStart2">
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
						     	<input name="dateStart3" id="dateStart3" size = "6" maxlength = "6">
						      ��
						    </label>
						    
						</td>
				    </tr>
		  </div>
		</form>
	</table>
	<div align = "center">
		<button type="button" name="input" style="width: 90px;">���</button>	
		<button type="button" name="reset" style="width: 90px;">�ʱ�ȭ</button>
	</div>

</body>
</html>