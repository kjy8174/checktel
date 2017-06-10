package brother.heyflight.checktel.plan;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller 
public class PlanController {
	
	@Autowired
	PlanService planService;
	
	//등록폼
	@RequestMapping(value={"/plan/planView.do"})
	public String userInsert(){
		return "/plan/planView";
	}
	
	//등록
	@RequestMapping(value="/plan/planView.do",method= RequestMethod.POST)
	public String userInsert(PlanVO planVO, HttpServletRequest request){
		System.out.println("등록 : "+planVO);
		planService.insertPlan(planVO);
		return "redirect:/plan/planResult";
	}
}