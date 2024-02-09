package com.jsp.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "book_id")
	@SequenceGenerator(name = "book_id", initialValue = 500, allocationSize = 1)
	private Long bookId;
	private String title;
	private String author;
	private int quantity;
	private double price;
	private String genre;

	
}
