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
			
			
			
			if($('input:radio[id="searchOr"]').is(":checked") == true){
				$("#currentPage").val(currentPage);
				$("form").attr("method" , "POST").attr("action" , "/staff/listStaff2").submit();
			}else if($('input:radio[id="searchAnd"]').is(":checked") == true){
				$("#currentPage").val(currentPage);
				$("form").attr("method" , "POST").attr("action" , "/staff/listStaff").submit();
			}else if($('input:radio[id="searchOr"]').is(":checked") == false && $('input:radio[id="searchAnd"]').is(":checked") == false ){
				$("#currentPage").val(currentPage);
				$("form").attr("method" , "POST").attr("action" , "/staff/listStaff").submit();
			}
			
			
		}
		
		// ajax�� ���̺��� ����� �̺�Ʈ�� ��Ű���� ������ ���� �ʾҴ�.
		// �������� �� ������������� �����Ͱ� ���� �̿� ���� ���� ������ �� ã�´ٰ� �Ѵ�.
		// �ذ����� document�� ����Ͽ� ���� DOM ��ü���� ã�� ���̺��� ���߿� �����Ǵ��� ã�� �� �ִ�.
		$(document).on('click', 'button[name="update/delete2"]', function(){
			var staffNo = $("#staffNo").val();
			location.href="/staff/getStaff?staffNo="+$("input[name='staffNo']").val();			
		});
		
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
		
		$(document).ready(function(){ 
			var now = new Date(); 
			var year = now.getFullYear();  
			var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 
			//�⵵ selectbox����� 
			for(var i = 1990 ; i <= year ; i++) { 
				$('#year2').append('<option value="' + i + '">' + i + '��</option>'); 
			} 
			// �Ϻ� selectbox ����� 
			for(var i=1; i <= 31; i++) { 
				var dd = i > 9 ? i : "0"+i ; 
				$('#day2').append('<option value="' + dd + '">' + dd+ '��</option>'); 
			} 
			$("#year2 > option[value='']").attr("selected", "true");  
			$("#day2 > option[value='']").attr("selected", "true"); 
		})		

		
	
		$(function(){
			
			$("button[name='allSearch']").on("click" , function(){
				location.href="/staff/listStaff"
			});

			$("button[name='reset']").on("click" , function(){
				location.href="/staff_search_form.jsp"
			});
			
			$("button[name='search']").on("click" , function(){
				fncGetList('1');
			});
			
			$("button[name='input']").on("click" , function(){
				window.open("/staff_input_form.jsp", "a", "width=1200, height=500, left=100, top=50");
			});
			
			$("button[name='update/delete']").on("click", function(){
				//location.href="/staff/getStaff?staffNo="+$(this).val().trim();
				window.open("/staff/getStaff?staffNo="+$(this).val(), "a", "width=1200, height=500, left=100, top=50");
			});
			
			//����
			//�̸���
			$("#searchSort2").on("click", function(){
				location.href="/staff/listStaff?searchSort=2"
			});
			//����
			$("#searchSort3").on("click", function(){
				location.href="/staff/listStaff?searchSort=3"
			});
			//�μ���
			$("#searchSort4").on("click", function(){
				location.href="/staff/listStaff?searchSort=4"
			});
			//������
			$("#searchSort5").on("click", function(){
				location.href="/staff/listStaff?searchSort=5"
			});			
												
			$("button[name='search2']").on("click" , function(){
				
				//searchForm�� �ִ� �����͸� �̿��Ͽ� �˻������ Ȱ��ȭ ���Ѿ� �ϴµ� �ȵȴ�.
				//console.log���� �����Ͱ� �� �������� controller���� �����͸� �������� ���Ѵ� ������ ����?
				var search = $("form[name=searchForm]").serialize();
				var search2 = JSON.stringify(search);
				console.log(search);
				alert(search2);
				
				$.ajax({
					url : "/staff/json/listStaff/" ,
					type : "POST" ,
		            data : search,
		        	dataType : "json",
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"						
					} ,
					
					success : function(JSONData){
						
						var display = "";
						//������ ��İ��� �ٸ��� JSONData�� list�� �ۼ��ؾ� �����͸� �ҷ��� �� �־���.
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
									+ '	<button type="button" name="update/delete2" id="update/delete2">����/����</button>'
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
				<p><td colspan = "6" style="background-color:gray;">��� ���� �˻�</td></p>
		    </tr>
		<form class="form-inline" name="searchForm" id="searchForm">
		  <div class="form-group">
				    <tr align = "center" >
						<td style="background-color:gray;">
							�̸�
						</td>
						<td>
							<input type="text" name="searchName" value="${! empty search.searchName ? search.searchName : ""}" size = "6" maxlength = "6">
						</td>
						<td style="background-color:gray;">����</td>
						<td>
							<label><input type="checkbox" name="searchGender" value="000000-1111111" ${search.searchGender eq '000000-1111111' ? 'CHECKED' : '' } > ��</label>
							<label><input type="checkbox" name="searchGender" value="000000-2222222" ${search.searchGender eq '000000-2222222' ? 'CHECKED' : '' }> ��</label>
						</td>
						<td style="background-color:gray;">�μ�</td>
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
						<td style="background-color:gray;">�з�</td>
						<td>
							<label><input type="checkbox" name="searchEducation" value="1"  ${search.searchEducation eq '1' ? "CHECKED" : ""}>����</label>
							<label><input type="checkbox" name="searchEducation" value="2"  ${search.searchEducation eq '2' ? "CHECKED" : ""}>��������</label>
							<label><input type="checkbox" name="searchEducation" value="3"  ${search.searchEducation eq '3' ? "CHECKED" : ""}>�Ϲݴ���</label>
						</td>
						<td style="background-color:gray;">���</td>
						<td colspan="3">
							<label><input type="checkbox" id="java"   name="searchSkill" value="1">Java</label>
							<label><input type="checkbox" id="jsp"    name="searchSkill" value="2">JSP</label>
							<label><input type="checkbox" id="asp"    name="searchSkill" value="3">ASP</label>
							<label><input type="checkbox" id="php" 	  name="searchSkill" value="4">PHP</label>
							<label><input type="checkbox" id="delphi" name="searchSkill" value="5">Delphi</label>
						</td>
				    </tr>
				    <tr align = "center">
						<td style="background-color:gray;">������</td>
						<td colspan="5">
						    <label>
						     	<select name="dateStart1" id="year">
						     		<option>${search.dateStart1}</option>
						     	</select>
						      ��
						    </label>
						    <label>
						      <select name="dateStart2" id="month">
						      	<option>${search.dateStart2}</option>
						      	<option>02</option>
						      	<option>08</option>
						      </select>
						      ��
						    </label>						    						
						    <label>
						     	<select name="dateStart3" id="day">
						     		<option>${search.dateStart3}</option>
						     	</select>
						      �� ~
						    </label>
						    <label>
						    	<select name="dateEnd1" id="year2">
						    		<option>${search.dateEnd1}</option>
						    	</select>
						      ��
						    </label>
						    <label>
						      <select name="dateEnd2" id="month2">
						      	<option>${search.dateEnd2}</option>
						      	<option>02</option>
						      	<option>08</option>
						      </select>
						      ��
						    </label>						    						
						    <label>
						    	<select name="dateEnd3" id="day2">
						    		<option>${search.dateEnd3}</option>
						    	</select>
						      ��
						    </label>
						</td>
				    </tr>
				    <tr align = "center">
				    	<td style="background-color:gray;">�󼼰˻�</td>
				    	<td colspan="3">
				    		 <input type="radio" name="searchCheack" id="searchOr" value="1" ${search.searchCheack eq '1' ? "CHECKED" : ""} >or
				    		 <input type="radio" name="searchCheack" id="searchAnd" value="2" ${search.searchCheack eq '2' ? "CHECKED" : ""} >and
				    	</td>
				    </tr>
				    <input type="hidden" id="currentPage" name="currentPage" value="" />
				    
		  </div>
		
	</table>
	<div align = "center">
		<button type="button" name="search" style="width: 90px;">�˻�</button>
		<button type="button" name="allSearch" style="width: 90px;">���ΰ˻�</button>
		<button type="button" name="reset"  style="width: 90px;">�ʱ�ȭ</button>
		<button type="button" name="input" style="width: 90px;" onclick="showPopup();">���</button>
	    <div>
	   		�˻��Ǽ� -> ${resultPage.totalCount}��
	   	</div>
	</div>
	<table border="1" width ="1000" height="20" align = "center" >
	<div>
	    <thead>
	      <tr align = "center" style="background-color:gray;">
	        <th>��ȣ</th>
	        <th id="searchSort2" name="searchSort" value="2" >�̸�</th>
	        <th id="searchSort3" name="searchSort" value="3" >����</th>
	        <th id="searchSort4" name="searchSort" value="4" >�μ�</th>
	        <th id="searchSort5" name="searchSort" value="5" >������</th>
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
				  	<button type="button" name="update/delete" value="${staff.staffNo}" >����/����</button>
				  </td>
				</tr>
				  <!-- list �ҷ��� �� staffNo ���� hidden���� ���ܳ��Ҿ��! -->
				  <input type="hidden" id="staffNo" name="staffNo" value="${staff.staffNo}">
	          </c:forEach>
	          <input type="hidden" id="searchSort" name="searchSort" value="${search.searchSort}">
	    </tbody>
	</table>
	</form>
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