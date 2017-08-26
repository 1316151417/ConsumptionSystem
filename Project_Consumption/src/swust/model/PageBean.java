package swust.model;

import java.util.List;

public class PageBean<T> {
	private int currentPage;
//	private int totalPage;
	private int totalRecord;
	private int pageSize;
	private List<T> beanList;
	private String url;
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		int totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0 ? 0 : 1);
		return totalPage;
	}
//	public void setTotalPage(int totalPage) {
//		this.totalPage = totalPage;
//	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public List<T> getBeanList() {
		return beanList;
	}
	public void setBeanList(List<T> beanList) {
		this.beanList = beanList;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
