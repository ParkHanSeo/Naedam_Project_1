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
		
		// ajax로 테이블을 만들고 이벤트를 시키려니 실행이 되지 않았다.
		// 페이지가 다 만들어질때까지 데이터가 없어 이에 대한 값이 없으니 못 찾는다고 한다.
		// 해결방안은 document를 사용하여 현재 DOM 객체에서 찾아 테이블이 나중에 생성되더라도 찾을 수 있다.
		$(document).on('click', 'button[name="update/delete2"]', function(){
			var staffNo = $("#staffNo").val();
			location.href="/staff/getStaff?staffNo="+$("input[name='staffNo']").val();			
		});
		
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
		
		$(document).ready(function(){ 
			var now = new Date(); 
			var year = now.getFullYear();  
			var day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate()); 
			//년도 selectbox만들기 
			for(var i = 1990 ; i <= year ; i++) { 
				$('#year2').append('<option value="' + i + '">' + i + '년</option>'); 
			} 
			// 일별 selectbox 만들기 
			for(var i=1; i <= 31; i++) { 
				var dd = i > 9 ? i : "0"+i ; 
				$('#day2').append('<option value="' + dd + '">' + dd+ '일</option>'); 
			} 
			$("#year2 > option[value='']").attr("selected", "true");  
			$("#day2 > option[value='']").attr("selected", "true"); 
		})		

		
	
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
				location.href="/staff/getStaff?staffNo="+$(this).val().trim();
			});
			
			//정렬
			//이름순
			$("#searchSort2").on("click", function(){
				var searchSort = $("#searchSort2").val();
				alert(searchSort)
				fncGetList('1');
			});
			//성별
			$("#searchSort3").on("click", function(){
				location.href="/staff/allListStaff?searchSort=3"
			});
			//부서별
			$("#searchSort4").on("click", function(){
				location.href="/staff/allListStaff?searchSort=4"
			});
			//졸업일
			$("#searchSort5").on("click", function(){
				location.href="/staff/allListStaff?searchSort=5"
			});			
												
			$("button[name='search2']").on("click" , function(){
				
				//searchForm에 있는 데이터를 이용하여 검색기능을 활성화 시켜야 하는데 안된다.
				//console.log에는 데이터가 잘 잡히지만 controller에서 데이터를 가져오지 못한다 이유는 뭘까?
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
						//기존의 방식과는 다르게 JSONData에 list를 작성해야 데이터를 불러올 수 있었다.
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
									+ '	<button type="button" name="update/delete2" id="update/delete2">수정/삭제</button>'
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
				<p><td colspan = "6" style="background-color:gray;">사원 정보 검색</td></p>
		    </tr>
		<form class="form-inline" name="searchForm" id="searchForm">
		  <div class="form-group">
				    <tr align = "center" >
						<td style="background-color:gray;">
							이름
						</td>
						<td>
							<input type="text" name="searchName" value="${! empty search.searchName ? search.searchName : ""}" size = "6" maxlength = "6">
						</td>
						<td style="background-color:gray;">성별</td>
						<td>
							<label><input type="checkbox" name="searchGender" value="000000-1111111"> 남</label>
							<label><input type="checkbox" name="searchGender" value="000000-2222222"> 여</label>
						</td>
						<td style="background-color:gray;">부서</td>
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
						<td style="background-color:gray;">학력</td>
						<td>
							<label><input type="checkbox" name="searchEducation" value="1"  ${ ! empty search.searchEducation && search.searchEducation==1 ? "selected" : "" }>고졸</label>
							<label><input type="checkbox" name="searchEducation" value="2"  ${ ! empty search.searchEducation && search.searchEducation==2 ? "selected" : "" }>전문대졸</label>
							<label><input type="checkbox" name="searchEducation" value="3"  ${ ! empty search.searchEducation && search.searchEducation==3 ? "selected" : "" }>일반대졸</label>
						</td>
						<td style="background-color:gray;">기술</td>
						<td colspan="3">
							<label><input type="checkbox" id="java"   name="searchSkill" value="1">Java</label>
							<label><input type="checkbox" id="jsp"    name="searchSkill" value="2">JSP</label>
							<label><input type="checkbox" id="asp"    name="searchSkill" value="3">ASP</label>
							<label><input type="checkbox" id="php" 	  name="searchSkill" value="4">PHP</label>
							<label><input type="checkbox" id="delphi" name="searchSkill" value="5">Delphi</label>
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
						    <label>
						    	<select name="dateEnd1" id="year2">
						    		<option></option>
						    	</select>
						      년
						    </label>
						    <label>
						      <select name="dateEnd2" id="month2">
						      	<option></option>
						      	<option>02</option>
						      	<option>08</option>
						      </select>
						      월
						    </label>						    						
						    <label>
						    	<select name="dateEnd3" id="day2">
						    		<option></option>
						    	</select>
						      일
						    </label>
						</td>
				    </tr>
				    <input type="hidden" id="currentPage" name="currentPage" value="" />
				    
		  </div>
		
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
	      <tr align = "center" style="background-color:gray;">
	        <th>번호</th>
	        <th id="searchSort2" name="searchSort" value="2" >이름</th>
	        <th id="searchSort3" name="searchSort" value="3" >성별</th>
	        <th id="searchSort4" name="searchSort" value="4" >부서</th>
	        <th id="searchSort5" name="searchSort" value="5" >졸업일</th>
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
				  	<button type="button" name="update/delete" value="${staff.staffNo}" >수정/삭제</button>
				  </td>
				</tr>
				  <!-- list 불러올 때 staffNo 값은 hidden으로 남겨놓았어요! -->
				  <input type="hidden" id="staffNo" name="staffNo" value="${staff.staffNo}">
	          </c:forEach>
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