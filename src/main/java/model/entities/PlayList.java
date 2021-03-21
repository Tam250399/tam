package model.entities;

public class PlayList {
    private int IdUser;
    private int IdMusic;
    private String Playlist_title;

    public PlayList() {
    }

    public PlayList(int idUser, int idMusic, String playlist_title) {
        IdUser = idUser;
        IdMusic = idMusic;
        Playlist_title = playlist_title;
    }

    public int getIdUser() {
        return IdUser;
    }

    public void setIdUser(int idUser) {
        IdUser = idUser;
    }

    public int getIdMusic() {
        return IdMusic;
    }

    public void setIdMusic(int idMusic) {
        IdMusic = idMusic;
    }

    public String getPlaylist_title() {
        return Playlist_title;
    }

    public void setPlaylist_title(String playlist_title) {
        Playlist_title = playlist_title;
    }
}
