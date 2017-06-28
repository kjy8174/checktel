package brother.heyflight.checktel.blog;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import brother.heyflight.checktel.main.MainService;
import brother.heyflight.checktel.member.Member;
import brother.heyflight.checktel.member.MemberService;
import brother.heyflight.checktel.plan.PlanService;
import brother.heyflight.checktel.plan.PlanVO;

@Controller
public class BlogController {

	@Autowired
	BlogService blogService;
	
	@Autowired
	PlanService planService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	MemberService memberService;
	
	// 마이페이지 조회
	@RequestMapping("/blog/myBlogList.do")
	public String myBlogList(PlanVO planVO, Model model,HttpSession session, HttpServletRequest request) {
		/** pageing setting */
				
		Member user = (Member) session.getAttribute("user");
		planVO.setMemberNo(Integer.parseInt(user.getMemberNo()));
		
		Member member = memberService.getMemberByMemberName(user.getMemberName());  
		
		System.out.println("★★★★★"+user);
		
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(planVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(planVO.getPageUnit());
		paginationInfo.setPageSize(planVO.getPageSize());

		planVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		planVO.setLastIndex(paginationInfo.getLastRecordIndex());
		planVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = blogService.getBlogListCnt(planVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println(planVO.getFirstIndex()+":"+planVO.getLastIndex());
		
		model.addAttribute("plan",mainService.getmyBlogL(planVO));
			
		return "blog/myBlogList";
	}

	/*
	 * //등록
	 * 
	 * @RequestMapping(value="/user/userInsert.do", method = RequestMethod.POST)
	 * public String userInsert(BlogVO userVO, //오버로딩 가능하다 (인수타입은 달라야되)
	 * HttpServletRequest request){ //,로 연결하면 다수의 VO에 한번에 등록가능
	 * System.out.println("등록 : " + userVO); UserVO vo = new UserVO();
	 * vo.setName(request.getParameter("name"));
	 * vo.setId(request.getParameter("id")); System.out.println("파라미터 : "+vo);
	 * userService.insertUser(userVO); return "redirect:/user/getUserList.do"; }
	 */

	// 목록조회
	@RequestMapping("/blog/getBlogList.do")
	public String getBlogList(PlanVO planVO, Model model) {
				
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(planVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(planVO.getPageUnit());
		paginationInfo.setPageSize(planVO.getPageSize());

		planVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		planVO.setLastIndex(paginationInfo.getLastRecordIndex());
		planVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		int totCnt = blogService.getBlogListCnt(planVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		System.out.println(planVO.getFirstIndex()+":"+planVO.getLastIndex());
		
		model.addAttribute("planList",mainService.getBlogL(planVO));
		
		
				
		return "blog/BlogList";
	}
	
	/*@RequestMapping("/blog/getBlogList.do")
	public ModelAndView getBlogList(BlogVO vo, ModelAndView mv) {
		// List<Map<String, Object>> list=userService.getUserList(vo);
		List<BlogVO> list = blogService.getBlogListVO(vo);
		mv.addObject("list", list);
		mv.setViewName("blog/BlogList");
		return mv;
		// model.addAttribute("list", list);
		// return "user/userList";
	}*/

	// 수정폼
	@RequestMapping(value = "/blogUpdate.do")
	@ResponseBody
	public Member updateBlog(Member vo,
			SessionStatus status, HttpSession session) { // command 객체

		Member user = (Member) session.getAttribute("user");
		vo.setMemberNo(user.getMemberNo());
	
		blogService.updateBlog(vo);
	
		status.setComplete(); // 세션에 저장된 VO를 삭제
		return vo;
	}

	// 수정 boardUpdate

/*	@RequestMapping("/blog/.do")// get
	public String UpdateForm(@ModelAttribute("blog") BlogVO vo, Model model) {
		System.out.println(vo);
		// model.addAttribute("board", boardService.getBoard(vo));
		return "blog/myBlogList";
	}*/

	// 삭제 boardDelete sessionstatus 넣어야됨
	/*@RequestMapping("/blogDelete.do")
	public String blogDelete(BlogVO vo, Model model) {
		blogService.updateBlog(vo);
		return "blog/myBlogList.do";
	}*/

	// 단건조회
	@RequestMapping("/blog/getBlog.do/{id}")
	public String getBlogList(// UserVO vo,
			@PathVariable String id, Model model) {
		BlogVO vo = new BlogVO();
		vo.getBlogTitle();
		BlogVO result = blogService.getBlog(vo);
		model.addAttribute("user", result);
		return "blog/getBlog";
	}
	
	// 서브프로필 이미지추가
		@RequestMapping(value ="/profileUpdate.do", method = RequestMethod.POST)
		public String profileUpdate(Member vo,
		// @RequestParam String img,
				HttpServletRequest request) throws IllegalStateException,
				IOException {

			long t = System.currentTimeMillis();
			String randomName = t + ""; // 랜덤 이름 정하기
			String realPath = request.getSession().getServletContext().getRealPath("/");// 서블릿 내의 realPath
		
			MultipartFile file = vo.getUploadFile();
			if(file!=null && file.getSize()>0) {
				File saveFile = new File(realPath + "/profile_img/", randomName);
				file.transferTo(saveFile); // 서버에 파일 저장
				vo.setMemberImg(randomName); // 파일명 저장 file.getOriginalFilename()
			}
			
			blogService.profileUpdate(vo);
			System.out.println("저장");
			return "redirect:blog/myBlogList.do";
		}
			

	/*
	 * //로그인폼
	 * 
	 * @RequestMapping("/login.do") public String loginForm(){ return
	 * "/popup/user/login"; } //로그인
	 * 
	 * @RequestMapping(value="/login.do", method = RequestMethod.POST) public
	 * String login(//@ModelAttribute("user") UserVO vo, //커멘드객체(userVO)
	 * 
	 * @RequestParam String id,
	 * 
	 * @RequestParam(value="password") String pw,
	 * 
	 * @RequestParam(required=false, defaultValue="user") String role, Model
	 * model, HttpSession session){ BlogVO vo = new BlogVO(); vo.setId(id);
	 * vo.setPassword(pw); System.out.println(vo); BlogVO result =
	 * userService.login(vo); if(result != null){ session.setAttribute("login",
	 * result); //페이지 이동 //return "redirect:/getBoardList.do"; //스크립트 실행 후 이동
	 * model.addAttribute("msg", "로그인 되었습니다"); model.addAttribute("url",
	 * "/getBoardList.do"); return "/popup/alert"; }else { return
	 * "/popup/user/login"; } } //로그아웃
	 * 
	 * @RequestMapping("/logout.do") public String logout(HttpSession session){
	 * session.invalidate(); return "/user/login"; }
	 */

}
