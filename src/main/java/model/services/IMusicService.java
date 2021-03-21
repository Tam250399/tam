package model.services;

import model.entities.Music;

import java.sql.SQLException;
import java.util.List;

public interface IMusicService {
    public void insertMusic(Music music) throws SQLException;

    public Music selectMusic(int idMusic);

    public List<Music> selectAllMusic();

    public boolean deleteMusic(int idMusic) throws SQLException;

    public boolean updateMusic(Music music) throws SQLException;
}
