package brother.heyflight.checktel.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import brother.heyflight.checktel.member.Member;
import brother.heyflight.checktel.member.MemberService;
import brother.heyflight.checktel.plan.PlanService;
import brother.heyflight.checktel.plan.PlanVO;

@Controller 
public class MainController {
	
	@Autowired
	MainService mainService;
	@Autowired
	PlanService planService;

	@Autowired
	private MemberService memberService;

	
	//메인
	@RequestMapping("main/main.do")
	public String main(Model model, HttpSession session){
		Member member = memberService.getMemberSession(session);
		
		if(member != null) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("user", member);
			model.addAttribute(paramMap);
			
			return "main/main";
		}
		else {
			return "main/main";
		}
		
	}
	
	//메인 ( 모달 X)
	@RequestMapping(value={"main/mainUpd.do"})
	public String mainUpd(){
		return "main/mainNoModal";
	}

	//일정 저장
	@RequestMapping(value={"main/save.do"}, method=RequestMethod.POST)
	@ResponseBody
	public PlanVO mainBlogSave(@RequestBody ListVO listVO, HttpSession session){
		System.out.println("등록 : "+listVO);
		return mainService.insertMain(listVO);
		//session.setAttribute("", );		
	
	}
	
	//일정 저장후 개인페이지로 이동
	@RequestMapping(value={"blog/myBlogShow.do"})
	public String mainBlog(PlanVO planVO, Model model){
		model.addAttribute("plan", planService.getPlan(planVO));
		model.addAttribute("planList",mainService.getPlanList(planVO));
		
		return "blog/myBlogShow";
	}
	
	
	//일정복사
	@RequestMapping (value={"main/mainCopy.do"})
		public String getPlan(PlanVO planVO, Model model){
			model.addAttribute("plan", planService.getPlan(planVO));
			model.addAttribute("planList",mainService.getPlanList(planVO));
			return "main/mainUpd";
		}
	
	//일정 삭제
	@RequestMapping(value={"/blog/blogDelete.do"})
	public String blogDelete(@RequestParam(value="planNo") int planNo, Model model){
		System.out.println("삭제 : "+planNo);
		mainService.deleteBlog(planNo);

		return "main/main";
	
	}
	
	//항공권 추천 뷰페이지 이동
	@RequestMapping(value="/etc/flightView.do")
	public String flightView(HttpSession session){
		return "etc/flightView";
	}

	//호텔 추천 뷰페이지 이동	
	@RequestMapping(value="/etc/hotelView.do")
	public String hotelView(HttpSession session){
		return "etc/hotelView";
	}
	
	//사용방법 뷰페이지 이동	
	@RequestMapping(value="/etc/useView.do")
	public String useView(HttpSession session){
		return "etc/useView";
	}
}