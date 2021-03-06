package brother.heyflight.checktel.blog;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Service;

import brother.heyflight.checktel.main.MainVO;
import brother.heyflight.checktel.member.Member;
import brother.heyflight.checktel.plan.PlanVO;

//UserMapper 파일 내용 복붙!!!!!!똑같다
public interface BlogService {

	public void userProfileUpdate(Member vo);
	public void deleteBlog(BlogVO vo);
	public BlogVO getBlog(BlogVO vo);	//resultType에 있는거 적어야됨 , 단건조회 id 값으로 찾아서 uservo에 넘겨서 한개만 가져온다
	public List<Map<String, Object>> getBlogList(BlogVO vo);	//list를 map타입으로 가져온다?
	public List<BlogVO> getBlogListVO(BlogVO vo);
	public BlogVO login(BlogVO vo);
	List<MainVO> getPlanList(PlanVO planVO);
	int getBlogListCnt(PlanVO vo);
	int getmyBlogListCnt(PlanVO vo);
	//서브 프로필 사진 추가 
	public void profileUpdate(Member vo);
	//도시 셀렉트
	/*public void citySelect(PlanVO vo);*/
}