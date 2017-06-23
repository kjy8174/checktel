package brother.heyflight.checktel.plan;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;



@Controller 
public class PlanController {
	
	@Autowired
	PlanService planService;
	
	//스마트플랜
	@RequestMapping(value={"/plan/planView.do"})
	public String userInsert(){
		return "/plan/planView";
	}
	
	//등록폼
		@RequestMapping(value={"/plan/planResult.do"}) //스마트플랜 설정한거
		public String rsPlan(HttpServletRequest httpServletRequest, Model model, PlanRsVO vo){			
			model.addAttribute("prsList1", vo);
			System.out.println(vo);
			System.out.println(vo.getSelCity());
			model.addAttribute("prsList2", planService.rsPlan(vo));
			return "/plan/planResult";
		}
		
	
	//등록
	@RequestMapping(value="/plan/planView.do",method= RequestMethod.POST)
	public String userInsert(PlanVO planVO, HttpServletRequest request){
		System.out.println("등록 : "+planVO);
		planService.insertPlan(planVO);
		return "redirect:/plan/planResult";
	}
}