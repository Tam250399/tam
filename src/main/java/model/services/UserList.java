package model.services;

import model.services.IUser;
import model.entities.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static model.services.DBConecction.getConnection;

public class UserList implements IUser {
    
    private static final String INSERT_USERS_SQL = "INSERT INTO users(username,passwords,email,firstname,lastname) VALUES(?,?,?,?,?); ";


    private static final String SELECT_USER_BY_ID = "select * from users where IdUser =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where IdUser = ?;";
    private static final String UPDATE_USERS_SQL = "update users set username = ?, passwords = ? ,email= ?, firstname =?,lastname=? where IdUser = ?;";

    


    @Override
    public void insertUser(User user) {
        System.out.println(INSERT_USERS_SQL);
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getLastname());
            preparedStatement.setString(4, user.getYouremail());
            preparedStatement.setString(5, user.getFirstname());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean checkUser(String userName, String password) {
        boolean status = false;
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement("select username,passwords from users where username = ?;");
            statement.setString(1, userName);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String user = rs.getString("username");
                String passw = rs.getString("passwords");

                if (user.equals(userName) && passw.equals(password)) {
                    status = true;

                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return status;
    }

    @Override
    public boolean UpdateUser(int id, User user) {
        boolean rowUpdate = false;
        Connection connection = getConnection();
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_USERS_SQL);
            statement.setString(1,user.getUserName());
            statement.setString(2,user.getPassword());
            statement.setString(3,user.getYouremail());
            statement.setString(4,user.getFirstname());
            statement.setString(5,user.getLastname());
            rowUpdate = statement.executeUpdate()>0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
          return rowUpdate;
    }


    public User findById(int id) {
        User user = null;
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();
             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                String username = rs.getString("username");
                String passwords = rs.getString("passwords");
                String email = rs.getString("email");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                user = new User(id, username, passwords, email, firstname,lastname);
            }
        } catch (SQLException e) {

        }
        return user;
    }
    @Override
    public List<User> findAll() {
        // using try-with-resources to avoid closing resources (boiler plate code)
        List<User> persons = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            System.out.println(preparedStatement);
            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int IdUser = rs.getInt("IdUser");
                String username = rs.getString("username");
                String passwords = rs.getString("passwords");
                String email = rs.getString("email");
                String firstname = rs.getString("firstname");
                String lastname = rs.getString("lastname");
                persons.add(new User(IdUser,username, passwords, email,firstname,lastname));
            }
        } catch (SQLException e) {

        }
        return persons;
    }

    @Override
    public boolean deleteUser() {
        return false;
    }

    @Override
    public void checkUser(User usernames) {

    }


}