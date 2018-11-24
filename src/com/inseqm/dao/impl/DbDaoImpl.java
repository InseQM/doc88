package com.inseqm.dao.impl;

import com.inseqm.dao.DbDao;
import com.inseqm.util.DbUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DbDaoImpl implements DbDao {

    /**
     * 数据库增删改
     * @param sql
     * @param params
     * @return boolean对象
     * @throws Exception
     */
    @Override
    public boolean update(String sql, List<Object> params) throws Exception {
        int result = -1;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        if(params != null && !params.isEmpty()){
            int index = 1;
            for (Object param : params) {
                pstmt.setObject(index++, param);
            }
        }
        result = pstmt.executeUpdate();
        return result > 0;
    }

    /**
     * 查询单条数据
     * @param sql
     * @param params
     * @return map对象
     * @throws Exception
     */
    @Override
    public Map<String, Object> getOne(String sql, List<Object> params) throws Exception {
        Map<String, Object> map = new HashMap<>();
        int index  = 1;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        if(params != null && !params.isEmpty()){
            for (Object param : params) {
                pstmt.setObject(index++, param);
            }
        }
        ResultSet rs = pstmt.executeQuery();//返回查询结果
        ResultSetMetaData metaData = rs.getMetaData();
        int cols_len = metaData.getColumnCount();
        while(rs.next()){
            map = inputMap(map, rs, metaData, cols_len);
        }
        DbUtil.close(conn, pstmt, rs);
        return map;
    }

    /**
     * 查询多条数据
     * @param sql
     * @param params
     * @return List对象
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> getList(String sql, List<Object> params) throws Exception {
        List<Map<String, Object>> list = new ArrayList<>();
        int index = 1;
        Connection conn = DbUtil.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        if(params != null && !params.isEmpty()){
            for (Object param : params) {
                pstmt.setObject(index++, param);
            }
        }
        ResultSet rs = pstmt.executeQuery();
        ResultSetMetaData metaData = rs.getMetaData();
        int cols_len = metaData.getColumnCount();
        while(rs.next()){
            Map<String, Object> map = new HashMap<>();
            list.add(inputMap(map, rs, metaData, cols_len));
        }
        DbUtil.close(conn, pstmt, rs);
        return list;
    }

    /**
     * 向map里面存数据
     * @param map
     * @param rs
     * @param metaData
     * @param cols_len
     * @return
     * @throws SQLException
     */
    private Map<String, Object> inputMap(Map<String, Object> map, ResultSet rs, ResultSetMetaData metaData, int cols_len) throws SQLException {
        for(int i=0; i<cols_len; i++){
            String cols_name = metaData.getColumnName(i+1);
            Object cols_value = rs.getObject(cols_name);
            if(cols_value == null){
                cols_value = "";
            }
            map.put(cols_name, cols_value);
        }
        return map;
    }

    /*public static void main(String[] args) throws Exception {
        User user = new User("黑猫", "123", "女",
                new Date(), "122", "122", "122", new Date(), "122");
        DbDao d = new DbDaoImpl();
        String sql = "insert into user(username, password, sex, birthday)" +
                "value(?, ?, ?, ?)";
        String updateSql = "update user set email = ? where username = ?";
        List<Object> list = new ArrayList<>();
        List<Object> list1 = new ArrayList<>();
        list.add(user.getUsername());
        list.add(user.getPassword());
        list.add(user.getSex());
        list.add(user.getBirthday());
//        d.update(sql, list);
        user.setEmail("1225694554@qq.com");
//        user.setUsername("黑猫");
        list1.add(user.getEmail());
//        list1.add(user.getUsername());
//        d.update(updateSql, list1);
        sql = "select username from user where email = ?";
        System.out.println(d.getList(sql, list1));
    }*/
}
