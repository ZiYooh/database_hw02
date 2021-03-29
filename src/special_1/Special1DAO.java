package special_1;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Special1DAO {
	private Connection conn;
	private ResultSet rs;

	public Special1DAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/javabook?serverTimezone=UTC";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Special1DTO> getList() {

		ArrayList<Special1DTO> special1List = null;

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String SQL = "SELECT PP1.name, PF, PM  FROM (SELECT P.name, COUNT(P.gender) as PM FROM (SELECT Product.name, Customer.gender FROM Product, Customer, Transaction WHERE Customer.name = Transaction.customerName AND Transaction.productID = Product.productID) as P WHERE P.Gender = 'Male' GROUP BY P.name, P.gender )as PP1, (SELECT P.name, COUNT(P.gender) as PF FROM (SELECT Product.name, Customer.gender FROM Product, Customer, Transaction WHERE Customer.name = Transaction.customerName AND Transaction.productID = Product.productID) as P WHERE P.Gender = 'Female' GROUP BY P.name, P.gender )as PP2 WHERE PP1.name = PP2.name AND PM < PF";
		String SQL2 = "SELECT PP2.name, PF FROM (SELECT P.name, COUNT(P.gender) as PF FROM (SELECT Product.name, Customer.gender FROM Product, Customer, Transaction WHERE Customer.name = Transaction.customerName AND Transaction.productID = Product.productID) as P WHERE P.Gender = 'Female' GROUP BY P.name, P.gender )as PP2, (SELECT P.name, COUNT(P.gender) as PT FROM (SELECT Product.name, Customer.gender FROM Product, Customer, Transaction WHERE Customer.name = Transaction.customerName AND Transaction.productID = Product.productID) as P GROUP BY P.name )as PP3 WHERE PP2.name = PP3.name AND PP3.PT = PP2.PF GROUP BY PP2.name";
		try {
			special1List = new ArrayList<Special1DTO>();
			
			pstmt = conn.prepareStatement(SQL);
			pstmt2 = conn.prepareStatement(SQL2);
			
			rs = pstmt.executeQuery();

			while(rs.next()) {

				Special1DTO customer = new Special1DTO(

					rs.getString(1),

					rs.getInt(2),

					rs.getInt(3)
				);

				special1List.add(customer);
			}
			
			rs = pstmt2.executeQuery();

			while(rs.next()) {

				Special1DTO customer = new Special1DTO(

					rs.getString(1),

					rs.getInt(2)
				);

				special1List.add(customer);
			}
	

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			try {

				if(rs != null) rs.close();

				if(pstmt != null) pstmt.close();

				if(conn != null) conn.close();

			} catch (Exception e) {

				e.printStackTrace();

			}

		}

		return special1List;

	}

	
}