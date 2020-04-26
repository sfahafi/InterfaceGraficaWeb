package ar.org.centro8.curso.java.aplicaciones.connectors;
import java.sql.Connection;
import java.sql.DriverManager;
public class Connector {
    private static String driver="com.mysql.cj.jdbc.Driver";
    private static String vendor="mysql"; // vendor = fabricante
    //private static String server="localhost";
    private static String server="remotemysql.com";
    private static String port="3306";
    //private static String database="negocioWeb";
    private static String database="S36WIHK7x4";
    private static String params="";
    //private static String user="root";
    private static String user="S36WIHK7x4";
    //private static String pass="";
    private static String pass="s8Wp83GabH";
    private static String url="jdbc:"+vendor+"://"+server+":"+port+"/"+database+params;
    private static Connection conn=null;
    private Connector(){}
    public synchronized static Connection getConnection(){
        try {
                if(conn==null || conn.isClosed()){
                    try {
                        Class.forName(driver);
                        conn=DriverManager.getConnection(url, user, pass);
                    } catch (Exception e) { e.printStackTrace(); }
                }
        } catch (Exception e) { e.printStackTrace(); }
        return conn;
    }  
}

/*
Database name: S36WIHK7x4

Password: s8Wp83GabH

Server: remotemysql.com

Port: 3306
*/
