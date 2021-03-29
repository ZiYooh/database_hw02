package special_3;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Special3DAO {
	private Connection conn;
	private ResultSet rs;

	public Special3DAO() {
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
	
	public ArrayList<Special3DTO> getList(String search) {

		ArrayList<Special3DTO> special3List = null;

		PreparedStatement pstmt = null;

		String SQL = "SELECT C.name, R.supplierName, COUNT(R.supplierName) FROM Customer as C, (SELECT T.customerName, P.supplierName FROM Product as P, Transaction as T WHERE P.productID = T.productID) as R WHERE C.name = R.customerName GROUP BY C.name, R.supplierName HAVING COUNT(R.supplierName) >= " + Integer.parseInt(search);

		try {
	
			pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			special3List = new ArrayList<Special3DTO>();

			while(rs.next()) {

				Special3DTO special3 = new Special3DTO(

					rs.getString(1),

					rs.getString(2),

					rs.getInt(3)

				);

				special3List.add(special3);

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

		return special3List;

	}

	
}