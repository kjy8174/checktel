package brother.heyflight.checktel.plan;

import java.util.Date;

public class PlanVO {
	private int planNo;
	private int planPeriod;
	private Date planStart;
	private String planStarts;
	private Date planEnd;
	private int memberNo;
	private String blogTitle;
	private int blogHit;
	
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
				+ ", blogTitle=" + blogTitle + ", blogHit=" + blogHit + "]";
	}
	
}
