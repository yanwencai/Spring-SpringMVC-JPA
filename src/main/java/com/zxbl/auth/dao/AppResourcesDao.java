package com.zxbl.auth.dao;

import com.zxbl.auth.model.AppResources;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Administrator on 2016/8/17.
 */
public interface AppResourcesDao extends CrudRepository<AppResources,Integer> {

    public List<AppResources> getByParentIdOOrderByOrderIdDesc(int pid);

}
