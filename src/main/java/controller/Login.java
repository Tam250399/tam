package controller;

import model.entities.Music;
import model.entities.User;
import model.services.IUser;
import model.services.MusicService;
import model.services.UserList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "Login", urlPatterns = "/Login")
public class Login extends HttpServlet {
    IUser iUser = new UserList();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "Login":
                showLogin(request, response);
                break;
            case "regiter":
               showRegiter(request,response);
            case "deleteLogin":
                deleteLogin(request, response);
                break;
            case "black":
                backHome(request, response);
            case "ShowUser":
                ShowUser(request,response);
               break;
            default:
                backHome(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "regiter":
                newUser(request, response);
                break;
            case "login":
                LoginLogout(request, response);
                break;
            case "edit":
                updateUser(request,response);
                break;
        }
    }

    private void backHome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Music> musicList = new MusicService().SelectAllMusic();
        request.setAttribute("musicList", musicList);
        request.getRequestDispatcher("Home.jsp").forward(request, response);
    }

    private void showLogin(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Login/Login.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showRegiter(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Regiter/Register.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void newUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String UserName = request.getParameter("UserName");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String youremail = request.getParameter("youremail");
        String password = request.getParameter("password");
        String retypepassword = request.getParameter("retypepassword");
        if (password.equals(retypepassword)) {
            User username = new User(UserName, firstname, lastname, youremail, password);
            iUser.insertUser(username);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Login/Login.jsp");

                 try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                response.sendRedirect("/Regiter/Register.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

//        private void updateUser(HttpServletRequest request, HttpServletResponse response) {
//        String username = request.getParameter("user");
//        String password = request.getParameter("password");
//
//        if (iUser.checkUser(username, password)) {
//
//
//            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
//
//            try {
//                dispatcher.forward(request, response);
//            } catch (ServletException e) {
//                e.printStackTrace();
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        } else {
//            try {
//                response.sendRedirect("/Login/Login.jsp");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
//    }
    private void LoginLogout(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("user");
        String password = request.getParameter("password");
        if (iUser.checkUser(username, password)) {
            try {
                HttpSession session = request.getSession();
                session.setAttribute("name", username);
                session.setAttribute("acc", iUser.checkUser(username, password));
                backHome(request,response);
//

            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("acc", iUser.checkUser(username, password));
            request.setAttribute("mess" ,"Wrong user or password");
            request.getRequestDispatcher("/Login/Login.jsp").forward(request,response);



        }
    }

    private void deleteLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        session.removeAttribute("acc");
        backHome(request, response);
    }


    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");
        String passwords = request.getParameter("passwords");
        String email = request.getParameter("email");
        String fistname = request.getParameter("fistname");
        String lastname = request.getParameter("lastname");
      User user = new User(username,passwords,email,fistname,lastname);
        RequestDispatcher dispatcher;
        if(user == null){
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            user.setUserName(username);
            user.setPassword(passwords);
            user.setYouremail(email);
            user.setFirstname(fistname);
            user.setLastname(lastname);
            iUser.UpdateUser(id,user);
            request.setAttribute("user", user);
            dispatcher = request.getRequestDispatcher("/ListUser/ListUser.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void ShowUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getParameter("name");
        List<User> userList =  iUser.findAll();
        request.setAttribute("username",userList);
        request.getRequestDispatcher("/ListUser/ListUser.jsp").forward(request,response);
    }
}
