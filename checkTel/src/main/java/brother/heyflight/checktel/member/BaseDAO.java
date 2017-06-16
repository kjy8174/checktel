package brother.heyflight.checktel.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BaseDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
/*	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}*/

	public Object insert(String queryId, Object params) {
		return mybatis.insert(queryId, params);
	}

	public Object update(String queryId, Object params) {
		return mybatis.update(queryId, params);
	}

	public Object delete(String queryId, Object params) {
		return mybatis.delete(queryId, params);
	}

	public Object selectOne(String queryId) {
		return mybatis.selectOne(queryId);
	}

	public Object selectOne(String queryId, Object params) {
		return mybatis.selectOne(queryId, params);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId) {
		return mybatis.selectList(queryId);
	}

	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params) {
		return mybatis.selectList(queryId, params);
	}
}
