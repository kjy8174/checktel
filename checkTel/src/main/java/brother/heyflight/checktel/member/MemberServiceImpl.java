package brother.heyflight.checktel.member;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Service;

import brother.heyflight.checktel.oauth.NaverUser;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	private static final String MEMBER_SESSION = "USER";
	private static final String SNS_MEMBER_SESSION = "SNS_USER";
	private static final String JOIN_MEMBER_SESSION = "JOIN_USER";
	private static final String NAVER_SESSION = "NAVER_USER";
	private static Random generator = new Random();
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Member getMemberByMemberName(String memberName) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberByMemberName(memberName);
	}

	@Override
	public SnsMember getMemberByNaverUser(NaverUser naverUser) {
		if(naverUser != null){
			String snsId = naverUser.getId();
			return (SnsMember)memberDAO.getMemberBySnsId(snsId);
		}
		return null;
	}

	@Override
	public void setMemberSession(HttpSession session, Member member) {
		// TODO Auto-generated method stub
		session.setAttribute(MEMBER_SESSION, member);
	}

	@Override
	public Member getMemberSession(HttpSession session) {
		// TODO Auto-generated method stub
		Member member = (Member)session.getAttribute(MEMBER_SESSION);
		return member;
	}

	@Override
	public Member createNewMemberByMember(Member member) {
		// TODO Auto-generated method stub
		Member newMember = memberDAO.insertMember(member);
		return newMember;
	}

	@Override
	public void setNaverUserSession(HttpSession session, NaverUser naverUser) {
		// TODO Auto-generated method stub
		session.setAttribute(NAVER_SESSION, naverUser);
	}

	@Override
	public NaverUser getNaverUserSession(HttpSession session) {
		// TODO Auto-generated method stub
		NaverUser naverUser = (NaverUser)session.getAttribute(NAVER_SESSION);
		return naverUser;
	}

	@Override
	public void setSnsMemberSession(HttpSession session, SnsMember snsMember) {
		// TODO Auto-generated method stub
		session.setAttribute(SNS_MEMBER_SESSION, snsMember);
	}

	@Override
	public SnsMember getSnsMemberSession(HttpSession session) {
		// TODO Auto-generated method stub
		SnsMember snsMember = (SnsMember)session.getAttribute(SNS_MEMBER_SESSION);
		return snsMember;
	}

	@Override
	public String getSuggestMemberNameFromEmail(String memberEmail) {
		// TODO Auto-generated method stub
		String emailAccount = memberEmail.split("@")[0];
		
		String suggestMemberName = isExistMemberName(emailAccount);
		if( StringUtils.isEmpty(suggestMemberName) ) {
			while(true) {
				StringBuilder sb = new StringBuilder(emailAccount);
				sb.append("_");
				sb.append(generator.nextInt(100));
				suggestMemberName = isExistMemberName(sb.toString());
				if(StringUtils.isNotEmpty(suggestMemberName)){
					break;
				}
			}
		}
		return suggestMemberName;
	}

	@Override
	public Member getJoinMemberSession(HttpSession session) {
		// TODO Auto-generated method stub
		Member member = (Member)session.getAttribute(JOIN_MEMBER_SESSION);
		return member;
	}

	@Override
	public void setJoinMemberSession(HttpSession session, Member member) {
		// TODO Auto-generated method stub
		session.setAttribute(JOIN_MEMBER_SESSION, member);
	}

	@Override
	public void initSession(HttpSession session) {
		// TODO Auto-generated method stub
		session.setAttribute(NAVER_SESSION, null);
		session.setAttribute(MEMBER_SESSION, null);
		session.setAttribute(JOIN_MEMBER_SESSION, null);
		session.setAttribute(SNS_MEMBER_SESSION , null);
	}

	@Override
	public SnsMember createNewMemberBySnsMember(NaverUser naverUser,
			String memberName) {
		// TODO Auto-generated method stub
		return null;
	}
	
	private String isExistMemberName(String memberName){
		Member member = memberDAO.getMemberByMemberName(memberName);
		if( member != null ) {
			return null;
		}
		return memberName;
	}

	@Override
	public Member getMemberByMemberNick(String memberNick) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberByMemberNick(memberNick);
	}

	@Override
	public Member getmemberByMemberEmail(String memberEmail) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberByMemberEmail(memberEmail);
	}
}
