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
       else if(action.equals("gettemp")) {
           this.gettemp(request, response);
       }
       else if(action.equals("confirm")) {
           this.confirm(request, response);
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
        String next = request.getParameter("over");
        System.out.println(next);
        BookDao bdao = new BookDao();
        Book book = new Book();
        System.out.println(request.getParameter("over"));
        if(!request.getParameter("bookid").equals(""))
            book.setId(request.getParameter("bookid"));
        else
            request.getRequestDispatcher("/addconfirm.jsp").forward(request,response);
        System.out.println(request.getParameter("bookname"));
        if(!request.getParameter("bookname").equals(""))
            book.setName(request.getParameter("bookname"));
        if(!request.getParameter("bookauthor").equals(""))
             book.setAuthor(request.getParameter("bookauthor"));
        if(!request.getParameter("bookpublisher").equals(""))
             book.setPublisher(request.getParameter("bookpublisher"));
        if(!request.getParameter("bookcategory").equals("")) 
            book.setCategory(request.getParameter("bookcategory"));
        if(!request.getParameter("bookprice").trim().equals("")) 
            book.setPrice(Integer.parseInt(request.getParameter("bookprice")));
        if(!request.getParameter("bookstore").trim().equals("")) 
            book.setStore(Integer.parseInt(request.getParameter("bookstore")));
        if(!request.getParameter("booklocation").equals("")) 
            book.setLocation(request.getParameter("booklocation"));
        if(!request.getParameter("bookdesc").equals("")) 
            book.setDesc(request.getParameter("bookdesc"));
        bdao.addtemp(book);
        if(next.equals("0"))
             request.getRequestDispatcher("/AddBook.jsp").forward(request, response);
        else
            request.getRequestDispatcher("/addconfirm.jsp").forward(request,response);
    }

    private void gettemp(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        ArrayList<Book> addbooklist = bdao.getadd();
        HttpSession session = request.getSession();
        session.setAttribute("addbooklist", addbooklist);
        request.getRequestDispatcher("/addconfirm.jsp").forward(request,response);
    }

    private void confirm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        BookDao bdao = new BookDao();
        bdao.confirm();
        request.getRequestDispatcher("/booklist.jsp").forward(request, response);
    }
}
