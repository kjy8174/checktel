package brother.heyflight.checktel.plan;

import java.util.List;



public interface PlanService {
	public void insertPlan(PlanVO vo);
	public PlanVO getPlan(PlanVO vo);	
	public void updatePlan(PlanVO vo);
	List<PlanVO> rsPlan(PlanRsVO vo);
}