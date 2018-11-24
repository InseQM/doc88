package com.inseqm.dao;

import java.util.List;
import java.util.Map;

public interface DbDao {

    boolean update(String sql, List<Object> params) throws Exception;

    Map<String, Object> getOne(String sql, List<Object> params) throws Exception;

    public List<Map<String, Object>> getList(String sql, List<Object> params) throws Exception;
}
