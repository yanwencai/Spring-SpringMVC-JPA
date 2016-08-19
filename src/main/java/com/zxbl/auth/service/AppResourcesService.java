package com.zxbl.auth.service;

import com.zxbl.auth.dao.AppResourcesDao;
import com.zxbl.auth.model.AppResources;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/8/17.
 */
@Service
public class AppResourcesService {

    @Resource
    private AppResourcesDao appResourcesDao;

    public AppResources save(AppResources appResources){
        return this.appResourcesDao.save(appResources);
    }

    public List<AppResources> getByParentIdOrderByOrderIdAsc(int pid){
        return this.appResourcesDao.getByParentIdOrderByOrderIdAsc(pid);
    }


    public void delete(Integer id){
        this.appResourcesDao.delete(id);
    }


}
