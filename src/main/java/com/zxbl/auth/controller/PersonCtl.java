package com.zxbl.auth.controller;


import com.zxbl.auth.dao.IAuthPerson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class PersonCtl {



    @Resource
    private IAuthPerson iAuthPerson;

    @RequestMapping("admin/toMainPage")
    public java.lang.String toMainPage(){

        return "admin/main";
    }
    @RequestMapping("admin/leftMenu")
    public java.lang.String leftMenu(){
        return "admin/leftMenu";
    }

    @RequestMapping("admin/personMgr")
    public java.lang.String personMgr(){
        return "person/personMgr";
    }

}
