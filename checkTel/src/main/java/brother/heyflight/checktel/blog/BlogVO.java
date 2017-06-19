package brother.heyflight.checktel.blog;

public class BlogVO {

	private int planNo;
	private String blogTitle;
	private String blogContent;
	private int blogHit;
	private String memberNo;
	private String memberNick;
	public int getPlanNo() {
		return planNo;
	}
	
	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public void setPlanNo(int planNo) {
		this.planNo = planNo;
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
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "BlogVO [planNo=" + planNo + ", blogTitle=" + blogTitle
				+ ", blogContent=" + blogContent + ", blogHit=" + blogHit
				+ ", memberNo=" + memberNo + ", memberNick=" + memberNick + "]";
	}
	
}
	

	