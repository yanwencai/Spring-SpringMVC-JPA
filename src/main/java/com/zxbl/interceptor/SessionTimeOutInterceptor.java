package com.zxbl.interceptor;

import ch.qos.logback.classic.Logger;
import com.zxbl.auth.model.Person;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2016/8/16.
 */
public class SessionTimeOutInterceptor implements HandlerInterceptor {

    private static Logger logger= (Logger) LoggerFactory.getLogger(SessionTimeOutInterceptor.class);

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

       String requestUrl=request.getRequestURI();
        //for(String url:allowU)
        Person user = (Person) request.getSession().getAttribute("user");

        if(user==null){
            logger.info("session 已超时！");
            response.sendRedirect("/auth/index.jsp");
            return false;
        }else{
            logger.info("session超时检查：未超时，当前用户："+user.getUserName()+","+user.getRealName());
            return true;
        }
    }

    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
