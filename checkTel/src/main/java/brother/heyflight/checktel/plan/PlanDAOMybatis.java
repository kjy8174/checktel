package brother.heyflight.checktel.plan;

/*import org.apache.ibatis.session.SqlSession;
import com.springbook.biz.util.SqlSessionFactoryBean;*/
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PlanDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*private SqlSession mybatis;
	
	public BoardDAOMybatis(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInsance();
	}*/
	
	public void insertPlan(PlanVO vo) {
        System.out.println("===> Mybatis로 insertPlan() 기능 처리");
        mybatis.insert("PlanDAO.insertPlan", vo); //plan-mapping.xml에서 namespace.id 값 vo 를 parameterType에 대입
    }
/*	public void selectPlan(PlanVO vo) {
        System.out.println("===> Mybatis로 selectPlan() 기능 처리");
        mybatis.insert("PlanDAO.selectPlan", vo); //plan-mapping.xml에서 namespace.id 값 vo 를 parameterType에 대입
    }*/

	public PlanVO updatePlan(PlanVO vo) {
		System.out.println("===> Mybatis로 updatePlan() 기능 처리");
        return mybatis.selectOne("PlanDAO.updatePlan", vo);
		
	}
	
	public PlanVO getPlan(PlanVO planVO) {
		System.out.println("===> Mybatis로 getPlan() 기능 처리");
        return mybatis.selectOne("PlanDAO.getPlan", planVO);
		
	}

	public List<PlanVO> rsPlan(PlanRsVO vo) {
        System.out.println("===> Mybatis로 rsPlan() 기능 처리");
        return mybatis.selectList("PlanDAO.rsPlan", vo);		
	}

}
