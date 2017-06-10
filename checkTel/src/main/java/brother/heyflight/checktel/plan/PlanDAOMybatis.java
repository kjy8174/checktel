package brother.heyflight.checktel.plan;

/*import org.apache.ibatis.session.SqlSession;
import com.springbook.biz.util.SqlSessionFactoryBean;*/
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
        mybatis.insert("DetailDAO.insertPlan", vo); //plan-mapping.xml에서 namespace.id 값 vo 를 parameterType에 대입
    }
}
