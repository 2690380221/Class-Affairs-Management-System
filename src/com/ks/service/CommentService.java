package com.ks.service;

import com.ks.bean.Comment;
import com.ks.mapper.CommentMapper;
import com.ks.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

public class CommentService {
    private SqlSession session;
    private CommentMapper commentMapper;

    public CommentService(){
        session= GetSqlSession.createsqlsession();
        commentMapper=session.getMapper(CommentMapper.class);
    }

    public boolean deleteByAffairId(int affairId) {
        return commentMapper.deleteByAffairId(affairId)>=0;
    }

    public boolean save(Comment comment) {
        return commentMapper.save(comment)>0;
    }

    public List<Comment> getCommentList(int affairId) {
        return commentMapper.getCommentList(affairId);
    }
}
