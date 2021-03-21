package model.entities;

public class Music {
    private int idMusic;
    private String song_title;
    private String song_genre;
    private String artist_name;
    private String song_source;

    public Music() {
    }

    public Music(int idMusic, String song_title, String song_genre, String artist_name, String song_source) {
        this.idMusic = idMusic;
        this.song_title = song_title;
        this.song_genre = song_genre;
        this.artist_name = artist_name;
        this.song_source = song_source;
    }

    public int getIdMusic() {
        return idMusic;
    }

    public void setIdMusic(int idMusic) {
        this.idMusic = idMusic;
    }

    public String getSong_title() {
        return song_title;
    }

    public void setSong_title(String song_title) {
        this.song_title = song_title;
    }

    public String getSong_genre() {
        return song_genre;
    }

    public void setSong_genre(String song_genre) {
        this.song_genre = song_genre;
    }

    public String getArtist_name() {
        return artist_name;
    }

    public void setArtist_name(String artist_name) {
        this.artist_name = artist_name;
    }

    public String getSong_source() {
        return song_source;
    }

    public void setSong_source(String song_source) {
        this.song_source = song_source;
    }
}
