package com.ks.mapper;

import com.ks.bean.Affair;

import java.util.List;
import java.util.Map;

public interface AffairsMapper {
    public int recordCount();
    public int save(Affair aff);
    public List<Affair> affairsList();
    Affair getAffair(int affairId);
    public int update(Map params);

    public int delete(int affairId);
    public void reSorting(int affairId);

    public List<Affair> sortedAffairs(int sortId);
}
