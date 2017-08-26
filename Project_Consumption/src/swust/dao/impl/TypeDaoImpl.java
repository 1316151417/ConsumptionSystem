package swust.dao.impl;

import java.util.List;

import swust.dao.TypeDao;
import swust.model.Type;

public class TypeDaoImpl extends BaseDao implements TypeDao {
	public void add(Type type) {
		getSession().save(type);
	}
	public List<Type> findAll() {
		String hql = "from Type";
		return getSession().createQuery(hql).list();
	}
	public void delete(Integer type_id) {
		Type type = new Type();
		type.setType_id(type_id);
		getSession().delete(type);
	}
	public Type getById(Integer type_id) {
		return (Type) getSession().get(Type.class, type_id);
	}
	public void update(Type type) {
		getSession().update(type);
	}
}
