package brother.heyflight.checktel.review;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	//DAO
	@Autowired
	private ReviewDAOMybatis ReviewDAO;
	
	@Override
	public void insertReview(ReviewVO vo) {
		ReviewDAO.insertReview(vo);
		// TODO Auto-generated method stub	
		
	}
	
	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
        return ReviewDAO.getReviewList(vo);
    }

/*	@Override
	public void deleteReview(ReviewVO vo) {
		ReviewDAO.deleteReview(vo);
	}*/

	@Override
	public int deleteReview(int reviewNo) {
		// TODO Auto-generated method stub
		return ReviewDAO.deleteReview(reviewNo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		// TODO Auto-generated method stub
		return ReviewDAO.getReview(vo);
	}
}
