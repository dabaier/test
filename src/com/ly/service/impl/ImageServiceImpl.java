package com.ly.service.impl;

import org.springframework.stereotype.Service;

import com.ly.dao.ImageMapper;
import com.ly.pojo.Image;
import com.ly.service.ImageService;

import javax.annotation.Resource;
import java.util.List;


@Service("imageService")
public class ImageServiceImpl implements ImageService {
    @Resource
    private ImageMapper imageMapper;
    public int insert(Image record) {
        return imageMapper.insert(record);
    }
    public List<Image> getImagesByGoodsPrimaryKey(Integer goodsId) {
        List<Image> image = imageMapper.selectByGoodsPrimaryKey(goodsId);
        return image;
    }
    public int deleteImagesByGoodsPrimaryKey(Integer goodsId) {
        return imageMapper.deleteImagesByGoodsPrimaryKey(goodsId);
    }
}
