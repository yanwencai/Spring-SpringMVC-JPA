package com.zxbl.auth.controller;

import com.zxbl.auth.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class TestCtl {


    @Resource
    private PersonService personService;

    @RequestMapping("test")
    public java.lang.String test(){
        System.out.println("run...");
        return "test";
    }



}
