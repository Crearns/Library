package Dao;

import Entity.User;
import Util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao extends DBConnect{

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
    public boolean login(User u){
        try {
            conn = super.getConnection();
            String sql = "select password form user where username=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, u.getUsername());
            if (rs.next())
                if (u.getPassword().equals(rs.getString("password")))
                    return true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            try {
                conn.close();
                pst.close();
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;

    }
}
