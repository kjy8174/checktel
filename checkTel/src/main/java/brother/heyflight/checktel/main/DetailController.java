package brother.heyflight.checktel.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller 
public class DetailController {
	
	@Autowired
	DetailService detailService;
	
	//등록폼
	@RequestMapping(value={"/main/main.do"})
	public String userInsert(){
		return "/main/main";
	}
	
	//등록
	@RequestMapping(value="/main/main.do",method= RequestMethod.POST)
	public String userInsert(DetailVO detailVO, HttpServletRequest request){
		System.out.println("등록 : "+detailVO);
		detailService.insertDetail(detailVO);
		return "redirect:/user/getUser.do";
	}
}