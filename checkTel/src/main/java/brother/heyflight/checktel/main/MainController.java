package brother.heyflight.checktel.main;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller 
public class MainController {
	
	@Autowired
	MainService mainService;
	
	//메인
	@RequestMapping("main/main.do")
	public String main2(){
		return "main/main";
	}
	
	//메인 ( 모달 X)
	@RequestMapping(value={"/main/mainUpd.do"})
	public String main(){
		return "/main/mainUpd";
	}

	//일정 만든 후 
	@RequestMapping(value={"blog/myBlogShow.do"})
	public String mainBlog(@ModelAttribute("main") MainVO mainVO, HttpServletRequest request){
		System.out.println("등록 : "+mainVO);
		mainService.insertMain(mainVO);
		return "blog/myBlogShow";
	}
}