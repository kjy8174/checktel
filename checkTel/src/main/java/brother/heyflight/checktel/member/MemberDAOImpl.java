package brother.heyflight.checktel.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import brother.heyflight.checktel.oauth.NaverUser;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private BaseDAO baseDAO;

	@Override
	public Member getMemberById(int memberNo) {
		// TODO Auto-generated method stub
		return (Member)baseDAO.selectOne("MemberDAO.getMemberById", memberNo);
	}

	@Override
	public Member getMemberByMemberName(String memberName) {
		// TODO Auto-generated method stub
		return (Member)baseDAO.selectOne("MemberDAO.getMemberByMemberName", memberName);
	}

	@Override
	public Member getMemberBySnsId(String snsId) {
		// TODO Auto-generated method stub
		return (Member)baseDAO.selectOne("MemberDAO.getSnsMemberBySnsId",snsId);
	}

	@Override
	public Member insertMember(Member member) {
		// TODO Auto-generated method stub
		baseDAO.insert("MemberDAO.insertMember", member);
		return getMemberByMemberName(member.getMemberName());
	}

	@Override
	public SnsMember insertMember(NaverUser naverUser, String memberName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member memberProfileUpdate(Member vo) {
		// TODO Auto-generated method stub
		return null;
	}
}
