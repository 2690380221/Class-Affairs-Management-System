package com.ks.mapper;

import com.ks.bean.Sort;
import com.ks.bean.User;

import java.util.List;

public interface SortMapper {
    public List<Sort> getSorts();
    public String getNameById(int sortId);
}

