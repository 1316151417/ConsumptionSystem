package swust.dao.impl;

import swust.dao.ConsumerDao;
import swust.model.Consumer;

public class ConsumerDaoImpl extends BaseDao implements ConsumerDao{
	public void add(Consumer consumer) {
		getSession().save(consumer);
	}
	public Consumer getByUsernameAndPassword(Consumer consumer) {
		String hql = "from Consumer c where c.consumer_username = ? and c.consumer_password = ?";
		return (Consumer) getSession().createQuery(hql).setString(0, consumer.getConsumer_username()).setString(1, consumer.getConsumer_password()).uniqueResult();
	}
	public void update(Consumer consumer) {
		getSession().update(consumer);
	}
	public Consumer getByUsername(Consumer consumer){
		String hql = "from Consumer c where c.consumer_username = ?";
		return (Consumer) getSession().createQuery(hql).setString(0, consumer.getConsumer_username()).uniqueResult();
	}
}
