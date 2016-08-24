package com.zxbl.auth.service;

import com.zxbl.auth.dao.IPersonRoleDao;
import com.zxbl.auth.model.PersonRole;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/8/24.
 */
@Service
public class PersonRoleService {

    @Resource
    private IPersonRoleDao iPersonRoleDao;

    public void save(Iterable iterable){
        this.iPersonRoleDao.save(iterable);
    }

    public List<PersonRole> getByRoleId(Integer roleId){
        return this.iPersonRoleDao.getByRoleId(roleId);
    }

    public  void delByPersonId(Integer[] ids){
        this.iPersonRoleDao.delByPersonId(ids);
    }

}
