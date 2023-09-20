package com.ks.service;

import com.ks.bean.Affair;
import com.ks.mapper.AffairsMapper;
import com.ks.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;

/**
 * 添加事务的业务逻辑处理类
 */
public class AffairsService {

    private SqlSession session;
    private AffairsMapper aam;

    public AffairsService(){
        session= GetSqlSession.createsqlsession();
        aam=session.getMapper(AffairsMapper.class);
    }
    public int recordCount(){
        return aam.recordCount();
    }//添加形事务时获取现在的条数以确定添加的id

    public boolean save(Affair aff) {  //添加事务时保存用
        try {
            int rowsInserted = aam.save(aff);
            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false; // 插入失败
        }
    }

    public List<Affair> affairsList() {//main.jsp浏览事务获取全部事务的列表
        return aam.affairsList();
    }

    public Affair getAffair(int affairId) {//由id获得
        return aam.getAffair(affairId);
    }

    public boolean update(int affairId, Affair aff) {//编辑修改事务
        HashMap<String, Object> params = new HashMap<String, Object>();
        params.put("affairId", affairId);
        params.put("affair ", aff);
        return aam.update(params)>0;
    }

    public boolean delete(int affairId) {//通过id删除事务
        return aam.delete(affairId)>0;
    }
}
