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

	//일정 저장
	@RequestMapping(value={"blog/save.do"}, method=RequestMethod.POST)
	public String mainBlogSave(@RequestBody List<MainVO> mainVO){
		System.out.println("등록 : "+mainVO);
		mainService.insertMain(mainVO);
		return "blog/myBlogShow";
	}
	
	/*//일정 저장후 개인페이지로 이동
	@RequestMapping(value={"blog/myBlogShow.do"})
	public String mainBlog(){
		return "blog/myBlogShow";
	}	*/
	
}