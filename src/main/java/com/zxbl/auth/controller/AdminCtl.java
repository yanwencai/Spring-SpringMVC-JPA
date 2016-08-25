package com.zxbl.auth.controller;


import ch.qos.logback.classic.Logger;
import com.zxbl.auth.model.*;
import com.zxbl.auth.model.tree.VAppResources;
import com.zxbl.auth.service.AppResourcesService;
import com.zxbl.auth.service.PersonRoleService;
import com.zxbl.auth.service.RoleAppService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


/**
 * Created by Administrator on 2016/8/9.
 */
@Controller
public class AdminCtl {

    private static Logger logger = (Logger) LoggerFactory.getLogger(AdminCtl.class);


    @Resource
    private PersonRoleService personRoleService;

    @Resource
    private RoleAppService roleAppService;

    @Resource
    private AppResourcesService appResourcesService;

   /* @ResponseBody
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
    }*/

    /**
     * 获取左侧的资源菜单
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getLefMenuTree")
    public Object getLefMenuTree(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String applicationCode = "auth";
        HttpSession session = request.getSession();
        Person user = (Person) session.getAttribute("user");

        VAppResources vAppResources = null;
        if (user != null) {
            //通过personid获得roleID
            List<PersonRole> personRolesList = this.personRoleService.getByPersonId(user.getId());
            if (personRolesList != null && personRolesList.size() > 0) {
                //通过roleId获得appId
                List ids=new ArrayList();
                for (PersonRole pr : personRolesList) {
                    List<RoleApps> roleAppsList = this.roleAppService.getByRoleId(pr.getRoleId());
                    for(int i=0;i<roleAppsList.size();i++){
                        ids.add(roleAppsList.get(i).getAppId());
                    }

                }
                List<AppResources> appResourcesList = this.appResourcesService.getByIdIn(ids);
                List<VAppResources> vAppResourcesList = buildMenuTreeByParentId(appResourcesList, 0);
                System.out.println(vAppResourcesList);
                return vAppResourcesList;
            }
        } else {
            logger.error("user is null,session 超时，");
        }

        return vAppResources;
    }

    /**
     * 登录后构建菜单
     * @param appResourcesList
     * @return
     */
    private List<VAppResources> buildMenuTreeByParentId(List<AppResources> appResourcesList,Integer pid){
        List<VAppResources> vAppResourcesList = new ArrayList<VAppResources>();
        for(AppResources app:appResourcesList){
            if(app.getParentId()==pid){
                VAppResources var=new VAppResources();
                BeanUtils.copyProperties(app,var);
                vAppResourcesList.add(var);
                var.setChildren(buildMenuTreeByParentId(appResourcesList,var.getId()));;
            }
        }
        return vAppResourcesList;
    }

}
