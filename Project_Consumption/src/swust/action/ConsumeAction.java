package swust.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

import swust.exception.ConsumeException;
import swust.model.Consume;
import swust.model.Consumer;
import swust.model.PageBean;
import swust.service.ConsumeService;
import swust.service.TypeService;
import swust.util.DecimalUtil;

public class ConsumeAction extends BaseAction implements ModelDriven<Consume>,ValidationAware {
	private ConsumeService consumeService;
	private TypeService typeService;
	private Consume consume;
	public void setConsumeService(ConsumeService consumeService) {
		this.consumeService = consumeService;
	}
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	public Consume getModel() {
		consume = new Consume();
		return consume;
	}
	public String addPre(){
		getRequest().put("types",typeService.findAll());
		return "addPre";
	}
	@InputConfig(methodName="addPreInput")
	public String add(){
		try {
			consumeService.add(consume);
			getRequest().put("msg", "消费记录录入成功！");
		} catch (ConsumeException e) {
			getRequest().put("types",typeService.findAll());
			getRequest().put("msg", e.getMessage());
			getRequest().put("consume", consume);
			return "addPreInput";
		}
		return SUCCESS;
	}
	public String findAll(){
		ActionContext context = ActionContext.getContext();
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		Consumer session_consumer = (Consumer) getSession().get("session_consumer");
		int consumer_id = session_consumer.getConsumer_id();
		String CurrentPage = (String) request.getParameter("currentPage");
		if(CurrentPage == null || CurrentPage.trim().isEmpty()){
			CurrentPage =  "1";
		}
		int currentPage = Integer.parseInt(CurrentPage);
		int pageSize = 10;
		PageBean<Consume> pageBean = consumeService.findAll(consumer_id,currentPage,pageSize);
		pageBean.setUrl("consume-findAll");
		getRequest().put("pb",pageBean);
		
		Double permitMoney = 1500.0;
		List<Consume> consumes = consumeService.findAll(session_consumer.getConsumer_id());
		Double total = 0.0;
		for(Consume c : consumes){
			total += c.getConsume_price();
		}
		getRequest().put("total", DecimalUtil.keepTwoDecimal(total));
		if(total > permitMoney){
			getRequest().put("warning", "<script type='text/javascript'>$(function(){alert('你消费金额超过1500了，请节约用钱！！！');});</script>");
		}
		
		return "findAll";
	}
	public String delete(){
		consumeService.delete(consume.getConsume_id());
		getRequest().put("msg", "消费记录删除成功！");
		return SUCCESS;
	}
	public String updatePre(){
		getRequest().put("consume", consumeService.get(consume.getConsume_id()));
		getRequest().put("types",typeService.findAll());
		return "updatePre";
	}
	@InputConfig(methodName="updatePreInput")
	public String update(){
		try {
			consumeService.update(consume);
			getRequest().put("msg", "消息记录修改成功！");
		} catch (ConsumeException e) {
			getRequest().put("types",typeService.findAll());
			getRequest().put("msg", e.getMessage());
			getRequest().put("consume", consume);
			return "updatePreInput";
		}
		return SUCCESS;
	}
	private String contentType;
	private long contentLength;
	private String contentDisposition;
	private InputStream inputStream;
	public String getContentType() {
		return contentType;
	}
	public long getContentLength() {
		return contentLength;
	}
	public String getContentDisposition() {
		return contentDisposition;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public String export(){
		try {
			Consumer session_consumer = (Consumer) getSession().get("session_consumer");
			ServletContext servletContext = ServletActionContext.getServletContext();
			String folder = servletContext.getRealPath("/xls/" + session_consumer.getConsumer_id());
			File folderFile = new File(folder);
			if(!folderFile.exists()){
				folderFile.mkdirs();
			}
			String fileName = "consumeBills.xls";
			String savePath = folder + "/" + fileName;
			consumeService.export(session_consumer.getConsumer_id(),savePath);
			inputStream = new FileInputStream(savePath);
			contentType = "application/vnd.ms-excel";
			contentLength = inputStream.available();
			contentDisposition = "attachment;filename=" + fileName;
			return "export";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}
	public String graph(){
		Consumer session_consumer = (Consumer) getSession().get("session_consumer");
		getRequest().put("graphs", consumeService.graph(session_consumer.getConsumer_id()));
		return "graph";
	}
	public String addPreInput(){
		getRequest().put("types",typeService.findAll());
		getRequest().put("msg", "输入信息异常！");
		return "addPreInput";
	}
	public String updatePreInput(){
		consume = consumeService.get((Integer)getRequest().get("consume_id"));
		getRequest().put("types",typeService.findAll());
		getRequest().put("msg", "输入信息异常！");
		getRequest().put("consume", consume);
		return "updatePreInput";
	}
}
