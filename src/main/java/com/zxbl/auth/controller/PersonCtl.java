package com.zxbl.auth.controller;




import com.zxbl.auth.dao.IAuthPerson;
import com.zxbl.auth.model.Person;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.*;
import java.util.List;

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

    @ResponseBody
    @RequestMapping("admin/getAllPerson")
    public Object getAllPerson(){
        List<Person> all = this.iAuthPerson.getAll();
        return all;
    }
    @ResponseBody
    @RequestMapping("admin/updatePerson")
    public Object updatePerson(@RequestBody String rowData) throws UnsupportedEncodingException {
        Person p = new Person();
       String[] string = URLDecoder.decode(rowData,"utf-8").split("&");
        for(int i=0;i<string.length;i++){

            String[] attr = string[i].split("=");
            if(attr.length==2){
                if(attr[0].toString().equals("id")){
                    p.setId(Integer.parseInt(attr[1]));
                }else if(attr[0].toString().equals("workNumber")){
                    p.setWorkNumber(Integer.parseInt(attr[1]));
                }else if(attr[0].toString().equals("userName")){
                    p.setUserName(attr[1]);
                }else if(attr[0].toString().equals("password")){
                    p.setPassword(attr[1]);
                }else if(attr[0].toString().equals("realName")){
                    p.setRealName(attr[1]);
                }else if(attr[0].toString().equals("email")){
                    p.setEmail(attr[1]);
                }else if(attr[0].toString().equals("age")){
                    p.setAge(Integer.parseInt(attr[1]));
                }else if(attr[0].toString().equals("sex")){
                    p.setSex(Integer.parseInt(attr[1]));
                }
            }

        }
        p.setUpdateTime(new Date());
        this.iAuthPerson.updateById(p.getWorkNumber(),p.getUserName(),p.getPassword(),p.getRealName(),p.getEmail(),p.getAge(),p.getSex(),p.getUpdateTime(),p.getId());
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("msg","操作成功！");
        return map;
    }

}
