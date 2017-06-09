package brother.heyflight.checktel.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("detailService")
public class DetailServiceImpl implements DetailService{

	//DAO
	@Autowired
	private DetailDAOMybatis detailDAO;
	
	@Override
	public void insertDetail(DetailVO vo) {
		detailDAO.insertDetail(vo);
		// TODO Auto-generated method stub
		
	}
}
