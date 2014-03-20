package com.example.repositories;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "ARTZV_PHONE_TYPE")
public class PhoneType {

	@Id
	@Column(name = "PHONE_TYPE")
	private String type;

	@Column(name = "PHONE_DESCRIPTION")
	private String description;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
