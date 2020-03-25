package foody;

import java.sql.*;
import java.util.ArrayList;

public class Main {
 
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		Conector instancia = Conector.getInstancia();
		
		
		//EJERCICIO 1
		try {
			ArrayList <String> lista = instancia.getEjercicio1();
			System.out.println("1. CLIENTES CUYA TARJETA TIENE LA PALABRA 'INS'");
			for(String nombre :lista) {
				System.out.println("  - "+nombre);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		
		
		
		//EJERCICIO 2
		try {
			ArrayList <String> lista = instancia.getEjercicio2();
			System.out.println("\n\n2. CLIENTES QUE PAGARON DE MANERA ONLINE");
			System.out.println("   PIN CODE - NOMBRE");
			for(String clientes :lista) {
				System.out.println("      "+clientes);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}

		
		
		//EJERCICIO 3
		try {
			ArrayList <String> lista = instancia.getEjercicio3();
			double promedio = instancia.Ejercicio31();
			System.out.println("\n\n3. ESTADO DE LAS ÓRDENES DONDE EL PRECIO DE MENÚ ES MAYOR A PROMEDIO");
			System.out.println("   PROMEDIO: "+promedio);
			System.out.println("    ID -   ESTADO  - PRECIO");
			for(String ordenes :lista) {
				System.out.println("   "+ordenes);
			}
		}catch (SQLException e){
			e.printStackTrace();
		}
		
	
	}

}
