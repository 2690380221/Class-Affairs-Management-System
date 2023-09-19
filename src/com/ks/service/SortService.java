package com.ks.service;

import com.ks.bean.Sort;
import com.ks.mapper.SortMapper;
import com.ks.util.GetSqlSession;
import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;
import java.util.List;

/**
 *  实现对sort表的处理，对数据的提取，供用户在添加和查询时在视图中选择事务类别
 */
public class SortService {
    public List<Sort>getSorts(){

        List<Sort> list=new ArrayList<Sort>();
        SqlSession session= GetSqlSession.createsqlsession();
        SortMapper sortMapper=session.getMapper(SortMapper.class);
        list=sortMapper.getSorts();
        return  list;

    }
}
