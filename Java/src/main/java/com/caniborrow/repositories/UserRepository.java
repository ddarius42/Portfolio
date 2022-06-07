package com.caniborrow.repositories;

import org.springframework.data.repository.CrudRepository;

import com.caniborrow.models.User;


public interface UserRepository extends CrudRepository <User, Long>{
	User findByEmail(String email);
	
}
