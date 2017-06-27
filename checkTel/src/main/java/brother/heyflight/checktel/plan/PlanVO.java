package brother.heyflight.checktel.plan;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import brother.heyflight.checktel.blog.DefaultVO;

public class PlanVO extends DefaultVO {
	private int planNo;
	private int hitNo;
	private String memberNick;
	private int planPeriod;
	private Date planStart;
	private String planStarts;
	private Date planEnd;
	private int memberNo;
	private String blogTitle;
	private int blogHit;
	private String spotFurl;
	private int categoryId;
	private String cityName;
	private String spotName;
	private int selDay;
	private String selCity;
	private String selCategory1;
	private String selCategory2;
	private String selCategory3;
	private String selCategory4;
	private String selCategory5;
	private String selCategory6;
	private String selCategory7;
	private MultipartFile uploadFile;
	private String memberImg;
	private int hit;
	
	
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getMemberImg() {
		return memberImg;
	}
	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public int getSelDay() {
		return selDay;
	}
	public void setSelDay(int selDay) {
		this.selDay = selDay;
	}
	public String getSelCity() {
		return selCity;
	}
	public void setSelCity(String selCity) {
		this.selCity = selCity;
	}
	public String getSelCategory1() {
		return selCategory1;
	}
	public void setSelCategory1(String selCategory1) {
		this.selCategory1 = selCategory1;
	}
	public String getSelCategory2() {
		return selCategory2;
	}
	public void setSelCategory2(String selCategory2) {
		this.selCategory2 = selCategory2;
	}
	public String getSelCategory3() {
		return selCategory3;
	}
	public void setSelCategory3(String selCategory3) {
		this.selCategory3 = selCategory3;
	}
	public String getSelCategory4() {
		return selCategory4;
	}
	public void setSelCategory4(String selCategory4) {
		this.selCategory4 = selCategory4;
	}
	public String getSelCategory5() {
		return selCategory5;
	}
	public void setSelCategory5(String selCategory5) {
		this.selCategory5 = selCategory5;
	}
	public String getSelCategory6() {
		return selCategory6;
	}
	public void setSelCategory6(String selCategory6) {
		this.selCategory6 = selCategory6;
	}
	public String getSelCategory7() {
		return selCategory7;
	}
	public void setSelCategory7(String selCategory7) {
		this.selCategory7 = selCategory7;
	}
	public String getSpotFurl() {
		return spotFurl;
	}
	public void setSpotFurl(String spotFurl) {
		this.spotFurl = spotFurl;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getPlanStarts() {
		return planStarts;
	}
	public void setPlanStarts(String planStarts) {
		this.planStarts = planStarts;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public int getBlogHit() {
		return blogHit;
	}
	public void setBlogHit(int blogHit) {
		this.blogHit = blogHit;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public int getPlanPeriod() {
		return planPeriod;
	}
	public void setPlanPeriod(int planPeriod) {
		this.planPeriod = planPeriod;
	}
	
	public Date getPlanStart() {
		return planStart;
	}
	public void setPlanStart(Date planStart) {
		this.planStart = planStart;
	}
	public Date getPlanEnd() {
		return planEnd;
	}
	public void setPlanEnd(Date planEnd) {
		this.planEnd = planEnd;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "PlanVO [planNo=" + planNo + ", hitNo=" + hitNo
				+ ", memberNick=" + memberNick + ", planPeriod=" + planPeriod
				+ ", planStart=" + planStart + ", planStarts=" + planStarts
				+ ", planEnd=" + planEnd + ", memberNo=" + memberNo
				+ ", blogTitle=" + blogTitle + ", blogHit=" + blogHit
				+ ", spotFurl=" + spotFurl + ", categoryId=" + categoryId
				+ ", cityName=" + cityName + ", spotName=" + spotName
				+ ", selDay=" + selDay + ", selCity=" + selCity
				+ ", selCategory1=" + selCategory1 + ", selCategory2="
				+ selCategory2 + ", selCategory3=" + selCategory3
				+ ", selCategory4=" + selCategory4 + ", selCategory5="
				+ selCategory5 + ", selCategory6=" + selCategory6
				+ ", selCategory7=" + selCategory7 + ", uploadFile="
				+ uploadFile + ", memberImg=" + memberImg + ", hit=" + hit
				+ "]";
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getHitNo() {
		return hitNo;
	}
	public void setHitNo(int hitNo) {
		this.hitNo = hitNo;
	}
	
	
}
