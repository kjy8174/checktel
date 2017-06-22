package brother.heyflight.checktel.main;

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
	public PlanVO insertMain(ListVO listVO) {
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
		return vo;
	}	
	//
    public PlanVO getPlan(PlanVO planVO) {  	
        return planDAO.getPlan(planVO);
    }
    
    public List<MainVO> getPlanList(PlanVO planVO){    	
    	return mainDAO.getPlanList(planVO);
    }
/*    
    public void deleteBlog(PlanVO planVO) {
        mainDAO.deleteBlog(planVO);
    }*/
	@Override
	public int deleteBlog(int planNo) {
		// TODO Auto-generated method stub
		return mainDAO.deleteBlog(planNo);
	}
	
	@Override
	public List<MainVO> getBlogL(PlanVO planVO) {
		// TODO Auto-generated method stub
		return mainDAO.getBlogL(planVO);
	}
/*	// 스마트 플랜
	@Override
	public PlanVO ResPlan(MainVO vo) {
		// TODO Auto-generated method stub
		return mainDAO.ResPlan(vo);
	}*/
}