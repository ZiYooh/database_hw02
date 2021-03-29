package special_2;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Special2DAO {
	private Connection conn;
	private ResultSet rs;

	public Special2DAO() {
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
	
	public ArrayList<Special2DTO> getList(String search) {

		ArrayList<Special2DTO> special2List = null;

		PreparedStatement pstmt = null;

		String SQL = "SELECT name, price, COUNT(transactionNumber) as count FROM Product as P, Transaction as T WHERE date < '"+search+"' AND T.productID = P.productID GROUP BY T.productID HAVING COUNT(transactionNumber) >= ALL(  SELECT COUNT(transactionNumber)  FROM Product as P, Transaction as T  WHERE date < '"+search.trim() +"' AND T.productID = P.productID  GROUP BY T.productID) ORDER BY Price DESC";

		try {
	
			pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			special2List = new ArrayList<Special2DTO>();

			while(rs.next()) {

				Special2DTO special2 = new Special2DTO(

					rs.getString(1),

					rs.getDouble(2),

					rs.getInt(3)

				);

				special2List.add(special2);

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

		return special2List;

	}

	
}
