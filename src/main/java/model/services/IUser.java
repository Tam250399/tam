package model.services;

import model.entities.User;

import java.util.List;

public interface IUser {
List<User>findAll();
    User findById(int id);
    void insertUser(User user);

    boolean checkUser(String userName, String password);

    boolean UpdateUser( int id, User user);

    boolean deleteUser();


    void checkUser(User usernames);

}
