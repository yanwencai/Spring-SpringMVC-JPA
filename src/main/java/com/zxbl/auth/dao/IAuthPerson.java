package com.zxbl.auth.dao;


import com.zxbl.auth.model.Person;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;

import java.util.List;


/**
 * Created by Administrator on 2016/8/9.
 */

public interface IAuthPerson extends Repository<Person,Integer> {

    public List<Person> getByUserNameAfter(String userName);

    @Query("select p from Person p")
    public List<Person> getAll();
}
