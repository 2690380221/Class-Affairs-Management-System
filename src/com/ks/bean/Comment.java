package com.ks.bean;

public class Comment {
    int commentId;
    String content;
    String plTime;
    int userId;
    int affairId;

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPlTime() {
        return plTime;
    }

    public void setPlTime(String plTime) {
        this.plTime = plTime;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getAffairId() {
        return affairId;
    }

    public void setAffairId(int affairId) {
        this.affairId = affairId;
    }
}
