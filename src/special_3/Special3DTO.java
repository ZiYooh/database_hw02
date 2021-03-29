package special_3;

public class Special3DTO {
	String name;
	String supplierName;
	int count;
	
	public Special3DTO(String name, String supplierName, int count) {
		super();
		this.name = name;
		this.supplierName = supplierName;
		this.count = count;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}
