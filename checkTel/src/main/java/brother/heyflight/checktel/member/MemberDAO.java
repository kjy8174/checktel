package brother.heyflight.checktel.member;

import brother.heyflight.checktel.oauth.NaverUser;

public interface MemberDAO {
	public Member getMemberById(int memberNo);
	public Member getMemberByMemberName(String memberName);
	Member getMemberBySnsId(String snsId);
	Member insertMember(Member member);
	public SnsMember insertMember(NaverUser naverUser, String memberName);
}
