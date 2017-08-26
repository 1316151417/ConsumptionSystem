package swust.service;

import java.util.List;

import swust.model.Type;

public interface TypeService {
	public void add(Type type);
	public List<Type> findAll();
	public void delete(Integer type_id);
	public Type updatePre(Integer type_id);
	public void update(Type type);
}
