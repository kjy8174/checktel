package brother.heyflight.checktel.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller 
public class MainController {
	
	@Autowired
	MainService mainService;
	
	//메인
	@RequestMapping("main/main.do")
	public String main(){
		return "main/main";
	}
	
	//메인 ( 모달 X)
	@RequestMapping(value={"/main/mainUpd.do"})
	public String mainUpd(){
		return "/main/mainUpd";
	}

	//일정 등록 
	@RequestMapping(value={"blog/myBlogShow.do"})
	public String mainBlog(@ModelAttribute("main") @RequestBody MainVO mainVO, HttpServletRequest request){
		System.out.println("등록 : "+mainVO);
		mainService.insertMain(mainVO);
		return "blog/myBlogShow.do";
	}
	
}