package brother.heyflight.checktel.main;

public class BlogVO {
	private String blogTitle;
	private int planNo;
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	@Override
	public String toString() {
		return "BlogVO [blogTitle=" + blogTitle + ", planNo=" + planNo + "]";
	}
}
