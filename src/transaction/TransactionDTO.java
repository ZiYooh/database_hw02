package transaction;

import java.sql.Date;

public class TransactionDTO {
	String transactionNumber;
	String productID;
	double price;
	Date date;
	String customerName;
	
	public TransactionDTO(String transactionNumber, String productID, double price, Date date, String customerName) {
		this.transactionNumber = transactionNumber;
		this.productID = productID;
		this.price = price;
		this.date = date;
		this.customerName = customerName;
	}
	
	public String getTransactionNumber() {
		return transactionNumber;
	}
	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	
}
