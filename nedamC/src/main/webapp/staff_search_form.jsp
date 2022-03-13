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
		
		function fncGetList(currentPage){
			
			var dateStart1 = $("input[name='dateStart1']").val();
			var dateStart2 = $("input[name='dateStart2']").val();
			var dateStart3 = $("input[name='dateStart3']").val();
			var dateEnd1 = $("input[name='dateEnd1']").val();
			var dateEnd2 = $("input[name='dateEnd2']").val();
			var dateEnd3 = $("input[name='dateEnd3']").val();
			
			
			
			if(dateStart1 > dateEnd1){
				alert("�ּҳ�¥�� �ִ볯¥���� Ů�ϴ�.")
				return;
			}
			if(dateStart1 == dateEnd1){
				if(dateStart2 > dateEnd2){
					alert("�ּҳ�¥�� �ִ볯¥���� Ů�ϴ�.")
					return;
				}
				if(dateStart2 == dateEnd2){
					if(dateStart3 > dateEnd3){
						alert("�ּҳ�¥�� �ִ볯¥���� Ů�ϴ�.")
						return;
					} 
				}
			}
			
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/staff/listStaff").submit();
		}
		
	
		$(function(){
			
			$("button[name='allSearch']").on("click" , function(){
				location.href="/staff/allListStaff"
			});

			$("button[name='reset']").on("click" , function(){
				location.href="/staff_search_form.jsp"
			});
			
			$("button[name='search']").on("click" , function(){
				fncGetList('1');
			});
			
			$("button[name='input']").on("click" , function(){
				location.href="/staff_input_form.jsp"
			});
			
			$("button[name='update/delete']").on("click", function(){
				var staffNo = $("#staffNo").val();
				location.href="/staff/getStaff?staffNo="+$("input[name='staffNo']").val();
			});
			
												
			$("button[name='search2']").on("click" , function(){
				
				var formData = $("form[name=searchForm]").serialize();
				
				console.log(formData);
				
				$.ajax({
					url : "/staff/json/listStaff/" ,
					type : "POST" ,
		            data : formData,
		            dataType : 'json',
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"						
					} ,
					
					success : function(JSONData){
						
						var display = "";
					
						for(var i = 0; i < JSONData.list.length; i++){
							
							if(JSONData.list[i].juminNo == 1){
								JSONData.list[i].juminNo = "��"
							}else if(JSONData.list[i].juminNo == 2){
								JSONData.list[i].juminNo = "��"
							}
							if(JSONData.list[i].codeDepartment.departmentCode == 1){
								JSONData.list[i].codeDepartment.departmentCode = "�����û����"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 2){
								JSONData.list[i].codeDepartment.departmentCode = "������ũ�����"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 3){
								JSONData.list[i].codeDepartment.departmentCode = "SI�����"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 4){
								JSONData.list[i].codeDepartment.departmentCode = "�ݵ�ü�����"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 5){
								JSONData.list[i].codeDepartment.departmentCode = "����μ�������"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 6){
								JSONData.list[i].codeDepartment.departmentCode = "������ȹ��"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 7){
								JSONData.list[i].codeDepartment.departmentCode = "�濵������"
							}
							
							display +='<tr>'
									+ '<td align="center">'+(i+1)+'</td>'
									+ '<td align="center">'+JSONData.list[i].staffName+'</td>'
									+ '<td align="center">'+JSONData.list[i].juminNo+'</td>'
									+ '<td align="center">'+JSONData.list[i].codeDepartment.departmentCode+'</td>'
									+ '<td align="center">'+JSONData.list[i].graduateDay+'</td>'
									+ '<td align="center">'
									+ '	<button type="button" name="update/delete" id="update/delete2">����/����</button>'
									+ '</td>'
									+ '<input type="hidden" id="staffNo" name="staffNo" value="'+JSONData.list[i].staffNo+'">'
									+ '</tr>';
							
							
						}$("#searchTable").append(display);
						
										
					}
					
				});				
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
		<form class="form-inline" name="searchForm" id="searchForm">
		  <div class="form-group">
				    <tr align = "center" >
						<td>
							�̸�
						</td>
						<td>
							<input type="text" name="searchName" value="${! empty search.searchName ? search.searchName : ""}" size = "6" maxlength = "6">
						</td>
						<td>����</td>
						<td>
							<label><input type="checkbox" name="searchGender" value="000000-1111111"> ��</label>
							<label><input type="checkbox" name="searchGender" value="000000-2222222"> ��</label>
						</td>
						<td>�μ�</td>
						<td align="center">
							<select name="searchDepartment" style="width:100px" align = "center">
								<option></option>
								<option value="1" ${ ! empty search.searchDepartment && search.searchDepartment==1 ? "selected" : "" }>�����û����</option>
								<option value="2" ${ ! empty search.searchDepartment && search.searchDepartment==2 ? "selected" : "" }>������ũ�����</option>
								<option value="3" ${ ! empty search.searchDepartment && search.searchDepartment==3 ? "selected" : "" }>si�����</option>
								<option value="4" ${ ! empty search.searchDepartment && search.searchDepartment==4 ? "selected" : "" }>�ݵ�ü�����</option>
								<option value="5" ${ ! empty search.searchDepartment && search.searchDepartment==5 ? "selected" : "" }>����μ�������</option>
								<option value="6" ${ ! empty search.searchDepartment && search.searchDepartment==6 ? "selected" : "" }>������ȹ��</option>
								<option value="7" ${ ! empty search.searchDepartment && search.searchDepartment==7 ? "selected" : "" }>�濵������</option>
							</select>
						</td>
				    </tr>
				    <tr align = "center">
						<td>�з�</td>
						<td>
							<label><input type="checkbox" name="searchEducation" value="1"  ${ ! empty search.searchEducation && search.searchEducation==1 ? "selected" : "" }>����</label>
							<label><input type="checkbox" name="searchEducation" value="2"  ${ ! empty search.searchEducation && search.searchEducation==2 ? "selected" : "" }>��������</label>
							<label><input type="checkbox" name="searchEducation" value="3"  ${ ! empty search.searchEducation && search.searchEducation==3 ? "selected" : "" }>�Ϲݴ���</label>
						</td>
						<td>���</td>
						<td colspan="3">
							<label><input type="checkbox" id="java"   name="searchSkill" value="1">Java</label>
							<label><input type="checkbox" id="jsp"    name="searchSkill" value="2">JSP</label>
							<label><input type="checkbox" id="asp"    name="searchSkill" value="3">ASP</label>
							<label><input type="checkbox" id="php" 	  name="searchSkill" value="4">PHP</label>
							<label><input type="checkbox" id="delphi" name="searchSkill" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td>������</td>
						<td colspan="5">
						    <label>
						     	<input type="text" name="dateStart1" size = "6" maxlength = "6">
						      ��
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
						      ��
						    </label>						    						
						    <label>
						     	<input name="dateStart3" size = "6" maxlength = "6">
						      �� ~
						    </label>
						    <label>
						     	<input type="text" name="dateEnd1" size = "6" maxlength = "6">
						      ��
						    </label>
						    <label>
						      <select name="dateEnd2">
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
						     	<input name="dateEnd3" size = "6" maxlength = "6">
						      ��
						    </label>
						</td>
				    </tr>
				    <input type="hidden" id="currentPage" name="currentPage" value="" />
				    
		  </div>
		</form>
	</table>
	<div align = "center">
		<button type="button" name="search" style="width: 90px;">�˻�</button>
		<button type="button" name="allSearch" style="width: 90px;">���ΰ˻�</button>
		<button type="button" name="reset"  style="width: 90px;">�ʱ�ȭ</button>
		<button type="button" name="input" style="width: 90px;">���</button>
	    <div>
	   		�˻��Ǽ� -> ${resultPage.totalCount}��
	   	</div>
	</div>
	<div align = "center">
		<button type="button" name="search2" style="width: 90px;">�˻�2</button>
		<button type="button" name="allSearch2" style="width: 90px;">���ΰ˻�2</button>
		<button type="button" name="reset2"  style="width: 90px;">�ʱ�ȭ2</button>
		<button type="button" name="input2" style="width: 90px;">���2</button>		
	</div>
	<table border="1" width ="1000" height="20" align = "center" >
	<div>
	    <thead>
	      <tr align = "center">
	        <th>��ȣ</th>
	        <th>�̸�</th>
	        <th>����</th>
	        <th>�μ�</th>
	        <th>������</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody id="searchTable">
	    	<c:set var="i" value="0"/>
			  <c:forEach var="staff" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr>
				  <td align="center">${ i }</td>
				  <td align="center">${staff.staffName}</td>
				  <td align="center">
				  	<c:if test="${staff.juminNo == '1'}">��</c:if>
				  	<c:if test="${staff.juminNo == '2'}">��</c:if>
				  </td>
				  <td align="center">
				  	<c:if test="${staff.codeDepartment.departmentCode == 1}">�����û����</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 2}">������ũ�����</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 3}">SI�����</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 4}">�ݵ�ü�����</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 5}">����μ�������</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 6}">������ȹ��</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 7}">�濵������</c:if>
				  </td>
				  <td align="center">${staff.graduateDay}</td>
				  <td align="center">
				  	<button type="button" name="update/delete">����/����</button>
				  </td>
				</tr>
				  <input type="hidden" id="staffNo" name="staffNo" value="${staff.staffNo}">
	          </c:forEach>
	    </tbody>
	</table>
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
				<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
					<a href="javascript:fncGetList('${ i }');">${ i }</a>
				</c:forEach>
			
    	</td>
	</tr>
</table>

</body>
</html>