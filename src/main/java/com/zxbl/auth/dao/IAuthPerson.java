package com.zxbl.auth.dao;



import com.zxbl.auth.model.Person;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import sun.reflect.generics.tree.VoidDescriptor;

import java.util.Date;
import java.util.List;


/**
 * Created by Administrator on 2016/8/9.
 */

public interface IAuthPerson extends PagingAndSortingRepository<Person,Integer> {

    public List<Person> getByUserNameAfter(String userName);

    @Query("select p from Person p")
    public List<Person> getAll();

   // @Transactional(propagation = Propagation.REQUIRED)
   // @Transactional(readOnly = true)
    @Modifying
    @Query("update Person p set p.workNumber=?1,p.userName=?2,p.password=?3,p.realName=?4,p.email=?5,p.age=?6,p.sex=?7,p.updateTime=?8,p.createTime=?9 where p.id=?10")
    public void updateById(int workNumber, String userName, String password, String realName, String email, int age, int sex, Date updateTime, Date createTime, int id);
}
