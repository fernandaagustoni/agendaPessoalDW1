package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDao {
	
	String serverName="localhost";
	String dataBasePort="3306";
	String mydatabase="agenda";
	String url="jdbc:mysql://" + serverName + ":" + dataBasePort + "/" + mydatabase;
	String usernameb="root";
	String passwordb="";
	
	public int cadastrarUsuario(User u) throws ClassNotFoundException{
        String INSERT_USERS_SQL = "INSERT INTO usuarios" + 
                "(login, password, nome, email) VALUES " +
                "(?,?,?,?);";
        
        int result = 0;
        
        Class.forName("com.mysql.jdbc.Driver");
        
        try (Connection connection = DriverManager.getConnection(url,usernameb,passwordb);
        	PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)){
        	preparedStatement.setString(1, u.getLogin());
        	preparedStatement.setString(2, u.getSenha());
        	preparedStatement.setString(3, u.getNome());
        	preparedStatement.setString(4, u.getEmail());
        	System.out.println(preparedStatement);
        	
        	result = preparedStatement.executeUpdate();
        	ResultSet rs = preparedStatement.getGeneratedKeys();
        	if (rs.next()) {
        	    u.setId(rs.getInt(1));
        	}
        	
        }catch(SQLException e) {
        	e.printStackTrace();
        }
        
        return result;
	}
	
	public User buscarUsuario(String login, String password) throws ClassNotFoundException {
		String SELECT_USERS_SQL = "SELECT id, login, password, nome, email FROM usuarios WHERE login like ? and password like ?";
        
        Class.forName("com.mysql.jdbc.Driver");
        
        User u = null;
        
        try (Connection connection = DriverManager.getConnection(url,usernameb,passwordb);
        	PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_SQL)){
        	preparedStatement.setString(1, login);
        	preparedStatement.setString(2, password);
        	System.out.println(preparedStatement);
        	
        	ResultSet rs = preparedStatement.executeQuery();
        	if(rs.next()) {
        		u = new User();
        		u.setId(rs.getInt("id"));
        		u.setLogin(rs.getString("login"));
        		u.setSenha(rs.getString("password"));
        		u.setNome(rs.getString("nome"));
        		u.setEmail(rs.getString("email"));
        	}
        }catch(SQLException ex) {
        	ex.printStackTrace();
        }
        
        return u;
	}
}
