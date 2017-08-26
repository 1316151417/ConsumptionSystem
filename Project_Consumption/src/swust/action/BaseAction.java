package swust.action;

import java.util.Map;
import org.apache.struts2.interceptor.RequestAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements RequestAware, SessionAware {
	private Map<String, Object> request;
	private Map<String, Object> session;
	public void setRequest(Map<String, Object> request) {
		this.request = request;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public Map<String, Object> getRequest(){
		return request;
	}
	public Map<String, Object> getSession(){
		return session;
	}
}
