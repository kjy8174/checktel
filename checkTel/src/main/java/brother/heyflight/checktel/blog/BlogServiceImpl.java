package brother.heyflight.checktel.blog;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brother.heyflight.checktel.main.MainVO;
import brother.heyflight.checktel.member.Member;
import brother.heyflight.checktel.member.MemberDAO;
import brother.heyflight.checktel.plan.PlanVO;

@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Autowired
	private BlogMapper blogDAO;
	
	
	//private UserDAOMybatis userDAO;
	
	/*public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}*/
	
	public void deleteBlog(BlogVO vo) {
		blogDAO.deleteBlog(vo);
	}
	public BlogVO getBlog(BlogVO vo) {
		return blogDAO.getBlog(vo);
	}
	public List<Map<String, Object>> getBlogList(BlogVO vo) {
		return blogDAO.getBlogList(vo);
	}
	@Override
	public List<BlogVO> getBlogListVO(BlogVO vo) {
		return blogDAO.getBlogListVO(vo);
	}
	/*@Override
	public UserVO login(UserVO vo) {
		//1. id로 단건조회
		UserVO result = userDAO.getUser(vo);
		//2. ID 체크하고 
		if( result != null) {
		//3. 패스워드 검사해서 일치하면 UsersVO
			if( result.getPassword().equals(vo.getPassword()) ) {
				return result;
			}
		}
		//4. 아니면 null 리턴
		return null;
	}*/
	@Override
	public BlogVO login(BlogVO vo) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<MainVO> getPlanList(PlanVO planVO) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getBlogListCnt(PlanVO vo) { 
		// TODO Auto-generated method stub
		return blogDAO.getBlogListCnt(vo);
	}
	@Override
	public int getmyBlogListCnt(PlanVO vo) {
		// TODO Auto-generated method stub
		return blogDAO.getmyBlogListCnt(vo);
	}
		
	@Override
	public void profileUpdate(Member vo) {
		// TODO Auto-generated method stub
		blogDAO.profileUpdate(vo);    
		
	}
	@Override
	public void userProfileUpdate(Member vo) {
		// TODO Auto-generated method stub
		blogDAO.userProfileUpdate(vo);
		
	}

	
}
