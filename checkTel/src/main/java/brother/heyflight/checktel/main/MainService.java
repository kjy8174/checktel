package brother.heyflight.checktel.main;

import java.util.List;


import brother.heyflight.checktel.plan.PlanVO;

public interface MainService {
	public PlanVO insertMain(ListVO listVO);
	
	//plan 상세보기
	List<MainVO> getPlanList(PlanVO planVO);
	public int deleteBlog(int planNo);


}