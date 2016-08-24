package com.zxbl.auth.service;

import com.zxbl.auth.dao.IRoleAppDao;
import com.zxbl.auth.model.RoleApps;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2016/8/23.
 */
@Service
public class RoleAppService {

    @Resource
    private IRoleAppDao iRoleAppDao;

    public void save(RoleApps roleApps){
        this.iRoleAppDao.save(roleApps);
    }

    public void save(Iterable iterable){
        this.iRoleAppDao.save(iterable);
    }

    public List<RoleApps> getByRoleId(Integer roleId){
        return this.iRoleAppDao.getByRoleId(roleId);
    }

    public void delByRoleId(Integer roleId){
        this.iRoleAppDao.delByRoleId(roleId);
    }
}
