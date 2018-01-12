package Action;

import Dao.BookDao;
import Entity.Book;
import Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class BookAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
       if(action.equals("getall")){
           this.getAll(request, response);
       }
       else if(action.equals("addtemp")) {
           this.addtemp(request, response);
       }
    }
    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BookDao bdao = new BookDao();
        ArrayList<Book> bookArrayList = bdao.getAllBook();
        HttpSession session = request.getSession();
        session.setAttribute("allbooklist", bookArrayList);
        request.getRequestDispatcher("/booklist.jsp").forward(request,response);
    }

    private void addtemp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        Book book = new Book();
        System.out.println(request.getParameter("bookid"));
        book.setId(request.getParameter("bookid"));
        book.setName(request.getParameter("bookname"));
        book.setAuthor(request.getParameter("bookauthor"));
        book.setPublisher(request.getParameter("bookpublisher"));
        book.setCategory(request.getParameter("bookcategory"));
        book.setPrice(Integer.parseInt(request.getParameter("bookprice")));
        book.setStore(Integer.parseInt(request.getParameter("bookstore")));
        book.setLocation(request.getParameter("booklocation"));
        book.setDesc(request.getParameter("bookdesc"));
        bdao.addtemp(book);
        request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
        
    }
}
