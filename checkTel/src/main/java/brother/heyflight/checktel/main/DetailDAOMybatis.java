package brother.heyflight.checktel.main;

/*import org.apache.ibatis.session.SqlSession;
import com.springbook.biz.util.SqlSessionFactoryBean;*/
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DetailDAOMybatis {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*private SqlSession mybatis;
	
	public BoardDAOMybatis(){
		mybatis = SqlSessionFactoryBean.getSqlSessionInsance();
	}*/
	
	public void insertDetail(DetailVO vo) {
        System.out.println("===> Mybatis로 insertDetail() 기능 처리");
        mybatis.insert("DetailDAO.insertDetail", vo); //board-mapping.xml에서 namespace.id 값 vo 를 parameterType에 대입
    }
}
