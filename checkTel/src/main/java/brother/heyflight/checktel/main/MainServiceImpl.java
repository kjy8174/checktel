package brother.heyflight.checktel.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("mainService")
public class MainServiceImpl implements MainService{

	//DAO
	@Autowired
	private MainDAOMybatis mainDAO;

	public void insertMain(List<MainVO> mainList) {
		for(int i = 0;i<mainList.size();i++){
			mainDAO.insertMain(mainList.get(i)); //for 문 돌리자
		}
	}
}