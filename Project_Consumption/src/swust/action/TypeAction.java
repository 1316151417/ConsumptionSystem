package swust.action;

import com.opensymphony.xwork2.ModelDriven;

import swust.model.Type;
import swust.service.TypeService;

public class TypeAction extends BaseAction implements ModelDriven<Type> {
	private TypeService typeService;
	private Type type;
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	public Type getModel() {
		type = new Type();
		return type;
	}
	public String addPre(){
		return "addPre";
	}
	public String add(){
		typeService.add(type);
		getRequest().put("msg", "分类添加成功！");
		return SUCCESS;
	}
	public String findAll(){
		getRequest().put("types", typeService.findAll());
		return "findAll";
	}
	public String delete(){
		typeService.delete(type.getType_id());
		getRequest().put("msg", "分类删除成功！");
		return SUCCESS;
	}
	public String updatePre(){
		getRequest().put("type", typeService.updatePre(type.getType_id()));
		return "updatePre";
	}
	public String update(){
		typeService.update(type);
		getRequest().put("msg", "分类更新成功！");
		return SUCCESS;
	}
}
