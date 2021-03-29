package product;

public class ProductDTO {
	String name;
	String productID;
	String supplierName;
	
	public ProductDTO(String name, String productID, String supplierName) {
		this.name = name;
		this.productID = productID;
		this.supplierName = supplierName;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
}
