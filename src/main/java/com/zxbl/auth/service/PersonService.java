package com.zxbl.auth.service;

import com.zxbl.auth.dao.IAuthPerson;
import com.zxbl.auth.model.Person;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
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

    public List<Person> getByUserName(String username){
        return this.iAuthPerson.getByUserName(username);
    }
    public List<Person> getAll(){
        return this.iAuthPerson.getAll();
    }

    public Page<Person> findAll(Pageable pageable){
        return this.iAuthPerson.findAll(pageable);
    }

    /**
     * 带条件的分页查询
     * @param specification
     * @param pageable
     * @return
     */
    public Page<Person> findByCondition(Specification specification, Pageable pageable){
        return this.iAuthPerson.findAll(specification,pageable);
    }


    public void updateById(int workNumber, String userName, String password, String realName, String email, int age, int sex, Date updateTime,String createTime, int id){
        this.iAuthPerson.updateById(workNumber,userName,password,realName,email,age,sex,updateTime,createTime,id);
    }

    public Person saveAndFlush(Person person){
        return this.iAuthPerson.saveAndFlush(person);
    }


    public List<Person> getByUserNameAndPassword(String userName,String password){
        return this.iAuthPerson.getByUserNameAndPassword(userName,password);
    }

    public List<Person> getByIdInOrderByIdAsc(Integer[] ids){
        return this.iAuthPerson.getByIdInOrderByIdAsc(ids);
    }

    public Integer getMaxWorkNumber(){
        return this.iAuthPerson.getMaxWorkNumber();
    }
}
