package swust.model;

public class Graph {
	private Integer consumer_id;
	private Integer type_id;
	private String type_name;
	private Double total;
	public Integer getConsumer_id() {
		return consumer_id;
	}
	public void setConsumer_id(Integer consumer_id) {
		this.consumer_id = consumer_id;
	}
	public Integer getType_id() {
		return type_id;
	}
	public void setType_id(Integer type_id) {
		this.type_id = type_id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
}
