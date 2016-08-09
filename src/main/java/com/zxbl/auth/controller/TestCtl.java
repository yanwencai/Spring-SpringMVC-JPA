package com.zxbl.auth.controller;

import com.zxbl.auth.service.PersonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class TestCtl {
    @Resource
    private PersonService personService;

    @RequestMapping("test")
    public String test(){
        System.out.println("run...");
        return "test";
    }


}
