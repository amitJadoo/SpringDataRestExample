package com.example.repositories;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "ARTZV_ADDR_TYPE")
public class AddressType {

	@Id
	@Column(name = "ADDR_TYPE")
	private String type;

	@Column(name = "ADDR_DESCRIPTION")
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
