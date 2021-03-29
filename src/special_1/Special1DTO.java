package special_1;

public class Special1DTO {
	String name;
	int femaleCount;
	int maleCount = 0;
	
	public Special1DTO(String name, int femaleCount, int maleCount) {
		this.name = name;
		this.femaleCount = femaleCount;
		this.maleCount = maleCount;
	}
	
	public Special1DTO(String name, int femaleCount) {
		this.name = name;
		this.femaleCount = femaleCount;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFemaleCount() {
		return femaleCount;
	}

	public void setFemaleCount(int femaleCount) {
		this.femaleCount = femaleCount;
	}

	public int getMaleCount() {
		return maleCount;
	}

	public void setMaleCount(int maleCount) {
		this.maleCount = maleCount;
	}
	
}
