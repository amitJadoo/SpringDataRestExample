package com.example.repositories;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.repository.annotation.RestResource;

@RestResource(path = "addressType")
public interface AddressTypeRepository extends
		PagingAndSortingRepository<AddressType, String> {

}
