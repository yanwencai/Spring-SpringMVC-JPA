package com.zxbl.auth.service;

import com.zxbl.auth.dao.IAuthPerson;
import com.zxbl.auth.model.Person;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/8/9.
 */
@Service
public class PersonService {
    @Resource
    private IAuthPerson iAuthPerson;
    public List<Person> getByUsernameAfter(String username){
        return this.iAuthPerson.getByUserNameAfter(username);
    }
    public List<Person> getAll(){
        return this.iAuthPerson.getAll();
    }


    public void updateById(int workNumber, String userName, String password, String realName, String email, int age, int sex, Date updateTime, int id){
        this.iAuthPerson.updateById(workNumber,userName,password,realName,email,age,sex,updateTime,id);
    }

}
