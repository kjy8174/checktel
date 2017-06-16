package brother.heyflight.checktel.review;

import java.sql.Date;

public class ReviewVO {
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private int planNo;
	private int memberNo;
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", reviewContent="
				+ reviewContent + ", reviewDate=" + reviewDate + ", planNo="
				+ planNo + ", memberNo=" + memberNo + "]";
	}	
	
}