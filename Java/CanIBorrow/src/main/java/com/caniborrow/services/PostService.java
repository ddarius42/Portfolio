package com.caniborrow.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.caniborrow.models.Post;
import com.caniborrow.models.User;
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

	// find post by userId
	public List<Post> findByUserId(Long id) {
		return postRepo.findByUserId(id);
	}

	// find favorites by user id
	public List<Post> findFavPostByUserId(Long id) {
		return postRepo.findFavPostByUserId(id);
	}

	// Update Post
	public void updatePost(Post post) {
		postRepo.save(post);
	}

	// Delete Post
	public void deletePost(Long id) {
		postRepo.deleteById(id);
	}

	// favorite post
	public void favoritePost(Post post, User user) {
		List<User> likers = post.getLikers();
		likers.add(user);
		postRepo.save(post);
	}

	public void unFavoritePost(Post post, User user) {
		List<User> likers = post.getLikers();
		likers.remove(user);
		postRepo.save(post);
	}

}
