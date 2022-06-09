package com.caniborrow.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.caniborrow.models.Post;
import com.caniborrow.services.PostService;

@Controller
public class DashController {
	@Autowired
	private PostService postService;

	@GetMapping("/dashboard")
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/";
		}

		else {
			model.addAttribute("posts", postService.getAllPosts());
			return "dashboard.jsp";
		}
	}

	// ------------------Posts MAPPING---------------------

	@GetMapping("/newPost")
	public String newPost(@ModelAttribute("newPost") Post post,
			HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/";
		}

		return "newPost.jsp";
	}

	@PostMapping("/createPost")
	public String createPost(@Valid @ModelAttribute("newPost") Post post,
			BindingResult result,
			HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/";
		}

		if (result.hasErrors()) {
			return "newPost.jsp";
		}

		postService.createPost(post);
		return "redirect:/dashboard";
	}

	@GetMapping("/post/{id}")
	public String postDisplay(@PathVariable Long id, Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/";
		}
		Post post = postService.findById(id);
		model.addAttribute("postModel", post);
		return "post.jsp";
	}

	@GetMapping("/editPostPage/{id}")
	public String editPostPage(@PathVariable Long id, @ModelAttribute("editPost") Post post, HttpSession session,
			Model model) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/";
		}
		Post editPost = postService.findById(id);
		model.addAttribute("editPost", editPost);
		return "editPost.jsp";
	}

	@PutMapping("/editPost/{userId}/{id}")
	public String editPost(@PathVariable Long userId, @PathVariable Long id,
			@Valid @ModelAttribute("editPost") Post post) {
		postService.updatePost(post);
		return "redirect:/profile/{userId}";
	}

	@DeleteMapping("/deletePost/{userId}/{id}")
	public String deletePost(@PathVariable Long userId, @PathVariable Long id,
			@ModelAttribute("deletePost") Post post) {
		postService.deletePost(id);
		return "redirect:/profile/{userId}";
	}

	// ------------------------------Profile Mapping----------------------------

	@GetMapping("/profile/{id}")
	public String profile(@PathVariable Long id, HttpSession session, Model model) {
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/";
		}
		model.addAttribute("postsByUser", postService.findByUserId(id));
		return "profile.jsp";
	}
}
