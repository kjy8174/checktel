package brother.heyflight.checktel.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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