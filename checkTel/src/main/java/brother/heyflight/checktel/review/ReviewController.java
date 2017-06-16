package brother.heyflight.checktel.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import brother.heyflight.checktel.blog.BlogService;

@Controller
public class ReviewController {
	
	@Autowired
	BlogService blogService;
	
	@Autowired
	ReviewService reviewService;	
	
	//다건조회  
	@RequestMapping("/review/review.do")
	public @ResponseBody List<ReviewVO> getReviewList(ReviewVO vo,
			                    Model model) throws Exception {
		return reviewService.getReviewList(vo);
	}
	
	//등록
	@RequestMapping("/review/reviewInsert.do")
	public @ResponseBody ReviewVO getReviewInsert(ReviewVO vo){
		reviewService.insertReview(vo);
		return vo;
	}	
			
	
/*	// 댓글 등록
		@RequestMapping(value="/blog/reviewAdd.do", method = RequestMethod.POST)  
		public String reView(ReviewVO reviewVO, HttpServletRequest request, Model model){
			model.addAttribute(reviewVO);
			return "redirect:/blog/myBlogShow";
		}*/
	
	// 개인 일정 상세보기  
	@RequestMapping("/blog/myBlogShow")
	public String myBlogShow(){
		return "blog/myBlogShow";
	}
	  
	
	
	/*//마이페이지 조회  
		@RequestMapping("/blog/myBlogList.do")  
	public String myBlogList(){
		return "blog/myBlogList";
	}
	
	//등록
	@RequestMapping(value="/user/userInsert.do", method = RequestMethod.POST)
	public String userInsert(BlogVO userVO, 					//오버로딩 가능하다 (인수타입은 달라야되)
							HttpServletRequest request){		//,로 연결하면 다수의 VO에 한번에 등록가능
		System.out.println("등록 : " + userVO);
		UserVO vo = new UserVO();
		vo.setName(request.getParameter("name"));
		vo.setId(request.getParameter("id"));
		System.out.println("파라미터 : "+vo);
		userService.insertUser(userVO);
		return "redirect:/user/getUserList.do";
	}

	//목록조회
	@RequestMapping("/blog/getBlogList.do")
	public ModelAndView getBlogList(BlogVO vo, ModelAndView mv){
		//List<Map<String, Object>> list=userService.getUserList(vo);
		List<BlogVO> list=blogService.getBlogListVO(vo);
		mv.addObject("list", list);
		mv.setViewName("blog/BlogList");
		return mv;
		//model.addAttribute("list", list);
		//return "user/userList";
	}
	
	//수정폼
		@RequestMapping("/blog/.do")   //get 
		public String  blogUpdateForm(@ModelAttribute("blog") BlogVO vo, Model model) {
			System.out.println(vo);
//			model.addAttribute("board", boardService.getBoard(vo));
			return "blog/myBlogList";
		}	
		
		//수정      boardUpdate
		@RequestMapping(value="/blogUpdate.do") 
		public String  updateBlog(@ModelAttribute("blog") BlogVO vo, SessionStatus status) {  //command 객체
			blogService.updateBlog(vo);
			status.setComplete();			//세션에 저장된 VO를 삭제
			return "redirect:/getBoardList.do";
		}
	
		//삭제      boardDelete sessionstatus 넣어야됨
		@RequestMapping("/blogDelete.do")
		public String blogDelete(BlogVO vo, Model model) {
			blogService.updateBlog(vo);
			return "blog/myBlogList.do";
		}
	
		//단건조회
		@RequestMapping("/blog/getBlog.do/{id}")
		public String getBlogList(//UserVO vo,
								@PathVariable String id,
								Model model){
			BlogVO  vo = new BlogVO();
			vo.getBlogTitle();
			BlogVO result = blogService.getBlog(vo);
			model.addAttribute("user", result);
			return "blog/getBlog";
		}
	//로그인폼
		@RequestMapping("/login.do")
		public String loginForm(){
			return "/popup/user/login";
		}
	//로그인
		@RequestMapping(value="/login.do", method = RequestMethod.POST)
		public String login(//@ModelAttribute("user") UserVO vo,		//커멘드객체(userVO)
							@RequestParam String id,
							@RequestParam(value="password") String pw,
							@RequestParam(required=false, defaultValue="user") String role,
							Model model,
				HttpSession session){
			BlogVO vo = new BlogVO();
			vo.setId(id);
			vo.setPassword(pw);
			System.out.println(vo);
			BlogVO result = userService.login(vo);
			if(result != null){
				session.setAttribute("login", result);
				//페이지 이동
				//return "redirect:/getBoardList.do";
				//스크립트 실행 후 이동
				model.addAttribute("msg", "로그인 되었습니다");
				model.addAttribute("url", "/getBoardList.do");
				return "/popup/alert";
			}else {
				return "/popup/user/login";
			}
		}
	//로그아웃
		@RequestMapping("/logout.do")
		public String logout(HttpSession session){
			session.invalidate();
			return "/user/login";
		}*/

}
