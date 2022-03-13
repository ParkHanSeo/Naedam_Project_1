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
				alert("최소날짜가 최대날짜보다 큽니다.")
				return;
			}
			if(dateStart1 == dateEnd1){
				if(dateStart2 > dateEnd2){
					alert("최소날짜가 최대날짜보다 큽니다.")
					return;
				}
				if(dateStart2 == dateEnd2){
					if(dateStart3 > dateEnd3){
						alert("최소날짜가 최대날짜보다 큽니다.")
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
								JSONData.list[i].juminNo = "남"
							}else if(JSONData.list[i].juminNo == 2){
								JSONData.list[i].juminNo = "여"
							}
							if(JSONData.list[i].codeDepartment.departmentCode == 1){
								JSONData.list[i].codeDepartment.departmentCode = "컨설팅사업부"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 2){
								JSONData.list[i].codeDepartment.departmentCode = "하이테크사업부"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 3){
								JSONData.list[i].codeDepartment.departmentCode = "SI사업부"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 4){
								JSONData.list[i].codeDepartment.departmentCode = "반도체사업부"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 5){
								JSONData.list[i].codeDepartment.departmentCode = "기업부설연구소"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 6){
								JSONData.list[i].codeDepartment.departmentCode = "전략기획팀"
							}else if(JSONData.list[i].codeDepartment.departmentCode == 7){
								JSONData.list[i].codeDepartment.departmentCode = "경영지원팀"
							}
							
							display +='<tr>'
									+ '<td align="center">'+(i+1)+'</td>'
									+ '<td align="center">'+JSONData.list[i].staffName+'</td>'
									+ '<td align="center">'+JSONData.list[i].juminNo+'</td>'
									+ '<td align="center">'+JSONData.list[i].codeDepartment.departmentCode+'</td>'
									+ '<td align="center">'+JSONData.list[i].graduateDay+'</td>'
									+ '<td align="center">'
									+ '	<button type="button" name="update/delete" id="update/delete2">수정/삭제</button>'
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
				<p><td colspan = "6">사원 정보 검색</td></p>
		    </tr>
		<form class="form-inline" name="searchForm" id="searchForm">
		  <div class="form-group">
				    <tr align = "center" >
						<td>
							이름
						</td>
						<td>
							<input type="text" name="searchName" value="${! empty search.searchName ? search.searchName : ""}" size = "6" maxlength = "6">
						</td>
						<td>성별</td>
						<td>
							<label><input type="checkbox" name="searchGender" value="000000-1111111"> 남</label>
							<label><input type="checkbox" name="searchGender" value="000000-2222222"> 여</label>
						</td>
						<td>부서</td>
						<td align="center">
							<select name="searchDepartment" style="width:100px" align = "center">
								<option></option>
								<option value="1" ${ ! empty search.searchDepartment && search.searchDepartment==1 ? "selected" : "" }>컨설팅사업부</option>
								<option value="2" ${ ! empty search.searchDepartment && search.searchDepartment==2 ? "selected" : "" }>하이테크사업부</option>
								<option value="3" ${ ! empty search.searchDepartment && search.searchDepartment==3 ? "selected" : "" }>si사업부</option>
								<option value="4" ${ ! empty search.searchDepartment && search.searchDepartment==4 ? "selected" : "" }>반도체사업부</option>
								<option value="5" ${ ! empty search.searchDepartment && search.searchDepartment==5 ? "selected" : "" }>기업부설연구소</option>
								<option value="6" ${ ! empty search.searchDepartment && search.searchDepartment==6 ? "selected" : "" }>전략기획팀</option>
								<option value="7" ${ ! empty search.searchDepartment && search.searchDepartment==7 ? "selected" : "" }>경영지원팀</option>
							</select>
						</td>
				    </tr>
				    <tr align = "center">
						<td>학력</td>
						<td>
							<label><input type="checkbox" name="searchEducation" value="1"  ${ ! empty search.searchEducation && search.searchEducation==1 ? "selected" : "" }>고졸</label>
							<label><input type="checkbox" name="searchEducation" value="2"  ${ ! empty search.searchEducation && search.searchEducation==2 ? "selected" : "" }>전문대졸</label>
							<label><input type="checkbox" name="searchEducation" value="3"  ${ ! empty search.searchEducation && search.searchEducation==3 ? "selected" : "" }>일반대졸</label>
						</td>
						<td>기술</td>
						<td colspan="3">
							<label><input type="checkbox" id="java"   name="searchSkill" value="1">Java</label>
							<label><input type="checkbox" id="jsp"    name="searchSkill" value="2">JSP</label>
							<label><input type="checkbox" id="asp"    name="searchSkill" value="3">ASP</label>
							<label><input type="checkbox" id="php" 	  name="searchSkill" value="4">PHP</label>
							<label><input type="checkbox" id="delphi" name="searchSkill" value="5">Delphi</label>
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
						      일 ~
						    </label>
						    <label>
						     	<input type="text" name="dateEnd1" size = "6" maxlength = "6">
						      년
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
						      월
						    </label>						    						
						    <label>
						     	<input name="dateEnd3" size = "6" maxlength = "6">
						      일
						    </label>
						</td>
				    </tr>
				    <input type="hidden" id="currentPage" name="currentPage" value="" />
				    
		  </div>
		</form>
	</table>
	<div align = "center">
		<button type="button" name="search" style="width: 90px;">검색</button>
		<button type="button" name="allSearch" style="width: 90px;">전부검색</button>
		<button type="button" name="reset"  style="width: 90px;">초기화</button>
		<button type="button" name="input" style="width: 90px;">등록</button>
	    <div>
	   		검색건수 -> ${resultPage.totalCount}건
	   	</div>
	</div>
	<div align = "center">
		<button type="button" name="search2" style="width: 90px;">검색2</button>
		<button type="button" name="allSearch2" style="width: 90px;">전부검색2</button>
		<button type="button" name="reset2"  style="width: 90px;">초기화2</button>
		<button type="button" name="input2" style="width: 90px;">등록2</button>		
	</div>
	<table border="1" width ="1000" height="20" align = "center" >
	<div>
	    <thead>
	      <tr align = "center">
	        <th>번호</th>
	        <th>이름</th>
	        <th>성별</th>
	        <th>부서</th>
	        <th>졸업일</th>
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
				  	<c:if test="${staff.juminNo == '1'}">남</c:if>
				  	<c:if test="${staff.juminNo == '2'}">여</c:if>
				  </td>
				  <td align="center">
				  	<c:if test="${staff.codeDepartment.departmentCode == 1}">컨설팅사업부</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 2}">하이테크사업부</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 3}">SI사업부</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 4}">반도체사업부</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 5}">기업부설연구소</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 6}">전략기획팀</c:if>
				  	<c:if test="${staff.codeDepartment.departmentCode == 7}">경영지원팀</c:if>
				  </td>
				  <td align="center">${staff.graduateDay}</td>
				  <td align="center">
				  	<button type="button" name="update/delete">수정/삭제</button>
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