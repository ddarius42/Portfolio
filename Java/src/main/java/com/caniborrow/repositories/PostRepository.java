package com.caniborrow.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.caniborrow.models.Post;

public interface PostRepository extends CrudRepository<Post,Long>{
	List<Post> findAll();

}
