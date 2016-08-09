package com.zxbl.auth.controller;


import com.zxbl.auth.model.tree.MenuTree;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;


/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class AdminCtl {

    @ResponseBody
    @RequestMapping("admin/getLefMenuTree")
    public Object getLefMenuTree(){
        List<MenuTree> treeList=new ArrayList<MenuTree>();
        for(int i=0;i<10;i++){
            MenuTree menuTree=new MenuTree();
            menuTree.setId(i);
            menuTree.setText("菜单"+i);
            menuTree.setState("open");
            treeList.add(menuTree);
        }
        return treeList;
    }
}
