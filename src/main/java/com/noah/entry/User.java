package com.noah.entry;

/**
 * User
 * Created by noah on 17-6-13.
 * <p>
 * name: $("#search_name").val(),
 * sex: $("#search_sex").val(),
 * phone: $("#search_mobile").val(),
 * email: $("#search_email").val()
 */
public class User {
	private String name;
	private String username;
	private String sex;
	private int phone;
	private String email;

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
