package brother.heyflight.checktel.blog;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.annotation.MapperScan;

import brother.heyflight.checktel.plan.PlanVO;

@MapperScan
public interface BlogMapper {
	/*public void insertUser(UserVO vo);*/
	public void updateBlog(BlogVO vo);
	public void deleteBlog(BlogVO vo);
	public BlogVO getBlog(BlogVO vo);
	public List<Map<String,Object>> getBlogList(BlogVO vo);
	public List<BlogVO> getBlogListVO(BlogVO vo);
	int getBlogListCnt(PlanVO vo);
	int getmyBlogListCnt(PlanVO vo);

}
