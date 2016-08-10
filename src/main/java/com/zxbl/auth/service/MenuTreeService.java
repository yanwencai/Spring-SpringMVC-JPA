package com.zxbl.auth.service;

import com.zxbl.auth.dao.IMenuTreeDao;
import com.zxbl.auth.model.MenuTree;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/8/10.
 */
@Service
public class MenuTreeService {

    @Resource
    private IMenuTreeDao iMenuTreeDao;

    public List<MenuTree> getByLevel(int level){
        return this.iMenuTreeDao.getByLevel(level);
    }

    public List<MenuTree> getByParentId(int pid){
        return this.iMenuTreeDao.getByParentId(pid);
    }

    public List<MenuTree> getByLevelAndParentId(int level,int pid){
        return this.iMenuTreeDao.getByLevelAndParentId(level,pid);
    }
}
