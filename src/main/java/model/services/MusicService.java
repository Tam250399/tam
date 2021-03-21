package model.services;

import model.entities.Music;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MusicService implements IMusic {
   

    @Override
    public List<Music> SelectAllMusic() {
        List<Music> ListMusic = new ArrayList<>();
        try(Connection connection = DBConecction.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("select * from music;");
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("IdMusic");
                String song_title = rs.getString("song_title");
                String song_genre = rs.getString("song_genre");
                String artist_name = rs.getString("artist_name");
                String song_source = rs.getString("song_source");
                ListMusic.add(new Music(id,song_title,song_genre,artist_name,song_source));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return ListMusic;
    }

    @Override
    public List<Music> searchMusicBySong_Title(String name) {
        List<Music> musicList = new ArrayList<>();
        String TiTle = "%"+name+"%";
        try(Connection connection = DBConecction.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("select * from music where song_title like ?;");
            statement.setString(1,TiTle);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("IdMusic");
                String song_title = rs.getString("song_title");
                String song_genre = rs.getString("song_genre");
                String artist_name = rs.getString("artist_name");
                String song_source = rs.getString("song_source");
                musicList.add(new Music(id,song_title,song_genre,artist_name,song_source));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return musicList;
    }

    @Override
    public List<Music> searchMusicByArtist_name(String name) {

        List<Music> musicList = new ArrayList<>();
        String TiTle = "%"+name+"%";
        try(Connection connection = DBConecction.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("select * from music where artist_name like ?;");
            statement.setString(1,TiTle);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("IdMusic");
                String song_title = rs.getString("song_title");
                String song_genre = rs.getString("song_genre");
                String artist_name = rs.getString("artist_name");
                String song_source = rs.getString("song_source");
                musicList.add(new Music(id,song_title,song_genre,artist_name,song_source));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return musicList;
    }

    @Override
    public List searchMusicBySong_genre(String name) {

        List<String> musicList = new ArrayList<>();
        String TiTle = "%"+name+"%";
        try(Connection connection = DBConecction.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("select * from music where song_genre like ?;");
            statement.setString(1,TiTle);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                String song_source = rs.getString("song_source");
                musicList.add(song_source);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return musicList;
    }

    public Music searchMusicByIdMusic(int id) {
        Music music = null;
        try(Connection connection = DBConecction.getConnection()) {
            PreparedStatement statement = connection.prepareStatement("select * from music where IdMusic = ?;");
            statement.setInt(1,id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                int IdMusic = rs.getInt("IdMusic");
                String song_title = rs.getString("song_title");
                String song_genre = rs.getString("song_genre");
                String artist_name = rs.getString("artist_name");
                String song_source = rs.getString("song_source");
                music = new Music(IdMusic,song_title,song_genre,artist_name,song_source);
            }
        }
        catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return music;
    }

}
