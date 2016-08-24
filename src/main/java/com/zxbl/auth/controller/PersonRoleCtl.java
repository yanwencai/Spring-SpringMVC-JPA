package com.zxbl.auth.controller;

import ch.qos.logback.classic.Logger;
import com.zxbl.auth.model.Person;
import com.zxbl.auth.model.PersonRole;
import com.zxbl.auth.model.tree.PageInfo;
import com.zxbl.auth.service.PersonRoleService;
import com.zxbl.auth.service.PersonService;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.persistence.criteria.*;
import javax.persistence.criteria.Path;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色和用户对应关系
 * Created by Administrator on 2016/8/24.
 */

@Controller
public class PersonRoleCtl {

    private static Logger logger = (Logger) LoggerFactory.getLogger(PersonRoleCtl.class);

    @Resource
    private PersonService personService;

    @Resource
    private PersonRoleService personRoleService;

    @RequestMapping("admin/personRoleMgr")
    public String personRoleMgr() {
        return "role/personRoleMgr";
    }


    /**
     * 给角色添加用户
     *
     * @param userIds
     * @param roleId
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/addPersonRole")
    public Object addPersonRole(Integer[] userIds, Integer roleId) {
        List<PersonRole> personRoleList = new ArrayList<PersonRole>();
        Map<String, Object> map = new HashMap<String, Object>();
        if (userIds != null && userIds.length > 0) {
            for (int i = 0; i < userIds.length; i++) {
                PersonRole personRole = new PersonRole();
                personRole.setRoleId(roleId);
                personRole.setPersonId(userIds[i]);
                personRoleList.add(personRole);
            }
            this.personRoleService.save(personRoleList);
            map.put("msg", "添加成功！");
        } else {
            map.put("msg", "添加失败！");
        }
        return map;
    }

    /**
     * 查询角色下的所有用户
     * @param roleId
     * @param page
     * @param rows
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getPersonListByRoleId")
    public Object getPersonListByRoleId(Integer roleId, int page, int rows) {
        PageInfo pageInfo = new PageInfo();
        long l1 = System.currentTimeMillis();
        if (roleId != null && roleId > 0) {
            List<PersonRole> prList = this.personRoleService.getByRoleId(roleId);
            final List<Integer> ids = new ArrayList<Integer>();
            for (int i = 0; i < prList.size(); i++) {
                ids.add(((PersonRole) prList.get(i)).getPersonId());
            }
            //开始分页查询
            PageRequest pageRequest = new PageRequest(page - 1, rows);
            Specification specification = new Specification() {
                public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder cb) {
                    if (ids != null && ids.size() > 0) {
                        Predicate r1 = root.get("id").in(ids);
                        return r1;
                    }
                    return null;
                }
            };
            if (ids != null && ids.size() > 0) {
                Page<Person> personPage = this.personService.findByCondition(specification, pageRequest);
                pageInfo.setRows(personPage.getContent());
                pageInfo.setTotal(personPage.getTotalElements());
            } else {
                pageInfo.setRows(new ArrayList());
                pageInfo.setTotal(0l);
            }
        }
        long l2 = System.currentTimeMillis();
        logger.info("执行时间：" + (l2 - l1) + "毫秒");
        return pageInfo;
    }


    /**
     * 添加用户列表，排除已添加用户
     * @param request
     * @param page
     * @param rows
     * @param roleId
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/getAllPersonByNotIn")
    public Object getAllPersonByNotIn(HttpServletRequest request, int page, int rows, Integer roleId) {
        final String realName = request.getParameter("realName");
        final String workNumber2 = request.getParameter("workNumber");
        PageRequest pageRequest = new PageRequest(page - 1, rows);
        final List<PersonRole> byRoleIdList = this.personRoleService.getByRoleId(roleId);

        final List<Integer> idList = new ArrayList<Integer>();
        if (byRoleIdList != null && byRoleIdList.size() > 0) {
            for (PersonRole pr : byRoleIdList) {
                idList.add(pr.getPersonId());
            }
        }

        Specification specification = new Specification() {
            public Predicate toPredicate(Root root, CriteriaQuery query, CriteriaBuilder cb) {
                List<Predicate> predicateList = new ArrayList<Predicate>();
                if (realName != null && !"".equals(realName)) {
                    Path realName1 = root.get("realName");
                    Predicate rl = cb.and(cb.like(realName1, "%" + realName + "%"));
                    predicateList.add(rl);
                }
                if (workNumber2 != null && !"".equals(workNumber2)) {
                    Path workNumber1 = root.get("workNumber");
                    Predicate r2 = cb.and(cb.equal(workNumber1, workNumber2));
                    predicateList.add(r2);
                }
                if (byRoleIdList != null && byRoleIdList.size() > 0) {
                    Path id = root.get("id");
                    Predicate r3 = cb.and(cb.not(id.in(idList)));

                 /*   Predicate r3=root.get("id").in(idList);
                    Predicate r4 = cb.and(cb.not(r3));*/
                    predicateList.add(r3);
                }
                Predicate[] predicates = new Predicate[predicateList.size()];
                return query.where(predicateList.toArray(predicates)).getRestriction();
            }
        };
        // Page<Person> all = this.personService.findAll(pageRequest);
        Page<Person> all = this.personService.findByCondition(specification, pageRequest);
        PageInfo pi = new PageInfo();
        pi.setRows(all.getContent());
        pi.setTotal(all.getTotalElements());
        return pi;
    }


    /**
     * 从角色中移除用户（移除权限）
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping("admin/removeFromRole")
    public Object removeFromRole(Integer[] ids){
        Map<String,Object> map = new HashMap<String, Object>();
        if(ids!=null&&ids.length>0){
            this.personRoleService.delByPersonId(ids);
            map.put("msg","操作成功！");
            return map;
        }
        map.put("msg","操作失败！");
        return map;
    }



}
