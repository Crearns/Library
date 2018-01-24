package Dao;

import Entity.Reader;
import Util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReaderDao extends DBConnect{
    public Reader QueryReaderById(String id){
        Reader reader = new Reader();
        IODao ioDao = new IODao();
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
                reader.setBorrow(ioDao.QueryBorrowNumByReaderid(id).size());
            }
            return reader;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public ArrayList<Reader> GetAllReader(){
        ArrayList<Reader> ReaderList = new ArrayList<>();
        Connection conn = null;
        try {
            conn = super.getConnection();
            String sql = "SELECT * FROM reader";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            Reader reader = null;
            while(rs.next()){
                reader = new Reader();
                reader.setUsername(rs.getString("username"));
                reader.setName(rs.getString("name"));
                reader.setSex(rs.getString("sex"));
                reader.setStatus(rs.getInt("status"));
                reader.setMail(rs.getString("mail"));
                reader.setGrade(rs.getInt("grade"));
                reader.setClassnum(rs.getInt("classnum"));
                reader.setTel(rs.getString("tel"));
                ReaderList.add(reader);
            }
            return ReaderList;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void SetBlackList(String username, boolean isblack){
        int i = 0;
        Connection conn = null;
        String sql = null;
        try {
            conn = super.getConnection();
            PreparedStatement pst = null;
            if(isblack == true)
                sql = "UPDATE reader SET status=1 WHERE username=?";
            else
                sql = "UPDATE reader SET status=-1 WHERE username=?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, username);
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
