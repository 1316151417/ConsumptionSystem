package swust.dao;

import java.util.List;

import swust.model.Type;

public interface TypeDao {
	public void add(Type type);
	public List<Type> findAll();
	public void delete(Integer type_id);
	public Type getById(Integer type_id);
	public void update(Type type);
}
