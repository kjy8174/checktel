package brother.heyflight.checktel.captcha;

import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("captchaService")
public class CaptchaServiceImpl implements CaptchaService{

	@Autowired
	private CaptchaDAO captchaDAO;
	
	@Override
	public String getCaptchaKey() {
		try {
			String captchaKey = captchaDAO.getCaptchaKey();
			return captchaKey;
		} catch (IOException e) {
				
		}
		return null;
	}

	@Override
	public String getCaptchaImageUrl(String captchaKey) {
		String captchaUrl = captchaDAO.getCaptchaImageUrl(captchaKey);
		return captchaUrl;
	}

	@Override
	public boolean isValidCaptcha(String captchaKey, String captchaInput) {
		
		try {
			boolean result = captchaDAO.isValidCaptcha(captchaKey, captchaInput);
			return result;
		} catch (Exception e) {
			return false;
		}
	}

}
