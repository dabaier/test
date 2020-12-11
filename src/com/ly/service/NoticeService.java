package com.ly.service;

import java.util.List;

import com.ly.pojo.Notice;
import com.ly.pojo.NoticeExtend;

public interface NoticeService {

	List<Notice> getNoticeList();
	
	public void insertSelective(Notice notice);
	
	



}
