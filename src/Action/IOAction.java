package Action;

import Dao.IODao;
import Entity.Log;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class IOAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("borrow")){
            this.borrow(request, response);
        }
        else if(action.equals("getlog")){
            this.getlog(request, response);
        }
        else if(action.equals("return")){
            this.ReturnBook(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    protected void borrow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        IODao ioDao = new IODao();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date();
        String time = sdf.format(date);
        String readerid = request.getParameter("readerid");
        String bookid = request.getParameter("bookid");
        int borrowday = Integer.parseInt(request.getParameter("borrowday"));
        ioDao.borrow(bookid, readerid, time, borrowday);
        this.getlog(request,response);
    }

    protected void getlog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        IODao ioDao = new IODao();
        ArrayList<Log> loglist = ioDao.getLogList();
        HttpSession session = request.getSession();
        session.setAttribute("loglist", loglist);
        request.getRequestDispatcher("/IOLog.jsp").forward(request, response);
    }

    protected void ReturnBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        IODao ioDao = new IODao();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
        Date date = new Date();
        String Returntime = sdf.format(date);
        String bookid = request.getParameter("bookid");
        String readerId = request.getParameter("ReaderId");
        String borrowtime = request.getParameter("borrowtime");
        ioDao.ReturnBook(bookid, readerId, borrowtime, Returntime);
        this.getlog(request,response);
    }
    
    
    
}
