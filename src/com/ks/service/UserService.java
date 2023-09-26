package com.ks.service;
import com.ks.bean.User;
import com.ks.mapper.UserMapper;
import com.ks.util.*;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 *
 */
public class UserService {
    SqlSession session;
    UserMapper loginMapper;
    public UserService(){
        session=GetSqlSession.createsqlsession();
        loginMapper=session.getMapper(UserMapper.class);
    }


    public User login(String uname, String upwd) {
        User user=new User();
        if(StringUtil.isEmpty(uname)){
            user.setuId(-1);
            return user;
        }

        user=loginMapper.queryUserByName(uname);

        if(user==null){
            User u=new User();
            u.setuId(-1);
            return u;
        }
        if(!user.getuPwd().equals(upwd)){
            user.setuId(0);
            return user;
        }
        return  user;
    }
    public  String getNameById(int id){


        return loginMapper.getNameById(id);
    }

    public List<User> userList(int uId) {
        return loginMapper.userList(uId);
    }

    public boolean addUser(User user) {
        return loginMapper.addUser(user)>0;
    }

    public boolean deleteUser(int uId) {
        return loginMapper.deleteUser(uId)>0;
    }

    public void reSorting(int uId) {
        loginMapper.reSorting(uId);
    }

    public User getUser(int affairId) {
        return loginMapper.getUser(affairId);
    }

    public boolean updateUser(User user) {
        return loginMapper.updateUser(user)>=0;
    }
}
