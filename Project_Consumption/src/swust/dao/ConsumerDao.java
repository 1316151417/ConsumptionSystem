package swust.dao;

import swust.model.Consumer;

public interface ConsumerDao {
	public void add(Consumer consumer);
	public Consumer getByUsernameAndPassword(Consumer consumer);
	public void update(Consumer consumer);
	public Consumer getByUsername(Consumer consumer);
}
