package foody;

import java.sql.*;
import java.util.ArrayList;

public class Conector {
 
	// Atributos de la clase
		private static Connection con;
		private static Conector INSTANCE = null;
		
		//Constructor
		private Conector() {
			
		}
		
		//Crear instancia
		private synchronized static void crearInstancia() {
			if (INSTANCE == null){
				INSTANCE = new Conector();
				crearConexion();
			}
		}
		
		//Obtener instancia
		public static Conector getInstancia () {
			if (INSTANCE == null){
				crearInstancia();
			}
			return INSTANCE;
		}
		
		
		//Crear conexion
		private static void crearConexion() {
			String host = "127.0.0.1";
			String user = "Justina";
			String password = "29septiembre2000*";
			String dataBase = "manufacturing";
			try {
				//Importando la libreria de conexion de mysql
				Class.forName("com.mysql.jdbc.Driver");
				
				String urlConexion = "jdbc:mysql://"+host+"/"
				+dataBase+"?user="+user+"&password="+password;
				con = DriverManager.getConnection(urlConexion);
				//System.out.println("Lo lograste");
				
			}catch (Exception e) {
				//System.out.println("Error al conectar a la base de datos");
				//System.out.println(e);
			}
		}
		
		
		
		//EJERCICIO 1
		public ArrayList<String> getEjercicio1() throws SQLException {
			ArrayList<String> lista = new ArrayList<String>();
			PreparedStatement ps = (PreparedStatement) 
					con.prepareStatement("SELECT distinct first_name FROM foody.customer \r\n" + 
							"inner join foody.payment_details on customer.customer_id = payment_details.customer_id \r\n" + 
							"where payment_details.card_holder_name like '%ins%';");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				lista.add(rs.getString("first_name"));
			}
			rs.close();
			return lista;
		}
		
		
		
		
		//EJERCICIO  2
		public ArrayList<String> getEjercicio2() throws SQLException {
			ArrayList<String> lista = new ArrayList<String>();
			PreparedStatement ps = (PreparedStatement) 
					con.prepareStatement("SELECT distinct customer.customer_id, first_name  FROM foody.customer\r\n" + 
							"inner join foody.orders on customer.customer_id = orders.customer_id \r\n" + 
							"inner join foody.payment on orders.order_id = payment.order_id && payment.payment_type = 'ONLINE_PAYMENT';");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				lista.add(rs.getString("customer_id")+"     - "+rs.getString("first_name"));
			}
			rs.close();
			return lista;
		}
		
		
		
		
		//EJERCICIO 3
		public ArrayList<String> getEjercicio3() throws SQLException {
			ArrayList<String> lista = new ArrayList<String>();
			PreparedStatement ps = (PreparedStatement) 
					con.prepareStatement("SELECT order_id, order_status, price FROM foody.orders \r\n" + 
							"inner join foody.menu on menu.menu_id = orders.menu_id \r\n" + 
							"where price>(select avg(price) from foody.menu);");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				lista.add(rs.getString("order_id")+" - "+rs.getString("order_status")+" - "+rs.getString("price"));
			}
			rs.close();
			return lista;
		}
		
		
		
		
		//EJERCICIO 3 (PROMEDIO)
		public int Ejercicio31() throws SQLException {
			int promedio = 0;
			PreparedStatement ps = (PreparedStatement) 
					con.prepareStatement("SELECT AVG(price) as 'Promedio' from foody.menu;");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				promedio = rs.getInt("Promedio");
			}
			rs.close();
			return promedio;
		}
	
}
