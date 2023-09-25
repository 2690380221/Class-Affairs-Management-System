package com.ks.mapper;

import com.ks.bean.Affair;
import com.ks.bean.Query;

import java.util.List;
import java.util.Map;

public interface AffairsMapper {
    public int recordCount();
    public int save(Affair aff);
    public List<Affair> affairsList();
    public Affair getAffair(int affairId);
    public int update(Affair aff);

    public int delete(int affairId);
    public void reSorting(int affairId);

    public List<Affair> sortedAffairs(int sortId);

    public List<Affair> searchByConditions(Query query);
}
