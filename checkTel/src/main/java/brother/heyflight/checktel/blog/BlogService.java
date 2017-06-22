package brother.heyflight.checktel.blog;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Service;

import brother.heyflight.checktel.main.MainVO;
import brother.heyflight.checktel.plan.PlanVO;

//UserMapper 파일 내용 복붙!!!!!!똑같다
public interface BlogService {

	public void updateBlog(BlogVO vo);
	public void deleteBlog(BlogVO vo);
	public BlogVO getBlog(BlogVO vo);	//resultType에 있는거 적어야됨 , 단건조회 id 값으로 찾아서 uservo에 넘겨서 한개만 가져온다
	public List<Map<String, Object>> getBlogList(BlogVO vo);	//list를 map타입으로 가져온다?
	public List<BlogVO> getBlogListVO(BlogVO vo);
	public BlogVO login(BlogVO vo);
	List<MainVO> getPlanList(PlanVO planVO);
	int getBlogListCnt(PlanVO vo);
	int getmyBlogListCnt(PlanVO vo);
}