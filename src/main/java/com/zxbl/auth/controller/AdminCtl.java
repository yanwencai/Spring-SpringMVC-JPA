package com.zxbl.auth.controller;


import com.zxbl.auth.model.MenuTree;
import com.zxbl.auth.model.tree.VMenuTree;
import com.zxbl.auth.service.MenuTreeService;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;


/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class AdminCtl {

    @Resource
    private MenuTreeService menuTreeService;

    @ResponseBody
    @RequestMapping("admin/getLefMenuTree")
    public Object getLefMenuTree(){
        List<VMenuTree> vMenuTreeList = new ArrayList<VMenuTree>();
        List<MenuTree> treeList=this.menuTreeService.getByLevel(0);//顶级菜单
        for(MenuTree mt:treeList){
            List<MenuTree> pidList = this.menuTreeService.getByParentId(mt.getId());
            VMenuTree vMenuTree= new VMenuTree();
            BeanUtils.copyProperties(mt,vMenuTree);
            if (pidList != null) {
                vMenuTree.setChildren(pidList);
            }
            vMenuTreeList.add(vMenuTree);
        }
        return vMenuTreeList;
    }
}
