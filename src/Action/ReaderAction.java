package Action;

import Dao.IODao;
import Dao.ReaderDao;
import Entity.Log;
import Entity.Reader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;


public class ReaderAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=utf-8");
        if(action.equals("QueryReaderById")) {
            this.QueryReaderById(request, response);
        }
        else if (action.equals("GetBorrowListById")){
            this.GetBorrowListById(request, response);
        }
        else if (action.equals("GetAllReader")){
            this.GetAllReader(request, response);
        }
        else if(action.equals("SetBlackList")){
            this.SetBlackList(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    protected void QueryReaderById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String readerid = request.getParameter("readerid");
        ReaderDao readerDao = new ReaderDao();
        Reader reader = readerDao.QueryReaderById(readerid);
        String stauts = (reader.getStatus() == 1) ? "正常" : "异常";
        String callback = reader.getName() + "||" + reader.getGrade() + "年级" + reader.getClassnum() + "班||" + stauts + "||" + reader.getBorrow();
        PrintWriter out = response.getWriter();
        out.write(callback);
    }

    protected void GetBorrowListById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String id = request.getParameter("readerid");
        IODao ioDao = new IODao();
        ArrayList<Log> loglist = ioDao.QueryBorrowNumByReaderid(id);
        HttpSession session = request.getSession();
        session.setAttribute("loglist", loglist);
        request.getRequestDispatcher("/borrowlist.jsp").forward(request,response);
    }

    protected void GetAllReader(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        ReaderDao readerDao = new ReaderDao();
        ArrayList<Reader> readerlist = readerDao.GetAllReader();
        HttpSession session = request.getSession();
        session.setAttribute("readerlist", readerlist);
        request.getRequestDispatcher("/ReaderList.jsp").forward(request, response);
    }

    protected void SetBlackList (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("id");
        String edit = request.getParameter("edit");
        ReaderDao readerDao = new ReaderDao();
        if(edit.equals("设置为正常")){
            readerDao.SetBlackList(username, true);
        }
        else{
            readerDao.SetBlackList(username, false);
        }
        this.GetAllReader(request, response);
    }
}
