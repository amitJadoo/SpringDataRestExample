package com.example.repositories;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.repository.annotation.RestResource;

@RestResource(path = "user")
public interface UserRepository extends PagingAndSortingRepository<User, Long> {

}
