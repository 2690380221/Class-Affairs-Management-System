package com.ks.service;
import com.ks.bean.User;
import com.ks.mapper.LoginMapper;
import com.ks.util.*;
import org.apache.ibatis.session.SqlSession;

import java.util.function.LongFunction;

/**
 *
 */
public class LoginService {
    public User login(String uname, String upwd) {
        User user=new User();
        if(StringUtil.isEmpty(uname)||StringUtil.isEmpty(upwd)){
            user.setuId(-1);
            return user;
        }

        SqlSession session=GetSqlSession.createsqlsession();
        LoginMapper loginMapper=session.getMapper(LoginMapper.class);
        user=loginMapper.queryUserByName(uname);

        if(user==null){
            User u=new User();
            u.setuId(-1);
            return u;
        }
        if(!user.getuPwd().equals(upwd)){
            System.out.println("p:"+user.getuPwd()+"  "+upwd);
            user.setuId(0);
            return user;
        }


        return  user;
    }
}
