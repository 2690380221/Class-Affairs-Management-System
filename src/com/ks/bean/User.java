package com.ks.bean;

public class User {
    public User() {
    }

    public User(int uId, String uName, String uPwd, int uType) {
        this.uId = uId;
        this.uName = uName;
        this.uPwd = uPwd;
        this.uType = uType;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd;
    }

    public int getuType() {
        return uType;
    }

    public void setuType(int uType) {
        this.uType = uType;
    }

    private int uId;
    private String uName;
    private String uPwd;
    private int uType;
}
