package com.caniborrow.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caniborrow.models.Post;
import com.caniborrow.repositories.PostRepository;

@Service
public class PostService {
	@Autowired
	private PostRepository postRepo;

	// Get all posts
	public List<Post> getAllPosts() {
		return postRepo.findAll();
	}

	// Add Post
	public Post createPost(Post post) {
		return postRepo.save(post);
	}

	// find post by id
	public Post findById(Long id) {
		return postRepo.findById(id).orElse(null);
	}

	// Update Post
	public Post updatePost(Post post) {
		return postRepo.save(post);
	}

	// Delete Post
	public void deletePost(Long id) {
		postRepo.deleteById(id);
	}

}
