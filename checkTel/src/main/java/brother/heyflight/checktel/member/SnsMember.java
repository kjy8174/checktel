package brother.heyflight.checktel.member;

import java.util.Date;

import brother.heyflight.checktel.oauth.NaverUser;

/**
 * SnsMemberVO Class 
 * Member Class 상속
 * */
public class SnsMember extends Member {
	@SuppressWarnings("unused")
	private SnsMember() {
	}

	public SnsMember(String memberName, String memberPw, String memberEmail,
			String memberNick,String memberBirth, String memberSex) {
		super(memberName, memberPw, memberEmail, memberNick,memberBirth, memberSex);
	}

	public SnsMember(String memberName, NaverUser naverUser) {
		super(memberName, null, naverUser.getEmail(), naverUser.getNickname(), naverUser.getBirthday(), naverUser.getGender());
		this.snsId = naverUser.getId();
		this.snsType = "NAVER";
		this.snsName = naverUser.getName();
		this.snsProfile = naverUser.getProfileImage();
	}

	private String snsId;
	private String snsType;
	private String snsName;
	private String snsProfile;
	private Date snsConnectDate;
	public String getSnsId() {
		return snsId;
	}

	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}

	public String getSnsType() {
		return snsType;
	}

	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}

	public String getSnsName() {
		return snsName;
	}

	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}

	public String getSnsProfile() {
		return snsProfile;
	}

	public void setSnsProfile(String snsProfile) {
		this.snsProfile = snsProfile;
	}

	public Date getSnsConnectDate() {
		return snsConnectDate;
	}

	public void setSnsConnectDate(Date snsConnectDate) {
		this.snsConnectDate = snsConnectDate;
	}

	@Override
	public String toString() {
		return "SnsMember [snsId=" + snsId + ", snsType=" + snsType
				+ ", snsName=" + snsName + ", snsProfile=" + snsProfile
				+ ", snsConnectDate=" + snsConnectDate + "]";
	}
	
	
}
