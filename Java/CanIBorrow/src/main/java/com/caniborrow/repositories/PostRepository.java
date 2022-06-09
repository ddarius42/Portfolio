package com.caniborrow.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.caniborrow.models.Post;

public interface PostRepository extends CrudRepository<Post, Long> {
	List<Post> findAll();

	// JPQL
	// Native query
	@Query(value = "SELECT * FROM posts where user_id = ?1", nativeQuery = true)
	List<Post> findByUserId(Long id);

}
