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
		// ����ó�� ���
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
		
		$(document).ready(function(){ 
			var now = new Date(); 
			var year = now.getFullYear();  
			var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 
			//�⵵ selectbox����� 
			for(var i = 1990 ; i <= year ; i++) { 
				$('#year').append('<option value="' + i + '">' + i + '��</option>'); 
			} 
			// �Ϻ� selectbox ����� 
			for(var i=1; i <= 31; i++) { 
				var dd = i > 9 ? i : "0"+i ; 
				$('#day').append('<option value="' + dd + '">' + dd+ '��</option>'); 
			} 
			$("#year > option[value='']").attr("selected", "true"); 
			$("#day > option[value='']").attr("selected", "true"); 
		})	    


	
		$(function(){
			
			
			// �񵿱�ó�� ����ó���� �Ͽ� �˾�â�� �����Ϸ��� �ϸ� �����Ͱ� ������ �� �Ǵ� ��Ȳ�� �־���.
			// �񵿱������ ó���ϸ� �����͸� �����ϸ� �˾�â�� ������ �� �ִ�.
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
							
				
				$.ajax({
	  			 	 url : "/staff/json/addStaff/",
		  		  	 type : "POST",
		  		  	 data : addStaff,
	  		  	 	 dataType : "json",
	    		 	 success : function(JSONData, status){
	  		  	 	 } 	 	 
		  		});
				alert("����� �Ϸ�Ǿ����ϴ�.");
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
				<p><td colspan = "6">��� ���� ���</td></p>
		    </tr>
		<form class="form-inline" name="addStaff">
		  <div class="form-group">
				    <tr align = "center" >
						<td style="background-color:gray;">
							�̸�
						</td>
						<td>
							<input type="text" name="staffName" id="staffName" value="${! empty staffName ? staffName : ""}" size = "6" maxlength = "6">
						</td>
						<td style="background-color:gray;">�ֹι�ȣ</td>
						<td>
							<label><input type="text" name="searchGender" id="searchGender" ></label>
							-
							<label><input type="text" name="searchGender2"id="searchGender2" ></label>
						</td>
						<td style="background-color:gray;">�μ�</td>
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
						<td style="background-color:gray;">�з�</td>
						<td>
							<input type="checkbox" name="codeSchool.schoolCode" value="1" >����
							<input type="checkbox" name="codeSchool.schoolCode" value="2" >��������
							<input type="checkbox" name="codeSchool.schoolCode" value="3" >�Ϲݴ���
						</td>
						<td style="background-color:gray;">���</td>
						<td colspan="3">
							<label><input type="checkbox" name="skillCode" value="1">Java</label>
							<label><input type="checkbox" name="skillCode" value="2">JSP</label>
							<label><input type="checkbox" name="skillCode" value="3">ASP</label>
							<label><input type="checkbox" name="skillCode" value="4">PHP</label>
							<label><input type="checkbox" name="skillCode" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td style="background-color:gray;">������</td>
						<td colspan="5">
   						    <label>
					     	<select name="dateStart1" id="year">
					     		<option></option>
					     	</select>
						      ��
						    </label>
						    <label>
						      <select name="dateStart2" id="month">
						      	<option></option>
						      	<option>02</option>
						      	<option>08</option>
						      </select>
						      ��
						    </label>						    						
						    <label>
						     	<select name="dateStart3" id="day">
						     		<option></option>
						     	</select>
						      �� ~
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