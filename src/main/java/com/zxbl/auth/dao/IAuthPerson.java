package com.zxbl.auth.dao;


import com.zxbl.auth.model.Person;
import org.omg.CORBA.INTERNAL;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.CrudRepository;
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

public interface IAuthPerson extends PagingAndSortingRepository<Person, Integer>, JpaRepository<Person, Integer>, JpaSpecificationExecutor<Person> {

    public List<Person> getByUserName(String userName);

    public List<Person> getByUserNameAndPassword(String userName, String password);

    @Query("select p from Person p")
    public List<Person> getAll();

    // @Transactional(propagation = Propagation.REQUIRED)
    // @Transactional(readOnly = true)
    @Modifying
    @Query("update Person p set p.workNumber=?1,p.userName=?2,p.password=?3,p.realName=?4,p.email=?5,p.age=?6,p.sex=?7,p.updateTime=?8,p.createTime=?9 where p.id=?10")
    public void updateById(int workNumber, String userName, String password, String realName, String email, int age, int sex, Date updateTime, String createTime, int id);

    List<Person> getByIdInOrderByIdAsc(Integer[] ids);


    @Query("select max (workNumber) from Person")
    Integer getMaxWorkNumber();

}
