package brother.heyflight.checktel.blog;

import java.sql.Date;

public class BlogVO {

	private int blogNo;
	private String blogTitle;
	private String blogContent;
	private int blogHit;
	private Date blogDate;
	private String memberNo;
	private String categoryNo;
	private String planNo;
	private String memberNick;
	private String memberPw;
	private String reviewCount;
	
	
	public int getBlogNo() {
		return blogNo;
	}
	public void setBlogNo(int blogNo) {
		this.blogNo = blogNo;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getBlogContent() {
		return blogContent;
	}
	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}
	public int getBlogHit() {
		return blogHit;
	}
	public void setBlogHit(int blogHit) {
		this.blogHit = blogHit;
	}
	public Date getBlogDate() {
		return blogDate;
	}
	public void setBlogDate(Date blogDate) {
		this.blogDate = blogDate;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(String categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getPlanNo() {
		return planNo;
	}
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public String getMemberPw() {
		return memberPw;
	}
	public void setMemberPk(String memberPw) {
		this.memberPw = memberPw;
	}
	public String getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(String reviewCount) {
		this.reviewCount = reviewCount;
	}
	@Override
	public String toString() {
		return "BlogVO [blogNo=" + blogNo + ", blogTitle=" + blogTitle
				+ ", blogContent=" + blogContent + ", blogHit=" + blogHit
				+ ", blogDate=" + blogDate + ", memberNo=" + memberNo
				+ ", categoryNo=" + categoryNo + ", planNo=" + planNo
				+ ", memberNick=" + memberNick + ", memberPw=" + memberPw
				+ ", reviewCount=" + reviewCount + "]";
	}

	
	
	
	

	
	

}
