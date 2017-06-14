package brother.heyflight.checktel.main;

public class MainVO {
	private int spotNo;
	private int cityNo;
	private int dayVisit;
	private int planNo;
	private int dayNo;
	private String json;
	
	public String getJson() {
		return json;
	}
	public void setJson(String json) {
		this.json = json;
	}
	public int getSpotNo() {
		return spotNo;
	}
	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}
	public int getCityNo() {
		return cityNo;
	}
	public void setCityNo(int cityNo) {
		this.cityNo = cityNo;
	}
	public int getDayVisit() {
		return dayVisit;
	}
	public void setDayVisit(int dayVisit) {
		this.dayVisit = dayVisit;
	}
	public int getPlanNo() {
		return planNo;
	}
	public void setPlanNo(int planNo) {
		this.planNo = planNo;
	}
	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
	@Override
	public String toString() {
		return "MainVO [spotNo=" + spotNo + ", cityNo=" + cityNo
				+ ", dayVisit=" + dayVisit + ", planNo=" + planNo + ", dayNo="
				+ dayNo + "]";
	}
	
}
