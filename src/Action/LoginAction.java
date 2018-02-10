package Action;

import Dao.UserDao;
import Entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginAction extends HttpServlet {
    UserDao udao = new UserDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("login")) {
            this.login(request, response);
        }
        else if(action.equals("logout")){
            this.logout(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = null;
        String password = null;
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        username = request.getParameter("username");
        password = request.getParameter("password");
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        String result = udao.login(user);
        if(result.equals("true")){
            session.setAttribute("adminname", user.getName());
            request.getRequestDispatcher("/main.jsp").forward(request, response);
        }
        else{
            out.write(result);
        }
    }

    private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        HttpSession session = request.getSession();
        session.setMaxInactiveInterval(1);
        session.setAttribute("logout", "1");
        response.sendRedirect("/Library/index.jsp");
    }

}