package com.ly.dao;

import java.util.List;

import com.ly.pojo.Notice;
import com.ly.pojo.NoticeExtend;

public interface NoticeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Notice record);

    int insertSelective(Notice record);

    Notice selectByPrimaryKey(Integer id);
    
	public List<Notice> getNoticeList();

    int updateByPrimaryKeySelective(Notice record);

    int updateByPrimaryKeyWithBLOBs(Notice record);

    int updateByPrimaryKey(Notice record);
}