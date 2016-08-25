package com.zxbl.auth.dao;

import com.zxbl.auth.model.PersonRole;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/8/24.
 */
public interface IPersonRoleDao extends CrudRepository<PersonRole, Integer> {

    List<PersonRole> getByRoleId(Integer roleId);

    List<PersonRole> getByPersonId(Integer personId);


    @Modifying
    @Query("delete from PersonRole  p where p.personId in (?1)")
    void delByPersonId(Integer[] ids);

}
