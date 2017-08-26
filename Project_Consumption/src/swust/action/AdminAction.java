package swust.action;

import swust.model.Admin;
import swust.service.TypeService;

import com.opensymphony.xwork2.ModelDriven;

public class AdminAction extends BaseAction implements ModelDriven<Admin>{
	private Admin admin;
	public Admin getModel() {
		admin = new Admin();
		return admin;
	}
	public String login(){
		if(admin.getAdmin_username().equals("admin") && admin.getAdmin_password().equals("admin123456")){
			getSession().put("session_admin", admin);
			getRequest().put("msg", "登录成功！");
			return SUCCESS;
		}else{
			getRequest().put("msg", "管理员登录失败！");
			return "input";
		}
	}
	public String logout(){
		getSession().remove("session_admin");
		getRequest().put("msg", "管理员退出成功！");
		return "logout";
	}
}
