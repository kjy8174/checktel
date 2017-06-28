package brother.heyflight.checktel.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import brother.heyflight.checktel.blog.BlogService;
import brother.heyflight.checktel.plan.PlanService;

@Controller
public class ReviewController {
	
	@Autowired
	BlogService blogService;
	
	@Autowired
	PlanService planService;
	
	@Autowired
	ReviewService reviewService;	
	
	// 다건 조회  
	@RequestMapping(value="/review/review.do")
	public @ResponseBody List<ReviewVO> getReviewList(ReviewVO vo, HttpSession session) throws Exception {		
		System.out.println(vo);
		return reviewService.getReviewList(vo);		
	}	
	
	//등록
	@RequestMapping(value="/review/reviewInsert.do")
	public @ResponseBody ReviewVO getReviewInsert(ReviewVO vo, HttpSession session){
		System.out.println(vo);
		reviewService.insertReview(vo);
		System.out.println(vo);
		
		vo = reviewService.getReview(vo);
		System.out.println(vo);
		return vo;		
	}
	
	// 삭제
	@RequestMapping(value="/review/reviewDel.do")
	public String ReviewDel(@RequestParam(value="reviewNo") int reviewNo, HttpSession session){		
		System.out.println(reviewNo);
		reviewService.deleteReview(reviewNo);
		System.out.println(reviewNo);
		return "redirect:/review/review.do";
		
	}
	
	// 수정
		@RequestMapping(value="/review/reviewUpd.do")
		public String ReviewUpd(ReviewVO vo, HttpSession session){		
			System.out.println(vo);
			reviewService.updateReview(vo);
			System.out.println(vo);
			return "redirect:/review/review.do";
			
		}
	
	// 개인 일정 상세보기  
	@RequestMapping("/blog/myBlogShow")
	public String myBlogShow(){
		return "blog/myBlogShow";
	}
	
}
