package com.model2.mvc.web.staff;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Staff;
import com.model2.mvc.service.domain.StaffSkill;
import com.model2.mvc.service.staff.StaffService;


@Controller
@RequestMapping("/staff/*")
public class StaffController {

	//Field
	@Autowired
	@Qualifier("staffServiceImpl")
	private StaffService staffService;
	
	public StaffController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;	
	
	//staff 등록
	@RequestMapping(value="addStaff", method=RequestMethod.POST)
	public String addStaff(@ModelAttribute("staff") Staff staff,
						   @RequestParam("searchGender") String searchGender,
						   @RequestParam("searchGender2") String searchGender2,
						   @RequestParam("dateStart1") String dateStart1,
						   @RequestParam("dateStart2") String dateStart2,
						   @RequestParam("dateStart3") String dateStart3,
						   @RequestParam(value="skillCode") int[] skillCode,
						   StaffSkill staffSkill) throws Exception{
		
		System.out.println("/addStaff Start");
		
		System.out.println("확인 ::: "+skillCode);
		
		//staffAdd start
		//searchGender와 searchGender2 입력 정보를 가져와 setJuminNo에 담기
		if(searchGender != null && searchGender != null && searchGender2 != "" && searchGender2 != "" ) {
			staff.setJuminNo(searchGender+"-"+searchGender2);
		}
		staff.setGraduateDay(dateStart1+"-"+dateStart2+"-"+dateStart3);
		//가져온 데이터를 통하여 addStaff 실행
		staffService.addStaff(staff);
		//staffAdd end		
		
		//스킬 코드가 1개 이상으로 들어올 때 연속적으로 메소드를 실행시키기 위한 장치
		for(int i = 0; i <= skillCode.length; i++) {
			staffSkill.setStaffNo(staffService.getStaff(searchGender+"-"+searchGender2).getStaffNo());
			int skillCodeArr = skillCode[i];
			staffSkill.setSkillCode(skillCodeArr);
			staffService.addStaffSkill(staffSkill);
			if(skillCode.length == i+1) {
				System.out.println("도착 확인");
				return "redirect:/staff_search_form.jsp";				
			}
			
		}
		
		System.out.println("addStaff 완료");
		
		return "redirect:/staff_search_form.jsp";
	}
	
	@RequestMapping( value="listStaff")
	public String listStaff(@ModelAttribute("search") Search search, 
							Model model) throws Exception {
		
		System.out.println("/listStaff Start");
		
		//페이지 처리
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		//졸업일 검색 시작일자
		if(search.getDateStart1() != null && search.getDateStart2() != null && search.getDateStart3() != null &&
		   search.getDateStart1() != "" && search.getDateStart2() != "" && search.getDateStart3() != "") {
			search.setSearchGraduateStart(search.getDateStart1()+"-"+search.getDateStart2()+"-"+search.getDateStart3());
		}
		//졸업일 검색 종료일자
		if(search.getDateEnd1() != null && search.getDateEnd2() != null && search.getDateEnd3() != null &&
		   search.getDateEnd1() != "" && search.getDateEnd2() != "" && search.getDateEnd3() != "") {
			search.setSearchGraduateEnd(search.getDateEnd1()+"-"+search.getDateEnd2()+"-"+search.getDateEnd3());
		}		
		System.out.println(search.getSearchGraduateStart());
		System.out.println(search.getSearchGraduateEnd());

		//map으로 조건에 맞는 list를 불러온다.
		Map<String, Object> map = staffService.getStaffList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
				
		//model.addAttribute로 불러온 값들을 넘겨준다.
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);		
		
		return "forward:/staff_search_form.jsp";
	}
	
	@RequestMapping( value="listStaff2")
	public String listStaff2(@ModelAttribute("search") Search search, 
							Model model) throws Exception {
		
		System.out.println("/listStaff2 Start");
		
		//페이지 처리
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		//졸업일 검색 시작일자
		if(search.getDateStart1() != null && search.getDateStart2() != null && search.getDateStart3() != null &&
		   search.getDateStart1() != "" && search.getDateStart2() != "" && search.getDateStart3() != "") {
			search.setSearchGraduateStart(search.getDateStart1()+"-"+search.getDateStart2()+"-"+search.getDateStart3());
		}
		//졸업일 검색 종료일자
		if(search.getDateEnd1() != null && search.getDateEnd2() != null && search.getDateEnd3() != null &&
		   search.getDateEnd1() != "" && search.getDateEnd2() != "" && search.getDateEnd3() != "") {
			search.setSearchGraduateEnd(search.getDateEnd1()+"-"+search.getDateEnd2()+"-"+search.getDateEnd3());
		}		

		//map으로 조건에 맞는 list를 불러온다.
		Map<String, Object> map = staffService.getStaffList2(search);
		
		System.out.println("맵 한번 확인 ::: "+map);
		System.out.println("맵 한번 확인 ::: "+map.size());
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
				
		//model.addAttribute로 불러온 값들을 넘겨준다.
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);		
		
		return "forward:/staff_search_form.jsp";
	}	
	
	//staff의 정보를 수정하기위한 메소드
	@RequestMapping(value="updateStaff", method=RequestMethod.POST)
	public String updateStaff(@ModelAttribute("staff") Staff staff,
							  @RequestParam("searchGender") String searchGender,
							  @RequestParam("searchGender2") String searchGender2,
							  @RequestParam("dateStart1") String dateStart1,
							  @RequestParam("dateStart2") String dateStart2,
							  @RequestParam("dateStart3") String dateStart3,
							  @RequestParam(value="skillCode") int[] skillCode,
							  StaffSkill staffSkill)throws Exception{
		
		System.out.println("/updateStaff Start");
		
		Search search = new Search();
		
		//requestParam으로 들어온 gender값을 jumin에 set하여 담기
		if(searchGender != null && searchGender != null && searchGender2 != "" && searchGender2 != "" ) {
			staff.setJuminNo(searchGender+"-"+searchGender2);
		}
		//requestParam으로 들어온 date의 값을 set하여 담기
		staff.setGraduateDay(dateStart1+"-"+dateStart2+"-"+dateStart3);
		
		//가져온 데이터로 updateStaff 실행
		staffService.updateStaff(staff);
		
		//skillCode를 insert 위하여 삭제 한 뒤에
		staffService.deleteStaffSkill(staffService.getStaff(searchGender+"-"+searchGender2).getStaffNo());
		
		//skillCode를 다시 insert하는 장치
		for(int i = 0; i <= skillCode.length; i++) {
			staffSkill.setStaffNo(staffService.getStaff(searchGender+"-"+searchGender2).getStaffNo());
			int skillCodeArr = skillCode[i];
			staffSkill.setSkillCode(skillCodeArr);
			staffService.addStaffSkill(staffSkill);
			if(skillCode.length == i+1) {
				System.out.println("도착 확인");
				return "redirect:/staff_search_form.jsp";				
			}
			
		}
		
		//getStaff하여 가져온 정보를 setStaffNo에 담기 
		staffSkill.setStaffNo(staffService.getStaff(searchGender+"-"+searchGender2).getStaffNo());
		staffService.updateStaffSkill(staffSkill);
		
		return "redirect:/staff_search_form.jsp";
	}
	
	@RequestMapping(value="deleteStaff" , method=RequestMethod.GET)
	public String deleteStaff(Staff staff, @RequestParam("searchGender") String searchGender,
										   @RequestParam("searchGender2") String searchGender2)
											throws Exception{
		
		System.out.println("deleteStaff 시작");
		
		//gender의 값이 있음을 확인 한 후 1)staffSkill 데이터 삭제 후 2)staff 데이터 삭제
		if(searchGender != null && searchGender != null && searchGender2 != "" && searchGender2 != "" ) {
			staffService.deleteStaffSkill(staffService.getStaff(searchGender+"-"+searchGender2).getStaffNo());
			staffService.deleteStaff(searchGender+"-"+searchGender2);
		}
		
		return "redirect:/staff_search_form.jsp";
	}
	
	// updel 페이지에 정보를 해당 staff의 정보를 담기 위한 메소드 
	@RequestMapping(value="getStaff", method=RequestMethod.GET)
	public String getStaff(@RequestParam("staffNo") int staffNo, Model model) throws Exception{
		
		System.out.println("/staff/getStaff Start");
		
		//staff의 정보
		Staff staff = staffService.getStaff2(staffNo);
		
		//staff의 staffNo를 가지고 staffSkill의 정보 확인하여 list에 담음
		//skillCode는 staffNo 한명이 여러개의 skillCode를 가질 수 있기 때문에
		//selectList로 처리하여 list로 담음
		List<StaffSkill> list = staffService.getStaffSkill2(staffNo);
		
		//staff 한명이 가지고 있는 모든 skillCode를 list로 size만큼 뽑아와 있을경우
		//각 데이터에 담아 model.addAttribute를 하였다.
		if(list.size() > 0) {
			for(int i = 0; i < list.size(); i++) {

				int skillCode = list.get(i).getSkillCode();
				
				if(skillCode == 1) {
					int skillCode1 = skillCode;
					model.addAttribute("skillCode1", skillCode1);
				}else if(skillCode == 2) {
					int skillCode2 = skillCode;
					model.addAttribute("skillCode2", skillCode2);
				}else if(skillCode == 3) {
					int skillCode3 = skillCode;
					model.addAttribute("skillCode3", skillCode3);
				}else if(skillCode == 4) {
					int skillCode4 = skillCode;
					model.addAttribute("skillCode4", skillCode4);
				}else if(skillCode == 5) {
					int skillCode5 = skillCode;
					model.addAttribute("skillCode5", skillCode5);
				}
				
			}
		}
		
		model.addAttribute(staff);
		model.addAttribute("list",list);
		
		System.out.println(staff.getCodeDepartment().getDepartmentCode());
		System.out.println(staff.getCodeDepartment());
		
		return "forward:/staff_updel_form.jsp";
	}
}













