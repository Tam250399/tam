package model.services;

import model.entities.Music;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MusicAdmin implements IMusicService {


    private static final String INSERT_MUSIC_SQL = "INSERT INTO music (song_title,song_genre,artist_name,song_source) VALUES (?, ?, ?, ?);";
    private static final String SELECT_MUSIC_BY_ID = "select idMusic,song_title,song_genre,artist_name,song_source from music where IdMusic =?";
    private static final String SELECT_ALL_MUSIC = "select * from music";
    private static final String DELETE_MUSIC_SQL = "delete from music where IdMusic = ?;";
    private static final String UPDATE_MUSIC_SQL = "update music set song_title = ?,song_genre= ?, artist_name =?,song_source=? where IdMusic = ?;";

    public void MusicAdmin() {
    }



    public void insertMusic(Music music) throws SQLException {
        System.out.println(INSERT_MUSIC_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = DBConecction.getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MUSIC_SQL)) {
            preparedStatement.setString(1, music.getSong_title());
            preparedStatement.setString(2, music.getSong_genre());
            preparedStatement.setString(3, music.getArtist_name());
            preparedStatement.setString(4, music.getSong_source());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            DBConecction.printSQLException(e);
        }
    }

    public Music selectMusic(int idMusic) {
        Music music = null;
        // Step 1: Establishing a Connection
        try (Connection connection = DBConecction.getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_MUSIC_BY_ID);) {
            preparedStatement.setInt(1, idMusic);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String title = rs.getString("Title");
                String genre = rs.getString("Genre");
                String artist = rs.getString("Artist");
                String source = rs.getString("Source");
                music = new Music(idMusic, title, genre, artist, source);
            }
        } catch (SQLException e) {
            DBConecction.printSQLException(e);
        }
        return music;
    }

    public List<Music> selectAllMusic() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Music> musics = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = DBConecction.getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MUSIC);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int id = rs.getInt("ID");
                String title = rs.getString("Title");
                String genre = rs.getString("Genre");
                String artist = rs.getString("Artist");
                String source = rs.getString("Source");
                musics.add(new Music(id, title, genre, artist, source));
            }
        } catch (SQLException e) {
            DBConecction.printSQLException(e);
        }
        return musics;
    }

    public boolean deleteMusic(int idMusic) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = DBConecction.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_MUSIC_SQL);) {
            statement.setInt(1, idMusic);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }


    public boolean updateMusic(Music music) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = DBConecction.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_MUSIC_SQL);) {
            statement.setInt(1, music.getIdMusic());
            statement.setString(2, music.getSong_title());
            statement.setString(3, music.getSong_genre());
            statement.setString(4, music.getArtist_name());
            statement.setString(5, music.getSong_source());


            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }


}
