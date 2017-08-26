package swust.dao;

import java.util.List;

import swust.model.Consume;
import swust.model.PageBean;

public interface ConsumeDao {
	public void add(Consume consume);
	public List<Consume> findAll(Integer consumer_id);
	public void delete(Integer consume_id);
	public Consume getById(Integer consume_id);
	public void update(Consume consume);
	public PageBean<Consume> findAll(Integer consumer_id, int currentPage, int pageSize);
	public int getCount(Integer consumer_id);
}
