package swust.service;

import swust.model.Consumer;

public interface ConsumerService {
	public void register(Consumer consumer);
	public Consumer login(Consumer consumer);
	public void changePassword(Consumer consumer, String new_password);
	public boolean validateUsernameame(Consumer consumer);
}
