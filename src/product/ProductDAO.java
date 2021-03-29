package product;

import java.util.ArrayList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class ProductDAO {
	private Connection conn;
	private ResultSet rs;

	public ProductDAO() {
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
	
	public ArrayList<ProductDTO> getList(String productDivide, String search) {

		ArrayList<ProductDTO> customerList = null;

		PreparedStatement pstmt = null;

		String SQL = "SELECT * FROM Product ";

		try {
			
			if(search != null && !search.equals("")) {
				
				if(productDivide.equals("productID"))
					SQL += "WHERE " + productDivide.trim() + " = '"+search.trim()+"'";
				
				else
					SQL += "WHERE " + productDivide.trim() + " LIKE '%"+search.trim()+"%'";

			}
			else {

			}
			
			
			pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			customerList = new ArrayList<ProductDTO>();

			while(rs.next()) {

				ProductDTO customer = new ProductDTO(

					rs.getString(1),

					rs.getString(2),

					rs.getString(3)
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