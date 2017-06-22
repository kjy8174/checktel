package brother.heyflight.checktel.main;

import java.util.Date;

public class MainVO {
	private int spotNo; //장소 idx
	private String spotName; //장소 이름
	private String spotFurl; //장소 이미지
	private double lat;
	private double lng;
	private String cityName; //도시이름
	private int no;
	private int dayVisit; // 방문 순서
	private int planNo;
	private int categoryId;
	private int dayNo; //경과일수
	private String blogTitle;
	private int memberNo;
	private String memberNick;
	private Date planStart;
	private String planStarts;
	//list
	
	public int getSpotNo() {
		return spotNo;
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
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNick() {
		return memberNick;
	}
	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}
	public Date getPlanStart() {
		return planStart;
	}
	public void setPlanStart(Date planStart) {
		this.planStart = planStart;
	}
	public void setSpotNo(int spotNo) {
		this.spotNo = spotNo;
	}
	public String getSpotName() {
		return spotName;
	}
	public void setSpotName(String spotName) {
		this.spotName = spotName;
	}
	public String getSpotFurl() {
		return spotFurl;
	}
	public void setSpotFurl(String spotFurl) {
		this.spotFurl = spotFurl;
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
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getDayNo() {
		return dayNo;
	}
	public void setDayNo(int dayNo) {
		this.dayNo = dayNo;
	}
	@Override
	public String toString() {
		return "MainVO [spotNo=" + spotNo + ", spotName=" + spotName
				+ ", spotFurl=" + spotFurl + ", lat=" + lat + ", lng=" + lng
				+ ", cityName=" + cityName + ", no=" + no + ", dayVisit="
				+ dayVisit + ", planNo=" + planNo + ", categoryId="
				+ categoryId + ", dayNo=" + dayNo + ", blogTitle=" + blogTitle
				+ ", memberNo=" + memberNo + ", memberNick=" + memberNick
				+ ", planStart=" + planStart + ", planStarts=" + planStarts
				+ "]";
	}
	
}
