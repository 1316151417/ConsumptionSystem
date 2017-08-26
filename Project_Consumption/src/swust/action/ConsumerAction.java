package swust.action;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import swust.exception.ConsumerException;
import swust.model.Consumer;
import swust.service.ConsumerService;

import com.opensymphony.xwork2.ModelDriven;

public class ConsumerAction extends BaseAction implements ModelDriven<Consumer> {
	private ConsumerService consumerService;
	private Consumer consumer;
	private String verifyCode;
	private String new_password;
	private InputStream inputStream;
	public void setConsumerService(ConsumerService consumerService) {
		this.consumerService = consumerService;
	}
	public Consumer getModel() {
		consumer = new Consumer();
		return consumer;
	}
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	public String getNew_password() {
		return new_password;
	}
	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public String register(){
		try{
			consumerService.register(consumer);
		}catch(ConsumerException e){
			getRequest().put("msg", e.getMessage());
			return "registerInput";
		}
		getRequest().put("msg", "注册成功！");
		return SUCCESS;
	}
	public String login(){
		Consumer session_consumer = null;
		try{
			session_consumer = consumerService.login(consumer);
			if(!getSession().get("verifyCode").equals(verifyCode)){
				throw new ConsumerException("验证码错误！");
			}
			getSession().put("session_consumer", session_consumer);
			getRequest().put("msg", "登陆成功！");
			return SUCCESS;
		}catch(ConsumerException e){
			getRequest().put("consumer", consumer);
			getRequest().put("msg", e.getMessage());
			return "loginInput";
		}
	}
	public String logout(){
		getSession().remove("session_consumer");
		getRequest().put("msg", "退出成功！");
		return "logout";
	}
	public String change(){
		return "change";
	}
	public String changePassword(){
		try {
			consumerService.changePassword(consumer, new_password);
			getRequest().put("msg", "修改成功！");
		} catch (ConsumerException e) {
			getRequest().put("msg", e.getMessage());
			return "change";
		}
		return "changePassword";
	}
	public String validateUsername(){
		try {
			if(consumerService.validateUsernameame(consumer)){
				inputStream = new ByteArrayInputStream("1".getBytes("UTF-8"));
			}else{
				inputStream = new ByteArrayInputStream("0".getBytes("UTF-8"));
			}
		} catch (Exception e) {
		}
		return "ajax";
	}
}
