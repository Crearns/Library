package Action;

import Dao.BookDao;
import Entity.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "BookAction", value = "/BookAction", urlPatterns = "/BookAction")
public class BookAction extends HttpServlet {
    BookDao bookDao = new BookDao();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("------------------------------");
        this.getBook(request, response);
    }
    
    public void getBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ArrayList<Book> booklist = null;
        booklist = bookDao.getAllBook();
        request.setAttribute("list", booklist);
    }
}
