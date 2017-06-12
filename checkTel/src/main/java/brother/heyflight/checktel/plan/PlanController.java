package brother.heyflight.checktel.plan;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//등록폼
		@RequestMapping(method = RequestMethod.GET, value={"/plan/planResult.do"})
		public String plaInsert(HttpServletRequest httpServletRequest, Model model){
			String selCity = httpServletRequest.getParameter("selCity");
			String selDay = httpServletRequest.getParameter("selDay");
			String selCategory1 = httpServletRequest.getParameter("selCategory1");
			String selCategory2 = httpServletRequest.getParameter("selCategory2");
			String selCategory3 = httpServletRequest.getParameter("selCategory3");
			String selCategory4 = httpServletRequest.getParameter("selCategory4");
			String selCategory5 = httpServletRequest.getParameter("selCategory5");
			String selCategory6 = httpServletRequest.getParameter("selCategory6");
			String selCategory7 = httpServletRequest.getParameter("selCategory7");
			model.addAttribute("selCity",selCity);
			model.addAttribute("selDay",selDay);
			model.addAttribute("selCategory1",selCategory1);
			model.addAttribute("selCategory2",selCategory2);
			model.addAttribute("selCategory3",selCategory3);
			model.addAttribute("selCategory4",selCategory4);
			model.addAttribute("selCategory5",selCategory5);
			model.addAttribute("selCategory6",selCategory6);
			model.addAttribute("selCategory7",selCategory7);
			return "/plan/planResult";
		}
	
	
	/*//등록
	@RequestMapping(value="/plan/planView.do",method= RequestMethod.POST)
	public String userInsert(PlanVO planVO, HttpServletRequest request){
		System.out.println("등록 : "+planVO);
		planService.insertPlan(planVO);
		return "redirect:/plan/planResult";
	}*/
}