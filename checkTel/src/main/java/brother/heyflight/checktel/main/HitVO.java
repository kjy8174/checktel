package brother.heyflight.checktel.main;

public class HitVO {

	private int memberNo;
	private int planNo;
	private int hitNo;
	
	public int getHitNo() {
		return hitNo;
	}
	public void setHitNo(int hitNo) {
		this.hitNo = hitNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	@Override
	public String toString() {
		return "HitVO [memberNo=" + memberNo + ", planNo=" + planNo
				+ ", hitNo=" + hitNo + "]";
	}
}
