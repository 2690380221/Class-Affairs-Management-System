package com.ks.mapper;

import com.ks.bean.Comment;

import java.util.List;

public interface CommentMapper {

    public int deleteByAffairId(int affairId);

    public int save(Comment comment);

    public List<Comment> getCommentList(int affairId);

    public int deleteByUserId(int uId);

    public int deleteByCommentId(int commentId);
}
