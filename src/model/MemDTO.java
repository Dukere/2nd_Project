package model;

import java.sql.Date;

public class MemDTO {
	
	private String name;
	private String id;
	private String pass;
	private String tel;
	private String mobile;
	private String email;
	private String openemail;
	private String zip;
	private String addr;
	private String extraaddr;
	private java.sql.Date regidate;
	private String auth;
	
	public MemDTO() {
		
	}
	
	public MemDTO(String name, String id, String pass, String tel, String mobile, String email, String openemail, String zip, String addr,
			String extraaddr, Date regidate, String auth) {
		super();
		this.name = name;
		this.id = id;
		this.pass = pass;
		this.tel = tel;
		this.mobile = mobile;
		this.email = email;
		this.openemail = openemail;
		this.zip = zip;
		this.addr = addr;
		this.extraaddr = extraaddr;
		this.regidate = regidate;
		this.auth = auth;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOpenemail() {
		return openemail;
	}

	public void setOpenemail(String openemail) {
		this.openemail = openemail;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getExtraaddr() {
		return extraaddr;
	}

	public void setExtraaddr(String extraaddr) {
		this.extraaddr = extraaddr;
	}
	
	

}
