package brother.heyflight.checktel.review;

import java.util.List;

public interface ReviewService {
	void insertReview(ReviewVO vo);
	List<ReviewVO> getReviewList(ReviewVO vo);
}