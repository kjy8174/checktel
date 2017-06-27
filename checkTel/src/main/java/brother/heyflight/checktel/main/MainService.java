package brother.heyflight.checktel.main;

import java.util.List;



import brother.heyflight.checktel.plan.PlanVO;

public interface MainService {
	public PlanVO insertMain(ListVO listVO);
	
	//plan 상세보기
	List<MainVO> getPlanList(PlanVO planVO);
	public int deleteBlog(int planNo);
	
	//트래블로그 리스트
		List<MainVO> getBlogL(PlanVO planVO);
		
	//마이 트래블로그리스트
		List<MainVO> getmyBlogL(PlanVO planVO);
	// 스마트플랜 결과
	/*public PlanVO ResPlan(MainVO vo);*/

		public int deleteUpd(int planNo);

		public void updateMain(ListVO listVO);

		public void blogHit(HitVO hitVO);

		public void deleteHit(HitVO hitVO);

		public void hitUpd(HitVO hitVO);

}