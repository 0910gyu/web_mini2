package car.dto;

public class Station2VO {
	private int id;
	private String csNm;
	private String addr;
	private String lat;
	private String longi;
	private int code;
	private int cnt;
	
	public Station2VO() {}

	public Station2VO(int id, String csNm, String addr, String lat, String longi, int code) {
		super();
		this.id = id;
		this.csNm = csNm;
		this.addr = addr;
		this.lat = lat;
		this.longi = longi;
		this.code = code;
	}

	public Station2VO(int id, String csNm, String addr, String lat, String longi, int code, int cnt) {
		super();
		this.id = id;
		this.csNm = csNm;
		this.addr = addr;
		this.lat = lat;
		this.longi = longi;
		this.code = code;
		this.cnt = cnt;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCsNm() {
		return csNm;
	}

	public void setCsNm(String csNm) {
		this.csNm = csNm;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLongi() {
		return longi;
	}

	public void setLongi(String longi) {
		this.longi = longi;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("station2VO [id=");
		builder.append(id);
		builder.append(", csNm=");
		builder.append(csNm);
		builder.append(", addr=");
		builder.append(addr);
		builder.append(", lat=");
		builder.append(lat);
		builder.append(", longi=");
		builder.append(longi);
		builder.append(", code=");
		builder.append(code);
		builder.append(", cnt=");
		builder.append(cnt);
		builder.append("]");
		return builder.toString();
	}
	
	
}
