package swust.model;

import java.util.Date;

public class Consume {
	private Integer consume_id;
	private String consume_name;
	private Double consume_price;
	private Type type;
	private Consumer consumer;
	private Date consume_date;
	private String consume_place;
	private String consume_remark;
	public Integer getConsume_id() {
		return consume_id;
	}
	public void setConsume_id(Integer consume_id) {
		this.consume_id = consume_id;
	}
	public String getConsume_name() {
		return consume_name;
	}
	public void setConsume_name(String consume_name) {
		this.consume_name = consume_name;
	}
	public Double getConsume_price() {
		return consume_price;
	}
	public void setConsume_price(Double consume_price) {
		this.consume_price = consume_price;
	}
	public Type getType() {
		return type;
	}
	public void setType(Type type) {
		this.type = type;
	}
	public Consumer getConsumer() {
		return consumer;
	}
	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}
	public Date getConsume_date() {
		return consume_date;
	}
	public void setConsume_date(Date consume_date) {
		this.consume_date = consume_date;
	}
	public String getConsume_place() {
		return consume_place;
	}
	public void setConsume_place(String consume_place) {
		this.consume_place = consume_place;
	}
	public String getConsume_remark() {
		return consume_remark;
	}
	public void setConsume_remark(String consume_remark) {
		this.consume_remark = consume_remark;
	}
	public String toString() {
		return "Consume [consume_id=" + consume_id + ", consume_name="
				+ consume_name + ", consume_price=" + consume_price + ", type="
				+ type + ", consumer=" + consumer + ", consume_date="
				+ consume_date + ", consume_place=" + consume_place
				+ ", consume_remark=" + consume_remark + "]";
	}
}
