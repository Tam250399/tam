package controller;

import com.google.gson.Gson;
import model.entities.Music;
import model.services.MusicService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "MusicServlet", urlPatterns = "/MusicServlet")
public class PlayListServlet extends HttpServlet {
    Gson gson = new Gson();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ac = request.getParameter("ac");
        switch (ac) {
            case "PlayMusic":
                int id = Integer.parseInt(request.getParameter("id"));
                Music music = new MusicService().searchMusicByIdMusic(id);
                String data = this.gson.toJson(music.getSong_source());
                PrintWriter out = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                out.print(data);
                out.flush();
                break;
            case "Goat":
                List<String> musicList = new MusicService().searchMusicBySong_genre("Rap");
                String dataGoat = this.gson.toJson(musicList);
                PrintWriter outGoat = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                outGoat.print(dataGoat);
                outGoat.flush();
                break;
            case "Duck":
                List<String> musicList1 = new MusicService().searchMusicBySong_genre("R&B");
                String dataGoat1 = this.gson.toJson(musicList1);
                PrintWriter outGoat1 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                outGoat1.print(dataGoat1);
                outGoat1.flush();
                break;
            case "Horse":
                List<String> musicList2 = new MusicService().searchMusicBySong_genre("Soul");
                String dataGoat2 = this.gson.toJson(musicList2);
                PrintWriter outGoat2 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                outGoat2.print(dataGoat2);
                outGoat2.flush();
                break;

            case "Sheep":
                List<String> musicList3 = new MusicService().searchMusicBySong_genre("Vpop");
                String dataGoat3 = this.gson.toJson(musicList3);
                PrintWriter outGoat3 = response.getWriter();
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                outGoat3.print(dataGoat3);
                outGoat3.flush();
                break;

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
