package brother.heyflight.checktel.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import brother.heyflight.checktel.captcha.CaptchaService;
import brother.heyflight.checktel.oauth.NaverLoginService;
import brother.heyflight.checktel.oauth.NaverUser;

import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class MemberController {
	@Autowired
	private NaverLoginService naverLoginService;

	@Autowired
	private MemberService memberService;

	@Autowired
	private CaptchaService captchaService;

	/* google login */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;

	// 메인페이지
/*	@RequestMapping("/main.do")
	public ModelAndView main(HttpSession session) {
		SnsMember snsMember = memberService.getSnsMemberSession(session);
		Member member = memberService.getMemberSession(session);
		if (snsMember != null) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("USER", snsMember);
			return new ModelAndView("main/main", paramMap);
		} else if (member != null) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("USER", member);
			return new ModelAndView("main/main", paramMap);
		} else {
			return new ModelAndView("main/main");
		}
	}*/

	/* google login callback */
	@RequestMapping(value = "/oauth2callback", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String oauth2callback(Model model, @RequestParam String code,
			HttpSession session) throws IOException {
		System.out.println("여기는 googleCallback");

		return "main/main";
	}

	/* social login */
	@RequestMapping("/login")
	public ModelAndView login(HttpSession session) {
		/* Naver 인증 요청 */
		String naverAuthorizeUrl = naverLoginService
				.getAuthorizationUrl(session);
		/* 구글 code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory
				.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(
				GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("url", naverAuthorizeUrl);
		paramMap.put("google_url", url);

		return new ModelAndView("member/loginView", paramMap);
	}

	/* Naver login */
	@RequestMapping("/callback")
	public ModelAndView callback(@RequestParam String code,
			@RequestParam String state, HttpSession session) throws IOException {
		/* 네이버 아이디로 로그인 인증이 끝나면 callback처리과정에서 AccessToken을 발급받을 수 있다. */
		OAuth2AccessToken oauthToken = naverLoginService.getAccessToken(
				session, code, state);

		/* 발급받은 AccessToken을 이용하여 현재 로그인한 네이버의 사용자 프로필 정보를 조회할 수 있다. */
		NaverUser naverUser = naverLoginService.getUserProfile(oauthToken);

		/* 네이버 사용자 프로필 정보를 이용하여 가입되어있는 사용자를 DB에서 조회하여 가져온다. */
		SnsMember snsMember = memberService.getMemberByNaverUser(naverUser);

		/* 만약 일치하는 사용자가 없다면 현재 로그인한 네이버 사용자 계정으로 회원가입이 가능하도록 가입페이지로 전달한다 */
		if (snsMember == null) {
        	memberService.setNaverUserSession(session, naverUser);
        	String captchaKey = captchaService.getCaptchaKey();
        	String captchaImageUrl = captchaService.getCaptchaImageUrl(captchaKey);
        	Map<String,Object> paramMap = new HashMap<String,Object>();
        	paramMap.put("captchaKey", captchaKey);
        	paramMap.put("captchaImageUrl", captchaImageUrl);
        	paramMap.put("user", naverUser);
        	paramMap.put("suggestUserName", memberService.getSuggestMemberNameFromEmail(naverUser.getEmail()));
			return new ModelAndView("redirect:/member/join_sns_confirm");
		}

		/* 만약 일치하는 사용자가 있다면 현재 세션에 사용자 로그인 정보를 저장 */
		session.setAttribute("USER", snsMember);
		return new ModelAndView("redirect:/main/main.do");
	}

	@RequestMapping("/join.do")
	public ModelAndView join(HttpSession session) {
		String naverAuthorizeUrl = naverLoginService
				.getAuthorizationUrl(session);

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("url", naverAuthorizeUrl);

		return new ModelAndView("member/loginRegForm", paramMap);
	}

	@RequestMapping("/join/confirm")
	public ModelAndView joinConfirm(HttpServletRequest request,
			HttpSession session) {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String nickName = request.getParameter("nickname");
		String birth = request.getParameter("birth");
		String sex = request.getParameter("sex");

		Member member = new Member(userName, password, email, nickName, birth,
				sex);

		String captchaKey = captchaService.getCaptchaKey();
		String captchaImageUrl = captchaService.getCaptchaImageUrl(captchaKey);
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("captchaKey", captchaKey);
		paramMap.put("captchaImageUrl", captchaImageUrl);
		paramMap.put("user", member);

		memberService.setJoinMemberSession(session, member);

		return new ModelAndView("member/join_confirm", paramMap);
	}

	@RequestMapping("/join/sns/done")
	public ModelAndView joinSnsDone(HttpServletRequest request,
			HttpSession session) {

		String captchaInput = request.getParameter("captchaInput");
		String captchaKey = request.getParameter("captchaKey");
		String username = request.getParameter("username");

		NaverUser naverUser = memberService.getNaverUserSession(session);

		if (captchaService.isValidCaptcha(captchaKey, captchaInput)) {

			SnsMember newUser = memberService
					.createNewMemberBySnsMember(naverUser, username);
			memberService.initSession(session);
			memberService.setSnsMemberSession(session, newUser);
			return new ModelAndView("redirect:/main/main.do");

		} else {
			captchaKey = captchaService.getCaptchaKey();
			String captchaImageUrl = captchaService.getCaptchaImageUrl(captchaKey);
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("captchaKey", captchaKey);
			paramMap.put("captchaImageUrl", captchaImageUrl);
			paramMap.put("user", naverUser);
			paramMap.put("suggestUserName", username);
			paramMap.put("errorMessage",
					CommonErrorCode.INVALID_CAPTCHA.getErrorText());

			return new ModelAndView("join_sns_confirm", paramMap);
		}
	}

	@RequestMapping(value = "/join/done.do", method = RequestMethod.POST)
	public ModelAndView joinDone(HttpServletRequest request, HttpSession session) {

		String captchaInput = request.getParameter("captchaInput");
		String captchaKey = request.getParameter("captchaKey");

		Member member = memberService.getJoinMemberSession(session);

		if (captchaService.isValidCaptcha(captchaKey, captchaInput)) {

			Member newMember = memberService.createNewMemberByMember(member);
			memberService.initSession(session);
			memberService.setMemberSession(session, newMember);
			return new ModelAndView("redirect:/main/main.do");

		} else {
			captchaKey = captchaService.getCaptchaKey();
			String captchaImageUrl = captchaService
					.getCaptchaImageUrl(captchaKey);
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("captchaKey", captchaKey);
			paramMap.put("captchaImageUrl", captchaImageUrl);
			paramMap.put("user", member);
			paramMap.put("errorMessage",
					CommonErrorCode.INVALID_CAPTCHA.getErrorText());

			return new ModelAndView("member/join_confirm", paramMap);
		}
	}

	// 로그인 버튼 클릭시
	@RequestMapping(value = "/login/submit.do")
	public ModelAndView doLogin(HttpServletRequest request, HttpSession session) {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		Member member = memberService.getMemberByMemberName(userName);
		if (member != null && member.isValidPassword(password)) {
			session.setAttribute("user", member);
			return new ModelAndView("redirect:/main/main.do");
		} else {
			String naverAuthorizeUrl = naverLoginService
					.getAuthorizationUrl(session);
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("url", naverAuthorizeUrl);
			paramMap.put("errorMessage", "아이디 또는 비밀번호가 올바르지 않습니다.");
			return new ModelAndView("member/loginView", paramMap);
		}
	}

/*	@RequestMapping("/account")
	public ModelAndView account(HttpSession session) {
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
			// REDIRECT TO LOGIN
			return new ModelAndView("redirect:/login");
		}
	}*/

	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		memberService.initSession(session);
		session.invalidate();
		return new ModelAndView("redirect:/main/main.do");
	}

}
