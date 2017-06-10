package brother.heyflight.checktel.plan;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("planService")
public class PlanServiceImpl implements PlanService{

	//DAO
	@Autowired
	private PlanDAOMybatis planlDAO;
	
	@Override
	public void insertPlan(PlanVO vo) {
		planlDAO.insertPlan(vo);
		// TODO Auto-generated method stub
		
	}
}
