package brother.heyflight.checktel.plan;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("planService")
public class PlanServiceImpl implements PlanService{

	//DAO
	@Autowired
	private PlanDAOMybatis planDAO;
	
	@Override
	public void insertPlan(PlanVO vo) {
		planDAO.insertPlan(vo);
		// TODO Auto-generated method stub
		
	}
	@Override
	public PlanVO getPlan(PlanVO vo) {
		// TODO Auto-generated method stub
		return planDAO.getPlan(vo);
	}
	@Override
	public void updatePlan(PlanVO vo) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<PlanVO> rsPlan(PlanRsVO vo) {
		// TODO Auto-generated method stub
		return planDAO.rsPlan(vo);
	}
}
