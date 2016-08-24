package com.zxbl.auth.dao;

import com.zxbl.auth.model.Role;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/8/22.
 */
public interface IRoleDao extends JpaSpecificationExecutor<Role> ,CrudRepository<Role,Integer>{


    List<Role> getByRoleCode(String roleCode);
}
