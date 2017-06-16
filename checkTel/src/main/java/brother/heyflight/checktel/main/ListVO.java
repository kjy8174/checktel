package brother.heyflight.checktel.main;

import java.util.Date;
import java.util.List;

public class ListVO {
	private int planPeriod;
	private Date planStart;
	private Date planEnd;
	private List<MainVO> detail;
	private String blogTitle;
	private int blogHit;
	
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
	public List<MainVO> getDetail() {
		return detail;
	}
	public void setDetail(List<MainVO> detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "ListVO [planPeriod=" + planPeriod + ", planStart=" + planStart
				+ ", planEnd=" + planEnd + ", detail=" + detail
				+ ", blogTitle=" + blogTitle 
				+ ", blogHit=" + blogHit + "]";
	}
	
}
