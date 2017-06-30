package brother.heyflight.checktel.member;

import javax.servlet.http.HttpSession;

import brother.heyflight.checktel.oauth.NaverUser;

public interface MemberService {
	
	public Member getMemberByMemberName(String memberName);
	
	public SnsMember getMemberByNaverUser(NaverUser naverUser);
	
	void setMemberSession(HttpSession session, Member member);
	
	Member getMemberSession(HttpSession session);
	
	Member createNewMemberByMember(Member member);
	
	void setNaverUserSession(HttpSession session, NaverUser naverUser);
	
	NaverUser getNaverUserSession(HttpSession session);
	
	void setSnsMemberSession(HttpSession session, SnsMember snsMember);
	
	SnsMember getSnsMemberSession(HttpSession session);
	
	String getSuggestMemberNameFromEmail(String memberEmail);
	
	Member getJoinMemberSession(HttpSession session);
	
	void setJoinMemberSession(HttpSession session, Member member);
	
	void initSession(HttpSession session);
	
	public SnsMember createNewMemberBySnsMember(NaverUser naverUser, String memberName);
	
	public Member getMemberByMemberNick(String memberNick);
	
	public Member getMemberByMemberEmail(String memberEmail);	
}
