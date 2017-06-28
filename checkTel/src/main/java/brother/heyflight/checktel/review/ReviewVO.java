package brother.heyflight.checktel.review;

import java.sql.Date;

public class ReviewVO {
	private String memberImg;
	private int reviewNo;
	private String reviewContent;
	private Date reviewDate;
	private int planNo;
	private int memberNo;
	private String memberNick;
	private String reviewDates;
	
	public String getReviewDates() {
		return reviewDates;
	}
	public void setReviewDates(String reviewDates) {
		this.reviewDates = reviewDates;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
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
		return "ReviewVO [memberImg=" + memberImg + ", reviewNo=" + reviewNo
				+ ", reviewContent=" + reviewContent + ", reviewDate="
				+ reviewDate + ", planNo=" + planNo + ", memberNo=" + memberNo
				+ ", memberNick=" + memberNick + ", reviewDates=" + reviewDates
				+ "]";
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}	
	
}