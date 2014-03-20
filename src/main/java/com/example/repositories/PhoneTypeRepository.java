package com.example.repositories;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.repository.annotation.RestResource;

@RestResource(path = "phoneType")
public interface PhoneTypeRepository extends
		PagingAndSortingRepository<PhoneType, String> {

}
