package brother.heyflight.checktel.plan;

import java.sql.Date;

public class PlanVO {
	private int planNo;
	private int planPeriod;
	private Date planStart;
	private Date planEnd;
	private String planMemo;
	private int memberNo;
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
	public String getPlanMemo() {
		return planMemo;
	}
	public void setPlanMemo(String planMemo) {
		this.planMemo = planMemo;
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
				+ ", planStart=" + planStart + ", planEnd=" + planEnd
				+ ", planMemo=" + planMemo + ", memberNo=" + memberNo + "]";
	}
	
	
}
