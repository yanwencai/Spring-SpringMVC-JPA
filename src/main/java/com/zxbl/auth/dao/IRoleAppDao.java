package com.zxbl.auth.dao;

import com.zxbl.auth.model.RoleApps;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Administrator on 2016/8/23.
 */
public interface IRoleAppDao extends CrudRepository<RoleApps,Integer> {

    List<RoleApps> getByRoleId(Integer roleId);

    @Modifying
    @Query("delete from RoleApps  r where r.roleId=:roleId")
    void delByRoleId(@Param("roleId") Integer roleId);
}
