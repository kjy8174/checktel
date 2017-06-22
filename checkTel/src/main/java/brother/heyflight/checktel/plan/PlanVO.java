package brother.heyflight.checktel.plan;

import java.util.Date;

import brother.heyflight.checktel.blog.DefaultVO;

public class PlanVO extends DefaultVO {
	private int planNo;
	private int planPeriod;
	private Date planStart;
	private String planStarts;
	private Date planEnd;
	private int memberNo;
	private String blogTitle;
	private int blogHit;
	private String memberNick;
	private String spotFurl;
	private String cityName;
	
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
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
		return "PlanVO [planNo=" + planNo + ", planPeriod=" + planPeriod
				+ ", planStart=" + planStart + ", planStarts=" + planStarts
				+ ", planEnd=" + planEnd + ", memberNo=" + memberNo
				+ ", blogTitle=" + blogTitle + ", blogHit=" + blogHit
				+ ", memberNick=" + memberNick + ", spotFurl=" + spotFurl
				+ ", cityName=" + cityName + "]";
	}
	
}
