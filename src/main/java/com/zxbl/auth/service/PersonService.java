package com.zxbl.auth.service;

import com.zxbl.auth.dao.IAuthPerson;
import com.zxbl.auth.model.Person;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/8/9.
 */
@Service
public class PersonService {
    @Resource
    private IAuthPerson iAuthPerson;
    public List<Person> getByUsernameAfter(String username){
        return this.iAuthPerson.getByUsernameAfter(username);
    }

}
