package swust.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import swust.dao.ConsumeDao;
import swust.dao.TypeDao;
import swust.exception.ConsumeException;
import swust.model.Consume;
import swust.model.Graph;
import swust.model.PageBean;
import swust.model.Type;
import swust.service.ConsumeService;
import swust.util.JxlUtil;

public class ConsumeServiceImpl implements ConsumeService {
	private ConsumeDao consumeDao;
	private TypeDao typeDao;
	public void setConsumeDao(ConsumeDao consumeDao) {
		this.consumeDao = consumeDao;
	}
	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}
	public void add(Consume consume) {
		try {
			consumeDao.add(consume);
		} catch (Exception e) {
			throw new ConsumeException("输入信息异常！");
		}
	}
	public List<Consume> findAll(Integer consumer_id) {
		return consumeDao.findAll(consumer_id);
	}
	public PageBean<Consume> findAll(Integer consumer_id, int currentPage, int pageSize) {
		return consumeDao.findAll(consumer_id,currentPage,pageSize);
	}
	public void delete(Integer consume_id) {
		consumeDao.delete(consume_id);
	}
	public Consume get(Integer consume_id) {
		return consumeDao.getById(consume_id);
	}
	public void update(Consume consume) {
		try {
			consumeDao.update(consume);
		} catch (ConsumeException e) {
			throw new ConsumeException("输入信息异常！");
		}
	}
	public void export(Integer consumer_id,String savePath) {
		List<Consume> consumes = consumeDao.findAll(consumer_id);
		String sheetName = "消费账单";
		Vector<String> columnNames = new Vector<String>();
		columnNames.add("消费序号");
		columnNames.add("消费名称");
		columnNames.add("消费金额");
		columnNames.add("消费类型");
		columnNames.add("消费者");
		columnNames.add("消费时间");
		columnNames.add("消费地点");
		columnNames.add("消费备注");
		Vector<String> reallyColumnNames = new Vector<String>();
		reallyColumnNames.add("consume_id");
		reallyColumnNames.add("consume_name");
		reallyColumnNames.add("consume_price");
		reallyColumnNames.add("type");
		reallyColumnNames.add("consumer");
		reallyColumnNames.add("consume_date");
		reallyColumnNames.add("consume_place");
		reallyColumnNames.add("consume_remark");
		JxlUtil<Consume> export = new JxlUtil<Consume>();
		export.toExcel(savePath, sheetName, columnNames, reallyColumnNames, consumes);
	}
	public List<Graph> graph(Integer consumer_id) {
		List<Graph> graphs = new ArrayList<Graph>();
		List<Type> types = typeDao.findAll();
		List<Consume> consumes = consumeDao.findAll(consumer_id);
		for(Type type : types){
			Graph graph = new Graph();
			graph.setConsumer_id(consumer_id);
			graph.setType_id(type.getType_id());
			graph.setType_name(type.getType_name());
			Double total = 0.0;
			for(Consume consume : consumes){
				if(type.getType_id() == consume.getType().getType_id()){
					total += consume.getConsume_price();
				}
			}
			graph.setTotal(total);
			graphs.add(graph);
		}
		return graphs;
	}
}
