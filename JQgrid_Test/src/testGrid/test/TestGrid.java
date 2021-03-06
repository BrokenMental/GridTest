package testGrid.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.sf.json.util.JSONStringer;

public class TestGrid {
	private static String ConnectionString = "jdbc:mysql://localhost:3306/swproject?useUnicode=true&useUnicode=true&characterEncoding=utf-8"; //한글깨짐 해결(JDBC 연동에서 한글 인코딩 문제가 있음)
	private static String Id = "root";
	private static String Password = "1234";
	private static String Classname = "com.mysql.jdbc.Driver";
	String name = "";
	String value = "";

	public JSONStringer getData() {
		JSONStringer js = null;
		try {
			PreparedStatement stmt = null;
			Connection conn = null;
			ResultSet rs = null;
			Class.forName(Classname);
			conn = DriverManager.getConnection(ConnectionString, Id, Password);
			stmt = conn.prepareStatement("select n_source as name, count(n_source) as total from crawler group by n_source having name is not null order by total desc");
			rs = stmt.executeQuery();
			js = new JSONStringer();
			js.array();
			while (rs.next()) {
				js.object()
				.key("name").value(rs.getString("name"))
				.key("total").value(rs.getString("total"))
				.endObject();
			}
			js.endArray();

			stmt.close();
			conn.close();
		} catch (Exception e) {
			System.out.println(":::SQL Error::::" + e.getMessage());
		}
		return js;
	}
	/*
	 * private static String ConnectionString =
	 * "jdbc:mysql://localhost:3306/testgrid"; private static String Id =
	 * "root"; private static String Password = "1234"; private static String
	 * Classname = "com.mysql.jdbc.Driver"; String name=""; String value="";
	 * public JSONStringer getData(){ JSONStringer js = null; try{
	 * PreparedStatement stmt = null; Connection conn = null; ResultSet rs=
	 * null; Class.forName(Classname); conn =
	 * DriverManager.getConnection(ConnectionString,Id,Password); stmt =
	 * conn.prepareStatement("select * from test"); rs = stmt.executeQuery(); js
	 * = new JSONStringer(); js.array(); while(rs.next()){ js.object()
	 * .key("name").value(rs.getString("name"))
	 * .key("value").value(rs.getString("value")) .endObject(); } js.endArray();
	 * 
	 * stmt.close(); conn.close(); }catch(Exception e){
	 * System.out.println(":::SQL Error::::" + e.getMessage()); } return js; }
	 */

}
