package db;
import java.sql.*;
public class db {
	private String driver ="com.mysql.jdbc.Driver";

	 private String sConnStr = "jdbc:mysql://localhost:3306/kaoshianpai?useUnicode=true&charsetEncoding=utf8";
	 
	// private String dbDriver="com.microsoft.sqlserver.jdbc.SQLServerDriver";    //sql2005
	// private String sConnStr ="jdbc:sqlserver://WHL_PC\\SQLEXPRESS:1433;database=xueshengchengji";

	  public Connection connect = null;
	  public ResultSet rs=null;
	  public db() {
	    try {
	     
	      Class.forName(driver).newInstance(); 
	     
	      connect = DriverManager.getConnection(sConnStr,"root","root");
	     //      connect = DriverManager.getConnection(sConnStr,"sa","1234"); 
	    }
	    catch (Exception ex) {
	      System.out.println("12121");
	    }
	  }
	  
	  public ResultSet executeQuery(String sql) {
			try{
				connect=DriverManager.getConnection(sConnStr,"root","root");
				//connect=DriverManager.getConnection(sConnStr,"sa","1234");
				Statement stmt=connect.createStatement();
				rs=stmt.executeQuery(sql);
			}catch(SQLException ex){
				System.err.println(ex.getMessage());
			}
			return rs;
		}
	  public void executeUpdate(String sql) {
	    	
	    	Statement stmt=null;
	    	rs=null;
	    	try
	    	{   connect=DriverManager.getConnection(sConnStr,"root","root");
	    	// connect=DriverManager.getConnection(sConnStr,"sa","1234");
	    		stmt=connect.createStatement();
	    		stmt.executeUpdate(sql);
	    		stmt.close();
	    		connect.close();
	    	}
	    	catch(SQLException ex)
	    	{
	    		System.err.println(ex.getMessage());
	    	}
	    
	    	
	    }



	/**
	 * 数据库修改方�?
	 */
	public static int executeSql(String sql){
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try{
			con = getconnection();
			st = con.createStatement();
			return st.executeUpdate(sql);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		finally {
			closeConnectionAndStatement(rs,con,st);
		}
		return 0;
	}
	/**
	 * 建立链接
	 * */
	public static Connection getconnection() {
		try{
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/kaoshianpai?useUnicode=true&characterEncoding=UTF-8", "root", "root");
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	//关闭连接
	public static void closeConnectionAndStatement(ResultSet rs,Connection con, Statement st){
		try {
			if (rs!=null)rs.close();
			if(st!=null)st.close();
			if(con!=null)con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
