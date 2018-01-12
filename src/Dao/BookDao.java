package Dao;

import Entity.Book;
import Util.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookDao extends DBConnect {
    ArrayList<Book> booklist = new ArrayList<>();
    public ArrayList<Book> getAllBook(){
        try {
            Connection conn = super.getConnection();
            String sql = "SELECT * FROM Book";
            PreparedStatement pst = null;
            ResultSet rs = null;
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getString("id"));
                book.setName(rs.getString("name"));
                book.setAuthor(rs.getString("author"));
                book.setPublisher(rs.getString("publisher"));
                book.setPrice(rs.getInt("price"));
                book.setCategory(rs.getString("category"));
                book.setStore(rs.getInt("store"));
                book.setLocation(rs.getString("location"));
                booklist.add(book);
            }
            return booklist;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return booklist;
    }
    
    public void addtemp(Book book){
        try {
            int i = 0;
            Connection conn = super.getConnection();
            PreparedStatement pst = null;
            String sql = "insert into tempadd (id, bookname, author, publisher, price, category, store, bookdesc, location)values(?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = conn.prepareStatement(sql);
            pst.setString(1, book.getId());
            pst.setString(2, book.getName());
            pst.setString(3, book.getAuthor());
            pst.setString(4, book.getPublisher());
            pst.setInt(5, book.getPrice());
            pst.setString(6, book.getCategory());
            pst.setInt(7, book.getStore());
            pst.setString(8, book.getDesc());
            pst.setString(9, book.getLocation());
            i = pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
