package com.ly.controller;

import org.springframework.stereotype.Controller;

import com.ly.service.CatelogService;

import javax.annotation.Resource;


@Controller
public class CatelogController {
    @Resource
    private CatelogService catelogService;

}
