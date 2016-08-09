package com.zxbl.auth.dao;


import com.zxbl.auth.model.Person;
import org.springframework.data.repository.Repository;
import org.springframework.data.repository.RepositoryDefinition;

import java.util.List;


/**
 * Created by Administrator on 2016/8/9.
 */

public interface IAuthPerson extends Repository<Person,Integer> {

    public List<Person> getByUsernameAfter(String username);
}
