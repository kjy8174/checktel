package brother.heyflight.checktel.review;

/*import org.apache.ibatis.session.SqlSession;
import com.springbook.biz.util.SqlSessionFactoryBean;*/
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*private SqlSession mybatis;
	
	public BoardDAOMybatis(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInsance();
	}*/
	
	public void insertReview(ReviewVO vo) {
        System.out.println("===> Mybatis로 insertReview() 기능 처리");
        mybatis.insert("ReviewDAO.insertReview", vo); //mapping.xml에서 namespace.id 값 vo 를 parameterType에 대입
    }
	
	public List<ReviewVO> getReviewList(ReviewVO vo) {
        System.out.println("===> Mybatis로 getReviewList() 기능 처리");
        return mybatis.selectList("ReviewDAO.getReviewList", vo);
    }

	public void deleteReview(ReviewVO vo) {
		 System.out.println("===> Mybatis로 deleteReview() 기능 처리");
	        mybatis.delete("ReviewDAO.deleteReview", vo);	    
	}

	public int deleteReview(int reviewNo) {
		 System.out.println("===> Mybatis로 deleteReview() 기능 처리");
		 return mybatis.delete("ReviewDAO.deleteReview", reviewNo);	
	}

	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("===> Mybatis로 getReview() 기능 처리");
		return mybatis.selectOne("ReviewDAO.getReview", vo);	
	}
}
