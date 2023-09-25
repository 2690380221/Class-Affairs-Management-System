package com.ks.mapper;

import com.ks.bean.User;

public interface UserMapper {
    public User queryUserByName(String userName);

    public String getNameById(int id);
}
