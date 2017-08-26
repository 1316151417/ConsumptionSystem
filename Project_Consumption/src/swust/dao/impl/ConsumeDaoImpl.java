package swust.dao.impl;

import java.util.List;

import swust.dao.ConsumeDao;
import swust.model.Consume;
import swust.model.PageBean;

public class ConsumeDaoImpl extends BaseDao implements ConsumeDao {
	public void add(Consume consume) {
		getSession().save(consume);
	}
	public List<Consume> findAll(Integer consumer_id) {
		String hql = "from Consume where consumer_id = ?";
		return getSession().createQuery(hql).setInteger(0, consumer_id).list();
	}
	public PageBean<Consume> findAll(Integer consumer_id, int currentPage, int pageSize) {
		PageBean<Consume> pageBean = new PageBean<Consume>();
		int firstResult = (currentPage-1)*pageSize;
		int maxResult = pageSize;
		String hql = "from Consume where consumer_id = ?";
		int totalRecord = getCount(consumer_id);
		List<Consume> consumes = getSession().createQuery(hql).setInteger(0, consumer_id).setFirstResult(firstResult).setMaxResults(maxResult).list();
		pageBean.setCurrentPage(currentPage);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalRecord(totalRecord);
		pageBean.setBeanList(consumes);
		return pageBean;
	}
	public int getCount(Integer consumer_id){
		String hql = "select count(*) from Consume where consumer_id = ?";
		Number count = (Number) getSession().createQuery(hql).setInteger(0, consumer_id).uniqueResult();
		return count.intValue();
	}
	public void delete(Integer consume_id) {
		Consume consume = new Consume();
		consume.setConsume_id(consume_id);
		getSession().delete(consume);
	}
	public Consume getById(Integer consume_id) {
		return (Consume) getSession().get(Consume.class, consume_id);
	}
	public void update(Consume consume) {
		getSession().update(consume);
	}
	
}
