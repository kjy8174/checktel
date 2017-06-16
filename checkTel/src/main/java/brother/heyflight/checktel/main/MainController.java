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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import brother.heyflight.checktel.captcha.CaptchaService;
import brother.heyflight.checktel.member.Member;
import brother.heyflight.checktel.member.MemberService;
import brother.heyflight.checktel.member.SnsMember;
import brother.heyflight.checktel.oauth.NaverLoginService;

@Controller 
public class MainController {
	
	@Autowired
	MainService mainService;

	@Autowired
	private MemberService memberService;

	
	//메인
	@RequestMapping("main/main.do")
	public ModelAndView main(HttpSession session){
		SnsMember snsMember = memberService.getSnsMemberSession(session);
		Member member = memberService.getMemberSession(session);
		if (snsMember != null) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("user", snsMember);
			return new ModelAndView("main/main", paramMap);
		} else if (member != null) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("user", member);
			return new ModelAndView("main/main", paramMap);
		} else {
			return new ModelAndView("main/main");
		}
	}
	
	//메인 ( 모달 X)
	@RequestMapping(value={"/main/mainUpd.do"})
	public String mainUpd(){
		return "/main/mainUpd";
	}
	
	//일정 저장
	@RequestMapping(value={"main/save.do"}, method=RequestMethod.POST)
	@ResponseBody
	public String mainBlogSave(@RequestBody ListVO listVO){
		System.out.println("등록 : "+listVO);
		mainService.insertMain(listVO);
		return "jjj";
	}
	
	//일정 저장후 개인페이지로 이동
	@RequestMapping(value={"blog/myBlogShow.do"})
	public String mainBlog(ListVO listVO, Model model){
		model.addAttribute("planList", mainService);
		return "blog/myBlogShow";
	}
	
	
	
}