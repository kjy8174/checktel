package brother.heyflight.checktel.main;

import java.io.OutputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JRPdfExporter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import brother.heyflight.checktel.plan.PlanDAOMybatis;
import brother.heyflight.checktel.plan.PlanService;
import brother.heyflight.checktel.plan.PlanVO;

@Controller
public class ReportController {
	
	@Autowired
	PlanService planService;
	@Autowired
	MainService mainService;
	
	@RequestMapping("report.do")
	
	public void report(HttpServletRequest request, HttpServletResponse response, PlanVO planvo) throws Exception  
	{   try{ 
		
		planvo = planService.getPlan(planvo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("BLOG_TITLE",planvo.getBlogTitle());
		map.put("MEMBER_NICK",planvo.getMemberNick());
		map.put("SPOT_FURL",planvo.getSpotFurl());
		
		//레포트 소스
		JasperReport report = 
		JasperCompileManager.compileReport(request.getSession().getServletContext().getRealPath("report/yd.jrxml"));
		
		//데이터 소스
		JRDataSource JRdataSource =                            
				new JRBeanCollectionDataSource(mainService.getPlanList(planvo)); 
		
		//레포트 소스에 데이터를 연결
		JasperPrint print = JasperFillManager.fillReport(report,map,JRdataSource);
		JRExporter exporter = new JRPdfExporter(); OutputStream out;
		response.reset(); 
		out = response.getOutputStream(); 
		exporter.setParameter(JRExporterParameter.OUTPUT_FILE_NAME, "report3.pdf"); 
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, print); 
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out); 
		
		//컴파일된 레포트를 response로 출력
		exporter.exportReport();
		out.flush(); 
		out.close(); 
	}
	catch(Exception e) {       
		e.printStackTrace(); 
	} 
}
}