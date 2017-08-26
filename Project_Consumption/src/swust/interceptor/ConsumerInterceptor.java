package swust.interceptor;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class ConsumerInterceptor extends AbstractInterceptor {
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Object obj1 = ctx.getSession().get("session_admin");
		Object obj2 = ctx.getSession().get("session_consumer");
		if(obj1 == null && obj2 == null){
			HttpServletRequest request = (HttpServletRequest)ctx.get(ServletActionContext.HTTP_REQUEST); 
			request.setAttribute("msg", "请先登录后再进行操作！");
			return "login";
		}
		return invocation.invoke();
	}
}
