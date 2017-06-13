package brother.heyflight.checktel.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import brother.heyflight.checktel.plan.PlanService;

@Controller
public class MemberController {
	@Autowired
	PlanService planService;

	// 로그인 뷰
	@RequestMapping("member/loginView.do")
	public String loginView() {
		return "member/loginView";
	}

	// 등록폼
	@RequestMapping("member/loginRegForm.do")
	public String loginRegForm() {
		return "member/loginRegForm";
	}
}
