

package beautysalon;

import java.sql.DriverManager;
import java.sql.Connection;
import javax.swing.JOptionPane;

public class DatabaseConnection {
          
    public      Connection Con;
    public DatabaseConnection(){
        try {
            String url="jdbc:derby://localhost:1527/beautysalon";
             url="jdbc:mysql://localhost:3306/beautysalon";
            Class.forName("com.mysql.jdbc.Driver");
            Con= DriverManager.getConnection(url,"root","");
            System.out.println("connected");
        } catch (Exception ex) {
          System.out.println(ex);
        }
    }
    public static void main(String args[])
    {
    
    DatabaseConnection obj = new DatabaseConnection();
    }
}
