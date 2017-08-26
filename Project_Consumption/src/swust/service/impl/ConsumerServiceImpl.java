package swust.service.impl;

import swust.dao.ConsumerDao;
import swust.exception.ConsumerException;
import swust.model.Consumer;
import swust.service.ConsumerService;

public class ConsumerServiceImpl implements ConsumerService {
	private ConsumerDao consumerDao;
	public void setConsumerDao(ConsumerDao consumerDao) {
		this.consumerDao = consumerDao;
	}
	public void register(Consumer consumer) {
		if(consumerDao.getByUsername(consumer) != null){
			throw new ConsumerException("用户名已存在！");
		}
		consumerDao.add(consumer);
	}
	public Consumer login(Consumer consumer) {
		Consumer session_consumer = consumerDao.getByUsernameAndPassword(consumer);
		if(session_consumer != null){
			return session_consumer;
		}else{
			throw new ConsumerException("登录失败！");
		}
	}
	public void changePassword(Consumer consumer, String new_password) {
		Consumer old_consumer = consumerDao.getByUsernameAndPassword(consumer);
		if(old_consumer != null){
			old_consumer.setConsumer_password(new_password);
			consumerDao.update(old_consumer);
		}else{
			throw new ConsumerException("修改失败！");
		}
	}
	public boolean validateUsernameame(Consumer consumer) {
		if(consumerDao.getByUsername(consumer) != null){
			return false;
		}
		return true;
	}
}
