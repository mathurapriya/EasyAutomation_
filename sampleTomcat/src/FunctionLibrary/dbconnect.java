package FunctionLibrary;


import java.sql.DriverManager;
import java.sql.Connection; 
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Driver;
import java.sql.Statement;


/** Table1: Storehouse
 * Name, Type, Value
 *
 * Table2: Command
 * Action, Object, Input
 * 
 * Database Name: easy_automation
 * Table1: ActiveDB
 * Name
 */
public class dbconnect {	
	
	static String ActiveDB = "test";
	
	public dbconnect(String DB) throws SQLException{
		ActiveDB= DB;
		UpdateActiveDB(DB);
	}
	
	public void UpdateActiveDB(String ActiveDBName) throws SQLException{
		
		ActiveDB = ActiveDBName;
		Connection conn = null;
		ResultSet rs;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement2=conn.prepareStatement("show databases;");
			rs = statement2.executeQuery();
			String Actual = "";
			boolean flag = false;
			while(rs.next()) {
				Actual = rs.getString("Database");
				if(ActiveDBName.contentEquals(Actual))
					flag=true;
				}
			if(!flag){
				createDBAndTables(ActiveDBName);
			}
			PreparedStatement statement=conn.prepareStatement("use easy_automation;");
			statement.executeQuery();
			PreparedStatement statement1=conn.prepareStatement("update ActiveDB set Name='" + ActiveDBName + "';");
			statement1.executeUpdate();
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}finally {
			conn.close();
		}
	}
			
	public String QueryActiveDB() throws SQLException{
		ResultSet rs;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement=conn.prepareStatement("use easy_automation;");
			statement.executeQuery();
			PreparedStatement statement1=conn.prepareStatement("select * from ActiveDB;");
			rs = statement1.executeQuery();
			String Actual = "";
			while(rs.next()) {
				Actual = Actual + " " + rs.getString("Name");
				}
			System.out.println(Actual);
			return Actual;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}finally {
			conn.close();
		}
		return null;
	}
	
	public void createDBAndTables(String DBName) throws SQLException{

		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			
			PreparedStatement statement=conn.prepareStatement("create database " + DBName + ";");
			statement.executeQuery();
			UpdateActiveDB(DBName);
			PreparedStatement statement1=conn.prepareStatement("use " + DBName + ";");
			statement1.executeQuery();
			PreparedStatement statement2=conn.prepareStatement("create table Storehouse(Name varchar(50),Type varchar(15), Value varchar(100));");
			statement2.executeQuery();
			PreparedStatement statement3=conn.prepareStatement("create table Command(Action varchar(50),Object varchar(15), Input varchar(100));");
			statement3.executeQuery();
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}finally {
			conn.close();
		}	
	}
	
	
	public void insert_command(String action, String object, String input) throws SQLException{

		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement=conn.prepareStatement("use " + ActiveDB + ";");
			statement.executeQuery();
			PreparedStatement statement1=conn.prepareStatement("insert into Command values ('" +action + "','" + object + "','" + input + "');");	
			statement1.executeUpdate();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}finally {
			conn.close();
		}
	}
	
	public void insert_Storehouse(String Name, String Type, String Value) throws SQLException{
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement=conn.prepareStatement("use " + ActiveDB + ";");
			statement.executeQuery();
			PreparedStatement statement1=conn.prepareStatement("insert into Storehouse values ('" + Name + "','" + Type + "','" + Value+ "');");	
			statement1.executeUpdate();
			
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally {
			conn.close();
		}
	}
	
	
	@SuppressWarnings("null")
	public String[] get_commands() throws SQLException{
		String[] returnvalues = null;
		ResultSet rs;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement=conn.prepareStatement("use " + ActiveDB + ";");
			statement.executeQuery();
			PreparedStatement statement2=conn.prepareStatement("select * from Command;");	
			rs = statement2.executeQuery();
			String Actual = null;
			int count = 0;
			while(rs.next()) {
				Actual = rs.getString("Action");
				Actual = Actual + " " + rs.getString("Object");
				Actual = Actual + " " + rs.getString("Input");
				returnvalues[count++] = Actual;
				System.out.println(Actual);
				}
			
	}	
	catch (Exception e)
	{
		e.printStackTrace();
	}finally {
		conn.close();
	}
		return returnvalues;
	}

	/*@SuppressWarnings("null")
	public String[] get_Storehouse(){
		String[] returnvalues = null;
		ResultSet rs;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement=conn.prepareStatement("use test");
			statement.executeQuery();
			PreparedStatement statement2=conn.prepareStatement("select * from Storehouse");	
			rs = statement2.executeQuery();
			String Actual = null;
			int count = 0;
			while(rs.next()) {
				Actual = rs.getString("Name");
				Actual = Actual + " " + rs.getString("Type");
				Actual = Actual + " " + rs.getString("Value");
				returnvalues[count++] = Actual;
				System.out.println(Actual);
				}
			
	}	
	catch (Exception e)
	{
		e.printStackTrace();
	}
		return returnvalues;
	}
	*/
	@SuppressWarnings("null")
	public String get_Storehouse() throws SQLException{
		
		String returnvalues = null;
		ResultSet rs;
		Connection conn = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://35.189.171.229","root", "mathura55");
			PreparedStatement statement=conn.prepareStatement("use " + ActiveDB + ";");
			statement.executeQuery();
			PreparedStatement statement2=conn.prepareStatement("select * from Storehouse;");	
			rs = statement2.executeQuery();
			String Actual = null;
			while(rs.next()) {
				Actual = rs.getString("Name");
				Actual = Actual + " " + rs.getString("Type");
				Actual = Actual + " " + rs.getString("Value");
				if(returnvalues == null)
					returnvalues = Actual;
				else
					returnvalues += ";;" + Actual;
				System.out.println(Actual);
				}
			
	}	
	catch (Exception e)
	{
		e.printStackTrace();
	}finally {
		conn.close();
	}
		return returnvalues;
	}
	
}

