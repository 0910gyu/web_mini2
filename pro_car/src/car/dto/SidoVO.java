package car.dto;

public class SidoVO {
	private int sidoID;
	private String sidoNm;
	
	public SidoVO() {}

	public SidoVO(int sidoID, String sidoNm) {
		super();
		this.sidoID = sidoID;
		this.sidoNm = sidoNm;
	}

	public int getSidoID() {
		return sidoID;
	}

	public void setSidoID(int sidoID) {
		this.sidoID = sidoID;
	}

	public String getSidoNm() {
		return sidoNm;
	}

	public void setSidoNm(String sidoNm) {
		this.sidoNm = sidoNm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SidoVO [sidoID=");
		builder.append(sidoID);
		builder.append(", sidoNm=");
		builder.append(sidoNm);
		builder.append("]");
		return builder.toString();
	}

	
	
}
