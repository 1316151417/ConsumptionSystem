package swust.service;

import java.util.List;

import swust.model.Consume;
import swust.model.Graph;
import swust.model.PageBean;

public interface ConsumeService {
	public void add(Consume consume);
	public List<Consume> findAll(Integer consumer_id);
	public void delete(Integer consume_id);
	public Consume get(Integer consume_id);
	public void update(Consume consume);
	public void export(Integer consumer_id, String savePath);
	public List<Graph> graph(Integer consumer_id);
	public PageBean<Consume> findAll(Integer consumer_id, int currentPage, int pageSize);
}
