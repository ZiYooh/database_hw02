package transaction;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TransactionDAO {
	private Connection conn;
	private ResultSet rs;

	public TransactionDAO() {
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
	
	public ArrayList<TransactionDTO> getList(String transactionDivide, String search) {

		ArrayList<TransactionDTO> transactionList = null;

		PreparedStatement pstmt = null;

		String SQL = "SELECT * FROM transaction ";

		try {
			
			if(search != null && !search.equals("")) {
				
				if(transactionDivide.equals("price")||transactionDivide.equals("transactionNumber"))
					SQL += "WHERE " + transactionDivide.trim() + " = '"+search.trim()+"'";
				
				else
					SQL += "WHERE " + transactionDivide.trim() + " LIKE '%"+search.trim()+"%'";

			}
			else {

			}
			
			
			pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			transactionList = new ArrayList<TransactionDTO>();

			while(rs.next()) {

				TransactionDTO transaction = new TransactionDTO(

					rs.getString(1),

					rs.getString(2),

					rs.getDouble(3),

					rs.getDate(4),
					
					rs.getString(5)

				);

				transactionList.add(transaction);

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

		return transactionList;

	}

	
}
