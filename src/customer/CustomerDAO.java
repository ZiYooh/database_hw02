package customer;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class CustomerDAO {
	private Connection conn;
	private ResultSet rs;

	public CustomerDAO() {
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
	
	public ArrayList<CustomerDTO> getList(String customerDivide, String search) {

		ArrayList<CustomerDTO> customerList = null;

		PreparedStatement pstmt = null;

		String SQL = "SELECT * FROM Customer ";

		try {
			
			if(search != null && !search.equals("")) {
				
				if(customerDivide.equals("gender"))
					SQL += "WHERE " + customerDivide.trim() + " = '"+search.trim()+"'";
				
				else
					SQL += "WHERE " + customerDivide.trim() + " LIKE '%"+search.trim()+"%'";

			}
			else {

			}
			
			
			pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			customerList = new ArrayList<CustomerDTO>();

			while(rs.next()) {

				CustomerDTO customer = new CustomerDTO(

					rs.getString(1),

					rs.getString(2),

					rs.getString(3),

					rs.getString(4)

				);

				customerList.add(customer);

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

		return customerList;

	}

	
}



