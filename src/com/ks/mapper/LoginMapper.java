package com.ks.mapper;

import com.ks.bean.User;

public interface LoginMapper {
    public User queryUserByName(String userName);
}
