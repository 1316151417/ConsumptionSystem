package swust.model;

public class Consumer {
	private Integer consumer_id;
	private String consumer_name;
	private String consumer_username;
	private String consumer_password;
	public Integer getConsumer_id() {
		return consumer_id;
	}
	public void setConsumer_id(Integer consumer_id) {
		this.consumer_id = consumer_id;
	}
	public String getConsumer_name() {
		return consumer_name;
	}
	public void setConsumer_name(String consumer_name) {
		this.consumer_name = consumer_name;
	}
	public String getConsumer_username() {
		return consumer_username;
	}
	public void setConsumer_username(String consumer_username) {
		this.consumer_username = consumer_username;
	}
	public String getConsumer_password() {
		return consumer_password;
	}
	public void setConsumer_password(String consumer_password) {
		this.consumer_password = consumer_password;
	}
	public String toString() {
		return consumer_name;
	}
}
