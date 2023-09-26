package com.ks.mapper;

import com.ks.bean.User;

import java.util.List;

public interface UserMapper {
    public User queryUserByName(String userName);

    public String getNameById(int id);

    public List<User> userList(int uId);

    public int addUser(User user);

    public int deleteUser(int uId);

    public void reSorting(int uId);

    public User getUser(int affairId);

    public int updateUser(User user);
}
