package com.zxbl.auth.controller;

import com.zxbl.auth.model.AppResources;
import com.zxbl.auth.model.tree.VAppResources;
import com.zxbl.auth.model.tree.VMenuTree;
import com.zxbl.auth.service.AppResourcesService;
import org.apache.taglibs.standard.tag.el.fmt.RequestEncodingTag;
import org.hibernate.type.UUIDBinaryType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 应用管理，
 * 1.应用名
 * 2.url
 * 3.level 0:顶级（应用信息） >0：应用菜单信息
 * 4.parentid
 *
 * Created by Administrator on 2016/8/17.
 */

@Controller
public class AppCtl {

    private static Logger logger = LoggerFactory.getLogger(AppCtl.class);

    @Resource
    private AppResourcesService appResourcesService;

    @RequestMapping("admin/appMgr")
    public String appMgr(){
        logger.info("跳转到appMgr.jsp页面");
        return "app/appMgr";
    }


    @ResponseBody
    @RequestMapping("admin/addApp")
    public Object addApp(AppResources app){
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = sdf.format(System.currentTimeMillis());
        if(app.getId()!=null&&app.getId()>0){//update 操作
            app.setUpdateTime(currentTime);
        }else{//新增操作
            app.setCreateTime(currentTime);
        }
        this.appResourcesService.save(app);
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("msg","操作成功！");
        logger.info("addApp： 添加成功。。。");
        return map;
    }

    /**
     * 随着应用和菜单的增加，推荐使用需要加载的方式，不要一次全部加载
     * @param pid
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getAppByParentId")
    public Object getAppByParentId(HttpServletRequest request){
        String parameter = request.getParameter("id");
        int id=0;
        if(parameter!=null){
            id=Integer.parseInt(parameter);
        }

        System.out.println("pid:"+id);
        return this.appResourcesService.getByParentIdOrderByOrderIdAsc(id);
    }


    @ResponseBody
    @RequestMapping("admin/getAllApp")
    public Object getAllApp(){
        List childApp = getChildApp(0);
        return childApp;
    }
    /**
     * 递归获取所有菜单和子菜单
     * @param parentId
     * @return
     */
    public List getChildApp(int parentId){
        List childresourcesList=new ArrayList();
        List<AppResources> appResourcesList = this.appResourcesService.getByParentIdOrderByOrderIdAsc(parentId);
        if(appResourcesList!=null&&appResourcesList.size()>0){
            for(AppResources app:appResourcesList){
                VAppResources vr=new VAppResources();
                BeanUtils.copyProperties(app,vr);
                vr.setChildren(getChildApp(vr.getId()));
                childresourcesList.add(vr);
            }
        }
        return childresourcesList;
    }

}
