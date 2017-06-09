package brother.heyflight.checktel.main;

public class DetailVO {
	private String spotNo;
	private String cityNo;
	private String dayVisit;
	private String planNo;
	private String dayNo;
	public String getSpotNo() {
		return spotNo;
	}
	public void setSpotNo(String spotNo) {
		this.spotNo = spotNo;
	}
	public String getCityNo() {
		return cityNo;
	}
	public void setCityNo(String cityNo) {
		this.cityNo = cityNo;
	}
	public String getDayVisit() {
		return dayVisit;
	}
	public void setDayVisit(String dayVisit) {
		this.dayVisit = dayVisit;
	}
	public String getPlanNo() {
		return planNo;
	}
	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}
	public String getDayNo() {
		return dayNo;
	}
	public void setDayNo(String dayNo) {
		this.dayNo = dayNo;
	}
	@Override
	public String toString() {
		return "PlanVO [spotNo=" + spotNo + ", cityNo=" + cityNo
				+ ", dayVisit=" + dayVisit + ", planNo=" + planNo + ", dayNo="
				+ dayNo + "]";
	}
	
}
