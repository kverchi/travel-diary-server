package com.kverchi.diary.model.entity;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="posts")
public class Post {
	@Id
	@Column(name="post_id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int postId;
	@Column(name="created_at")
	private ZonedDateTime createdAt;
	@Column(name="updated_at")
	private ZonedDateTime updatedAt;
	@Column(name="title")
	private String title;
	@Column(name="description")
	private String description;
	@Column(name="text")
	private String text;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="sight_id")
	private CountriesSight countriesSight;
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	/*@OneToMany(fetch=FetchType.LAZY, orphanRemoval=true)
	@JoinColumn(name="post_id")
	private Set<Comment> postComments;*/

	public Post() {};
	public Post(int postId, String title, String text) {
		this.postId = postId;
		this.title = title;
		this.text = text;
	}

	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public ZonedDateTime getCreatedAt() {
		DateTimeFormatter formatter = DateTimeFormatter.RFC_1123_DATE_TIME;
		String text = createdAt.format(formatter);
		createdAt = ZonedDateTime.parse(text, formatter);
		return createdAt;
	}
	public void setCreatedAt(ZonedDateTime createdAt) {
		this.createdAt = createdAt;
	}
	@PrePersist
	public void setCreatedDate() {
		this.createdAt = ZonedDateTime.now();
		this.updatedAt = ZonedDateTime.now();
	}
	public ZonedDateTime getUpdatedAt() {
		DateTimeFormatter formatter = DateTimeFormatter.RFC_1123_DATE_TIME;
		String text = updatedAt.format(formatter);
		updatedAt = ZonedDateTime.parse(text, formatter);
		return updatedAt;
	}

	public void setUpdatedAt(ZonedDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}
	@PreUpdate
	public void setUpdatedDate() {
		this.updatedAt = ZonedDateTime.now();
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public CountriesSight getCountriesSight() {
		return countriesSight;
	}

	public void setCountriesSight(CountriesSight countriesSight) {
		this.countriesSight = countriesSight;
	}
	/*public Set<Comment> getPostComments() {
		return postComments;
	}
	public void setPostComments(Set<Comment> postComments) {
		this.postComments = postComments;
	}*/
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString(){
		return "id="+ postId +", title="+title+", text="+text;
	}
	
}
