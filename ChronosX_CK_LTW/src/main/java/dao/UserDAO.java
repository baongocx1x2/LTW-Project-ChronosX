package dao;

import java.sql.*;

import model.DBConnection;
import model.User;
import java.util.*;

public class UserDAO {
    public boolean register(User u) {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users(username, password, email, fullname) VALUES(?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword()); // TODO: hash password
            ps.setString(3, u.getEmail());
            ps.setString(4, u.getFullname());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User login(String username, String password) {
        User u = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM users WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password); // TODO: hash password
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("id"));
                u.setUsername(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setFullname(rs.getString("fullname"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }
}