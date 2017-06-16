package brother.heyflight.checktel.main;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import brother.heyflight.checktel.plan.PlanDAOMybatis;
import brother.heyflight.checktel.plan.PlanVO;

@Service("mainService")
public class MainServiceImpl implements MainService{

	//DAO
	@Autowired
	private MainDAOMybatis mainDAO;
	@Autowired
	private PlanDAOMybatis planDAO;

/*	public void insertMain(List<MainVO> mainList) {
		PlanVO vo = new PlanVO();
		planDAO.insertPlan(vo);
		for(int i = 0;i<mainList.size();i++){
			mainDAO.insertMain(mainList.get(i));
		}
	}*/

	@Override
	public void insertMain(ListVO listVO) {
		// TODO Auto-generated method stub
		//plan 등록
		PlanVO vo = new PlanVO();
		vo.setPlanEnd(listVO.getPlanEnd());
		vo.setPlanPeriod(listVO.getPlanPeriod());
		vo.setPlanStart(listVO.getPlanStart());
		vo.setBlogHit(listVO.getBlogHit());
		vo.setBlogTitle(listVO.getBlogTitle());
		planDAO.insertPlan(vo);
		
		//detail 등록		
		List<MainVO> mainList = listVO.getDetail();
		
		for(int i = 0;i<mainList.size();i++){
			MainVO mainVO = mainList.get(i);
			mainVO.setPlanNo(vo.getPlanNo());
			mainDAO.insertMain(mainVO);
		}	
	}
	
	public void selectList(ListVO listVO) {
		
    }
	
	
}