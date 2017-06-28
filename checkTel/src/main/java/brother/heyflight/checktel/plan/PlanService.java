package brother.heyflight.checktel.plan;

import java.util.List;

import brother.heyflight.checktel.member.Member;



public interface PlanService {
	public void insertPlan(PlanVO vo);
	public PlanVO getPlan(PlanVO vo);	
	public void updatePlan(PlanVO vo);
	List<PlanVO> rsPlan(PlanRsVO vo);
	//서브 프로필 사진 추가 
	public void profileUpdate(Member vo);
}