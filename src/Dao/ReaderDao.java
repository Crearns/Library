package Dao;

import Entity.Reader;
import Util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReaderDao extends DBConnect{
    public Reader QueryReaderById(String id){
        Reader reader = new Reader();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM reader WHERE username=" + "'" + id + "'";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()){
                reader.setName(rs.getString("name"));
                reader.setSex(rs.getString("sex"));
                reader.setStatus(rs.getInt("status"));
                reader.setGrade(rs.getInt("grade"));
                reader.setClassnum(rs.getInt("classnum"));
            }
            return reader;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
