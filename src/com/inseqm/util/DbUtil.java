package com.inseqm.util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public final class DbUtil {


    private DbUtil(){ }

    public static Connection getConnection() throws Exception {
        InputStream is = DbUtil.class.getResourceAsStream("/druid.properties");
        Properties p = new Properties();
        p.load(is);
        DataSource ds = DruidDataSourceFactory.createDataSource(p);
        return ds.getConnection();
    }

    public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) throws SQLException {

        if (rs != null && !rs.isClosed()){
            rs.close();
        }
        if (pstmt != null && !pstmt.isClosed()){
            pstmt.close();
        }
        if (conn != null && !conn.isClosed()){
            conn.close();
        }
    }
}
