package Dao;

import Util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class IODao extends DBConnect{
    public void borrow(String bookid, String readerid, String time, int borrowday){
        try {
            int i = 0;
            Connection conn = super.getConnection();
            PreparedStatement pst = null;
            String sql = "INSERT INTO iolog (bookid, readerid, service, borrowtime, borrowday, complete)VALUES(?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, bookid);
            pst.setString(2, readerid);
            pst.setInt(3, -1);
            pst.setString(4, time);
            pst.setInt(5, borrowday);
            pst.setInt(6, 0);
            i = pst.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    
}
