package Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static final String driver = "com.mysql.jdbc.Driver";
    //连接数据库的URL地址
    private static final String url="jdbc:mysql://localhost:3306/Library?useSSL=false&characterEncoding=UTF-8";
    private static final String username="root";
    private static final String password="123456";

    private static Connection conn=null;

    //静态代码块负责加载驱动
    static
    {
        try
        {
            Class.forName(driver);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    public static Connection getConnection() throws Exception
    {
        if(conn==null)
        {
            conn = DriverManager.getConnection(url, username, password);
            return conn;
        }
        return conn;
    }




}
