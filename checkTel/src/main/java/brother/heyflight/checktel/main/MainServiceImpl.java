package brother.heyflight.checktel.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService{

	//DAO
	@Autowired
	private MainDAOMybatis mainDAO;
	
	@Override
	public void insertMain(MainVO vo) {
		mainDAO.insertMain(vo);
		// TODO Auto-generated method stub
		
	}
}
