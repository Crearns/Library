package Util;

import java.sql.*;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

public class DBConnect {
    private static final String driver = "com.mysql.jdbc.Driver"; //数据库驱动
    //连接数据库的URL地址
    private static final String url = "jdbc:mysql://localhost:3306/library?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
    private static final String username = "root";//数据库的用户名
    private static final String password = "123456";//数据库的密码

    private static Connection conn = null;

    //静态代码块负责加载驱动
    static {
        try {
            Class.forName(driver);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    //单例模式返回数据库连接对象
    public static Connection getConnection() throws Exception {
        if (conn == null) {
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        }
        return conn;
    }

    public static void close(Connection conn, Statement st, ResultSet rs) {
        try {
            if (conn != null)
                conn.close();
            if (st != null)
                st.close();
            if (rs != null)
                rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public static boolean executeSql(String sql) {
        Connection conn = null;
        try {
            conn = getConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Statement st = null;
        try {
            st = conn.createStatement();
            return st.executeUpdate(sql) > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, st, null);
        }
        return false;
    }

}