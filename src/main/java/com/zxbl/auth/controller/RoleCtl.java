package com.zxbl.auth.controller;

import com.zxbl.auth.model.AppResources;
import com.zxbl.auth.model.Role;
import com.zxbl.auth.model.RoleApps;
import com.zxbl.auth.model.tree.PageInfo;
import com.zxbl.auth.model.tree.VAppResources;
import com.zxbl.auth.service.AppResourcesService;
import com.zxbl.auth.service.RoleAppService;
import com.zxbl.auth.service.RoleService;
import org.springframework.beans.BeanUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.*;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/8/22.
 */

@Controller
public class RoleCtl {

    @Resource
    private RoleService roleService;

    @Resource
    private AppResourcesService appResourcesService;

    @Resource
    private RoleAppService roleAppService;

    @RequestMapping("admin/roleMgr")
    public String roleMgr() {
        return "role/roleMgr";
    }

    @ResponseBody
    @RequestMapping("admin/addRole")
    public Object addRole(Role role){
        System.out.println("addRole...");
        this.roleService.save(role);

        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg","操作成功！");
        return map;
    }


    @ResponseBody
    @RequestMapping("admin/modifyRole")
    public Object modifyRole(Role role){
        Map<String,Object> map=new HashMap<String, Object>();
        if(role.getId()!=null&&role.getId()>0){
            this.roleService.save(role);
            map.put("msg","操作成功！");

        }else {
            map.put("msg","修改失败！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping("admin/removeRole")
    public Object removeRole(Integer id){
        Map<String,Object> map=new HashMap<String, Object>();
        if(id!=null&&!"".equals(id)){
            this.roleService.delete(id);
            map.put("msg","删除成功！");

        }else {
            map.put("msg","删除失败！");
        }
        return map;
    }

    /**
     * 检查roleCode是否被占用
     * @param roleCode
     * @return 占用:false 未占用：true
     */
    @ResponseBody
    @RequestMapping("admin/roleCodeChk")
    public Object roleCodeChk(String roleCode){
        if(roleCode!=null&&!"".equals(roleCode)){
            List<Role> roleList = this.roleService.getByRoleCode(roleCode);
            if(roleList!=null&&roleList.size()>0){
                return false;
            }
        }
        return true;
    }


    /**
     * 分页查询
     * @param page
     * @param rows
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getRole")
    public Object getRole(int page, int rows) {

        PageRequest pageRequest = new PageRequest(page-1, rows);
        Specification specification = new Specification() {
            public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder criteriaBuilder) {
                List<Predicate> predicateList = new ArrayList<Predicate>();

                Predicate[] predicates = new Predicate[predicateList.size()];
                return query.where(predicateList.toArray(predicates)).getRestriction();
            }
        };
        Page<Role> rolePage = this.roleService.findAll(specification, pageRequest);
        PageInfo pageInfo=new PageInfo();
        pageInfo.setTotal(rolePage.getTotalElements());
        pageInfo.setRows(rolePage.getContent());

        return pageInfo;
    }


    /**
     * 授权时列出所有的资源菜单
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getAuthMenuTree")
    public Object getAuthMenuTree(Integer id){
        if(id!=null&&id>0){
            return null;
        }else{
            List childApp = getChildApp(0);
            return childApp;
            // return "[{\"id\":3,\"level\":0,\"orderId\":1,\"parentId\":0,\"url\":\"http://localhost:8081/auth/login\",\"text\":\"通用权限管理系统\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":true,\"createTime\":\"2016-08-18 10:03:42\",\"updateTime\":\"2016-08-18 11:12:13\",\"children\":[{\"id\":5,\"level\":null,\"orderId\":1,\"parentId\":3,\"url\":\"2222\",\"text\":\"人员管理模块\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 10:04:39\",\"updateTime\":\"2016-08-18 11:12:55\",\"children\":[{\"id\":9,\"level\":null,\"orderId\":1,\"parentId\":5,\"url\":\"333\",\"text\":\"人员管理\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 11:00:57\",\"updateTime\":\"2016-08-18 11:13:17\",\"children\":[]},{\"id\":10,\"level\":null,\"orderId\":2,\"parentId\":5,\"url\":\"2\",\"text\":\"人员统计\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 11:13:35\",\"updateTime\":null,\"children\":[]},{\"id\":11,\"level\":null,\"orderId\":3,\"parentId\":5,\"url\":\"3\",\"text\":\"人员分析\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 11:14:10\",\"updateTime\":null,\"children\":[]}]},{\"id\":6,\"level\":null,\"orderId\":2,\"parentId\":3,\"url\":\"2222\",\"text\":\"资源管理模块\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 10:07:38\",\"updateTime\":\"2016-08-18 11:14:38\",\"children\":[{\"id\":12,\"level\":null,\"orderId\":1,\"parentId\":6,\"url\":\"1\",\"text\":\"应用管理\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 11:15:20\",\"updateTime\":null,\"children\":[]},{\"id\":13,\"level\":null,\"orderId\":2,\"parentId\":6,\"url\":\"2\",\"text\":\"应用菜单管理\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 11:21:13\",\"updateTime\":null,\"children\":[]}]},{\"id\":7,\"level\":null,\"orderId\":3,\"parentId\":3,\"url\":\"2222\",\"text\":\"角色管理模块\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 10:20:01\",\"updateTime\":\"2016-08-19 10:32:11\",\"children\":[{\"id\":14,\"level\":null,\"orderId\":1,\"parentId\":7,\"url\":\"1\",\"text\":\"角色管理\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-19 10:33:02\",\"updateTime\":null,\"children\":[]},{\"id\":15,\"level\":null,\"orderId\":2,\"parentId\":7,\"url\":\"2\",\"text\":\"角色授权\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-19 10:33:30\",\"updateTime\":null,\"children\":[]}]}]},{\"id\":4,\"level\":0,\"orderId\":2,\"parentId\":0,\"url\":\"2222\",\"text\":\"业务系统1\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-18 10:03:59\",\"updateTime\":\"2016-08-23 09:46:55\",\"children\":[{\"id\":16,\"level\":null,\"orderId\":1,\"parentId\":4,\"url\":\"1\",\"text\":\"菜单1\",\"state\":\"open\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-23 09:46:39\",\"updateTime\":\"2016-08-23 09:47:10\",\"children\":[]},{\"id\":17,\"level\":null,\"orderId\":2,\"parentId\":4,\"url\":\"2\",\"text\":\"菜单2\",\"state\":\"closed\",\"iconCls\":\"\",\"checked\":false,\"createTime\":\"2016-08-23 09:47:49\",\"updateTime\":\"2016-08-23 09:47:56\",\"children\":[]}]}]";
        }
    }

    /**
     * 递归获取所有菜单和子菜单
     *
     * @param parentId
     * @return
     */
    public List getChildApp(int parentId) {
        List childresourcesList = new ArrayList();
        List<AppResources> appResourcesList = this.appResourcesService.getByParentIdOrderByOrderIdAsc(parentId);
        if (appResourcesList != null && appResourcesList.size() > 0) {
            for (AppResources app : appResourcesList) {
                VAppResources vr = new VAppResources();
                BeanUtils.copyProperties(app, vr);
                vr.setChildren(getChildApp(vr.getId()));
                childresourcesList.add(vr);
            }
        }
        return childresourcesList;
    }

    /**
     * 前台只传叶子节点
     * @param idArray
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/saveAuth")
    public Object saveAuth(Integer[] idArray,Integer roleId){
        //保存之前删除老的记录
        this.roleAppService.delByRoleId(roleId);
        List<RoleApps> roleAppsList=new ArrayList<RoleApps>();
        for(int i=0;i<idArray.length;i++){
            RoleApps roleApps=new RoleApps();
            roleApps.setRoleId(roleId);
            roleApps.setAppId(idArray[i]);
            roleAppsList.add(roleApps);
        }
        this.roleAppService.save(roleAppsList);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg","操作成功");
        return map;
    }


    /**
     * 通过roleId获取该角色分配的资源
     * @param roleId
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getAppByRoleId")
    public Object getAppByRoleId(Integer roleId){
        return this.roleAppService.getByRoleId(roleId);
    }


}
