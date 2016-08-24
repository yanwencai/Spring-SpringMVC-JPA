package com.zxbl.auth.service;

import com.zxbl.auth.dao.IRoleDao;
import com.zxbl.auth.model.Role;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by Administrator on 2016/8/22.
 */
@Service
public class RoleService {

    @Resource
    private IRoleDao iRoleDao;

    public Page<Role> findAll(Specification specification, Pageable pageable) {
        return this.iRoleDao.findAll(specification, pageable);
    }

    public Role save(Role role) {
        return this.iRoleDao.save(role);
    }

    public List<Role> getByRoleCode(String roleCode) {
        return this.iRoleDao.getByRoleCode(roleCode);
    }

    public void delete(int id) {
        this.iRoleDao.delete(id);
    }
}
