package com.kx.exam.model;

public class Strategy {
	private String strategyid;
	private String typeid;
	private String typename;
	private String title;
	private String content;
	private String createdate;
	private String imgpath;
	
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}
	public String getStrategyid() {
		return strategyid;
	}
	public void setStrategyid(String strategyid) {
		this.strategyid = strategyid;
	}
	public String getTypeid() {
		return typeid;
	}
	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public Strategy(String strategyid, String typeid, String typename,
			String title, String content, String createdate) {
		super();
		this.strategyid = strategyid;
		this.typeid = typeid;
		this.typename = typename;
		this.title = title;
		this.content = content;
		this.createdate = createdate;
	}
	public Strategy() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
