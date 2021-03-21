package model.services;

import model.entities.Music;

import java.util.List;

public interface IMusic {
    List<Music> SelectAllMusic();
    List<Music> searchMusicBySong_Title(String name);
    List<Music> searchMusicByArtist_name(String name);
    List<Music> searchMusicBySong_genre(String name);
    Music searchMusicByIdMusic(int id);
}
