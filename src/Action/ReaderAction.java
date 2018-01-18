package Action;

import Dao.ReaderDao;
import Entity.Reader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


public class ReaderAction extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        if(action.equals("QueryReaderById")) {
            this.QueryReaderById(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void QueryReaderById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String readerid = request.getParameter("readerid");
        ReaderDao readerDao = new ReaderDao();
        Reader reader = readerDao.QueryReaderById(readerid);
        String stauts = (reader.getStatus() == 1) ? "正常" : "黑名单";
        String callback = reader.getName() + "||" + reader.getGrade() + "年级" + reader.getClassnum() + "班||" + stauts + "||" + reader.getBorrow();
        PrintWriter out = response.getWriter();
        out.write(callback);
    }
}
