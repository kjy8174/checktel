package brother.heyflight.checktel.blog;

import org.springframework.web.multipart.MultipartFile;

public class BlogVO extends DefaultVO {

	private int planNo;
	private String blogTitle;
	private String blogContent;
	private int blogHit;
	private int memberNo;
	private String memberNick;
	private String cityName;
	private MultipartFile uploadFile;
	
	
	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "BlogVO [planNo=" + planNo + ", blogTitle=" + blogTitle
				+ ", blogContent=" + blogContent + ", blogHit=" + blogHit
				+ ", memberNo=" + memberNo + ", memberNick=" + memberNick
				+ ", cityName=" + cityName + ", uploadFile=" + uploadFile + "]";
	}
	
}
	

	