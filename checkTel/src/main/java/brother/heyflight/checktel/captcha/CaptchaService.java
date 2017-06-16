package brother.heyflight.checktel.captcha;

public interface CaptchaService {

	public String getCaptchaKey();
	public String getCaptchaImageUrl(String captchaKey);
	public boolean isValidCaptcha(String captchaKey, String captchaInput);

}
