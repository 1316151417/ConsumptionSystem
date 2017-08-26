package swust.service.impl;

import java.util.List;

import swust.dao.TypeDao;
import swust.model.Type;
import swust.service.TypeService;

public class TypeServiceImpl implements TypeService{
	private TypeDao typeDao;
	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}
	public void add(Type type) {
		typeDao.add(type);
	}
	public List<Type> findAll() {
		return typeDao.findAll();
	}
	public void delete(Integer type_id) {
		typeDao.delete(type_id);
	}
	public Type updatePre(Integer type_id) {
		return typeDao.getById(type_id);
	}
	public void update(Type type) {
		typeDao.update(type);
	}
}
