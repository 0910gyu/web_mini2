package car.dto;

public class ChargerVO {
	private int stationId;
	private String cpNm;
	
	public ChargerVO() {}

	public ChargerVO(int stationId, String cpNm) {
		super();
		this.stationId = stationId;
		this.cpNm = cpNm;
	}

	public int getStationId() {
		return stationId;
	}

	public void setStationId(int stationId) {
		this.stationId = stationId;
	}

	public String getCpNm() {
		return cpNm;
	}

	public void setCpNm(String cpNm) {
		this.cpNm = cpNm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ChargerVO [stationId=");
		builder.append(stationId);
		builder.append(", cpNm=");
		builder.append(cpNm);
		builder.append("]");
		return builder.toString();
	}
	
}
