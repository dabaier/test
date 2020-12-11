package com.ly.service.impl;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.ly.dao.NoticeMapper;
import com.ly.pojo.Notice;
import com.ly.pojo.NoticeExtend;
import com.ly.service.NoticeService;

@Service("NoticeService")
public class NoticeServiceImpl implements NoticeService{
	 @Resource
	 private NoticeMapper noticeMapper;

	@Override
	public List<Notice> getNoticeList() {
		
		return noticeMapper.getNoticeList();
	}

	@Override
	public void insertSelective(Notice notice) {
		noticeMapper.insertSelective(notice);
		
	}




}
