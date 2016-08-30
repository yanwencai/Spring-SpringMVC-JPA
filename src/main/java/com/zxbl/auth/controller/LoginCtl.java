package com.zxbl.auth.controller;

import ch.qos.logback.classic.Logger;
import com.zxbl.auth.model.AppResources;
import com.zxbl.auth.model.Person;
import com.zxbl.auth.model.PersonRole;
import com.zxbl.auth.model.RoleApps;
import com.zxbl.auth.model.tree.VAppResources;
import com.zxbl.auth.service.AppResourcesService;
import com.zxbl.auth.service.PersonRoleService;
import com.zxbl.auth.service.PersonService;
import com.zxbl.auth.service.RoleAppService;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2016/8/16.
 */
@Controller
public class LoginCtl {
    private static Logger logger = (Logger) LoggerFactory.getLogger(LoginCtl.class);

    @Resource
    private PersonService personService;
    @Resource
    private PersonRoleService personRoleService;
    @Resource
    private RoleAppService roleAppService;
    @Resource
    private AppResourcesService appResourcesService;

    @RequestMapping("login")
    public String login(HttpServletRequest request, HttpServletResponse response, java.lang.String userName, java.lang.String password) throws IOException {
        logger.info("login....");
        List<Person> persons = this.personService.getByUserNameAndPassword(userName, password);
        if (persons != null && persons.size() > 0) {
            request.getSession().setAttribute("user", persons.get(0));
            logger.info("登录成功。。。");
            return "admin/main";
        }

        response.sendRedirect("index.jsp");
        return null;
    }

    @RequestMapping("logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().removeAttribute("user");
        try {
            response.sendRedirect("index.jsp");
            logger.info("登出成功！");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取左侧的资源菜单
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getLefMenuTree")
    public Object getLefMenuTree(HttpServletRequest request) {
        String applicationCode = "auth";//系统代码
        HttpSession session = request.getSession();
        Person user = (Person) session.getAttribute("user");

        VAppResources vAppResources = null;
        if (user != null) {
            //通过personid获得roleID
            List<PersonRole> personRolesList = this.personRoleService.getByPersonId(user.getId());
            if (personRolesList != null && personRolesList.size() > 0) {
                //通过roleId获得appId
                List ids = new ArrayList();
                for (PersonRole pr : personRolesList) {
                    List<RoleApps> roleAppsList = this.roleAppService.getByRoleId(pr.getRoleId());
                    for (int i = 0; i < roleAppsList.size(); i++) {
                        ids.add(roleAppsList.get(i).getAppId());
                    }

                }
                //通过appid获取资源菜单，
                // List<AppResources> appResourcesList = this.appResourcesService.getByIdIn(ids);
                List app = new ArrayList();
                app.add(applicationCode);
                List<AppResources> appResourcesList = this.appResourcesService.getByIdInAndApplicationCodeIn(ids, app);
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
     *
     * @param appResourcesList
     * @return
     */
    private List<VAppResources> buildMenuTreeByParentId(List<AppResources> appResourcesList, Integer pid) {
        List<VAppResources> vAppResourcesList = new ArrayList<VAppResources>();
        for (AppResources app : appResourcesList) {
            if (app.getParentId() == pid) {
                VAppResources var = new VAppResources();
                BeanUtils.copyProperties(app, var);
                vAppResourcesList.add(var);
                var.setChildren(buildMenuTreeByParentId(appResourcesList, var.getId()));
            }
        }
        return vAppResourcesList;
    }
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

}
