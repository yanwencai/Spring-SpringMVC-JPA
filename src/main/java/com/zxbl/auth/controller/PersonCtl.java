package com.zxbl.auth.controller;





import com.zxbl.auth.model.Person;
import com.zxbl.auth.model.tree.PageInfo;
import com.zxbl.auth.service.PersonService;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.annotation.Resource;
import javax.enterprise.inject.Model;
import javax.persistence.criteria.*;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;
import java.util.List;

/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class PersonCtl {


    @Resource
    private PersonService personService;

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
    public Object getAllPerson(HttpServletRequest request, int page, int rows){
        final String realName = request.getParameter("realName");
        final String workNumber2 = request.getParameter("workNumber");
        PageRequest pageRequest=new PageRequest(page-1,rows);

        Specification specification=new Specification() {
            public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder cb) {
                List<Predicate> predicateList=new ArrayList<Predicate>();
                if(realName!=null && !"".equals(realName)){
                    Path realName1 = root.get("realName");
                    Predicate rl =cb.and(cb.like(realName1, "%"+realName+"%"));
                    predicateList.add(rl);
                }
                if(workNumber2!=null && !"".equals(workNumber2)){
                    Path workNumber1 = root.get("workNumber");
                    Predicate r2 = cb.and(cb.equal(workNumber1,workNumber2));
                    predicateList.add(r2);
                }
                Predicate[] predicates = new Predicate[predicateList.size()];
                return query.where(predicateList.toArray(predicates)).getRestriction();
            }
        };
       // Page<Person> all = this.personService.findAll(pageRequest);
        Page<Person> all = this.personService.findByCondition(specification, pageRequest);
        PageInfo pi=new PageInfo();
        pi.setRows(all.getContent());
        pi.setTotal(all.getTotalElements());
        return pi;
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
                }else if(attr[0].toString().equals("createTime")){
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    try {
                        Date parse = sdf.parse(attr[1]);
                      //  p.setCreateTime(parse);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }

                }
            }

        }
        p.setUpdateTime(new Date());
       // this.personService.updateById(p.getWorkNumber(),p.getUserName(),p.getPassword(),p.getRealName(),p.getEmail(),p.getAge(),p.getSex(),p.getUpdateTime(),p.getCreateTime(),p.getId());
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("msg","操作成功！");
        return map;
    }

    @ResponseBody
    @RequestMapping("admin/modifyPerson")
    public Object modifyPerson(Person p){
        System.out.println(p);
        this.personService.updateById(p.getWorkNumber(),p.getUserName(),p.getPassword(),p.getRealName(),p.getEmail(),p.getAge(),p.getSex(),p.getUpdateTime(),p.getCreateTime(),p.getId());

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("msg","操作成功！");
        return map;
    }


    @ResponseBody
    @RequestMapping("admin/addPerson")
    public Object addPerson(Person p){
        System.out.println(p);
        this.personService.saveAndFlush(p);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg","操作成功！");
        return map;
    }

}
