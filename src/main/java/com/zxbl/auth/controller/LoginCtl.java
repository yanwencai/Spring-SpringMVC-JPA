package com.zxbl.auth.controller;

import ch.qos.logback.classic.Logger;
import com.zxbl.auth.model.Person;
import com.zxbl.auth.service.PersonService;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by Administrator on 2016/8/16.
 */
@Controller
public class LoginCtl {
private static Logger logger= (Logger) LoggerFactory.getLogger(LoginCtl.class);

    @Resource
    private PersonService personService;

    @RequestMapping("login")
    public String login(HttpServletRequest request, HttpServletResponse response, java.lang.String userName, java.lang.String password) throws IOException {
        logger.info("login....");
        List<Person> persons = this.personService.getByUserNameAndPassword(userName, password);
        if(persons!=null&&persons.size()>0){
            request.getSession().setAttribute("user",persons.get(0));

            return "admin/main";
        }

        return "index.jsp";
    }
}
