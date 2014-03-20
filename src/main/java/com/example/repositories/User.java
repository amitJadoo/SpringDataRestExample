package com.example.repositories;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "ARTZV_USERS")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "USER_ID")
	private long userId;

	@Column(name = "EMAIL_ID")
	private String emailId;

	@Column(name = "FIRST_NAME")
	private String firstName;

	@Column(name = "MIDDLE_NAME")
	private String middleName;

	@Column(name = "LAST_NAME")
	private String lastName;

	@Column(name = "SOCIAL_NETWORK_FLG")
	private String socNetFlg;

	@Column(name = "AUTHORIZED_FLG")
	private String authFlg;

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSocNetFlg() {
		return socNetFlg;
	}

	public void setSocNetFlg(String socNetFlg) {
		this.socNetFlg = socNetFlg;
	}

	public String getAuthFlg() {
		return authFlg;
	}

	public void setAuthFlg(String authFlg) {
		this.authFlg = authFlg;
	}
}
