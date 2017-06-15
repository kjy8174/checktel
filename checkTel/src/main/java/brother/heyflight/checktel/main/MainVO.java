package brother.heyflight.checktel.main;

public class MainVO {
	private int spotNo;
	private int day;
	private int dayNo;
	private double lat;
	private double lng;
	private String furl;
	private int categoryId;
	private String cityName;
	
	public int getSpotNo() {
		return spotNo;
	}
	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getFurl() {
		return furl;
	}
	public void setFurl(String furl) {
		this.furl = furl;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	@Override
	public String toString() {
		return "MainVO [spotNo=" + spotNo + ", day=" + day + ", dayNo=" + dayNo
				+ ", lat=" + lat + ", lng=" + lng + ", furl=" + furl
				+ ", categoryId=" + categoryId + ", cityName=" + cityName + "]";
	}
}
