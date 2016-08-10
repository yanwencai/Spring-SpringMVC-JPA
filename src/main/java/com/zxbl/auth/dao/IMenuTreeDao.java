package com.zxbl.auth.dao;


import com.zxbl.auth.model.MenuTree;
import org.springframework.data.repository.Repository;

import java.util.List;

/**
 * Created by Administrator on 2016/8/10.
 */

public interface IMenuTreeDao extends Repository<MenuTree,Integer>{

    public List<MenuTree> getByLevel(int level);

    public List<MenuTree> getByParentId(int pid);

    public List<MenuTree> getByLevelAndParentId(int level,int pid);
}
