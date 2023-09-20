package com.ks.service;

import com.ks.mapper.CommentMapper;
import com.ks.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

public class CommentService {
    private SqlSession session;
    private CommentMapper commentMapper;

    public CommentService(){
        session= GetSqlSession.createsqlsession();
        commentMapper=session.getMapper(CommentMapper.class);
    }

    public boolean deleteByAffairId(int affairId) {
        return commentMapper.deleteByAffairId(affairId)>0;
    }
}
