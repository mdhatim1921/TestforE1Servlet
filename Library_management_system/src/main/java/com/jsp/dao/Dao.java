package com.jsp.dao;

import java.util.List;


import com.jsp.model.Book;
import com.jsp.model.Recorddd;
import com.jsp.model.User;

public interface Dao {

	boolean addBook(Book book);
	boolean addUser(User user);
	boolean addRecord(Recorddd record);
	boolean updateBook(Book book);
	boolean deleteBook(Long bookId);
	User findUserById(Long UserId);
	Book findBookById(Long bookId);
	List<Book> listOfBooks();
	List<Recorddd> listOfRecord();
	Recorddd findRecordById(Long recordId);
	User login(String email ,String password);

}
