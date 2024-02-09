package com.jsp.dao.implementation;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import com.jsp.dao.Dao;
import com.jsp.database.configauration.DataBaseConfiguration;
import com.jsp.model.Book;
import com.jsp.model.Recorddd;
import com.jsp.model.User;

public class DaoImplementation implements Dao {

	EntityManager entityManager = DataBaseConfiguration.getEntityManager();

	@Override
	public boolean addBook(Book book) {

		EntityTransaction transaction = null;
		try {
			transaction = entityManager.getTransaction();
			transaction.begin();

			entityManager.persist(book);

			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateBook(Book book) {
		EntityTransaction transaction = null;
		try {
			transaction = entityManager.getTransaction();
			transaction.begin();

			entityManager.merge(book);

			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteBook(Long bookId) {
		EntityTransaction transaction = null;
		try {
			transaction = entityManager.getTransaction();
			transaction.begin();

			Book book = entityManager.find(Book.class, bookId);
			if (book != null) {
				entityManager.remove(book);
			}

			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public Book findBookById(Long bookId) {
		return entityManager.find(Book.class, bookId);
	}

	@Override
	public List<Book> listOfBooks() {
		String jpql = "SELECT b FROM Book b";
		Query query = entityManager.createQuery(jpql);
		List<Book> books = query.getResultList();
		return books;
	}

	@Override
	public User login(String email, String password) {
		String jpql = "SELECT u FROM User u WHERE u.email = :email AND u.password = :password";

		Query query = entityManager.createQuery(jpql);

		query.setParameter("email", email);
		query.setParameter("password", password);

		try {
			return (User) query.getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean addUser(User user) {
		EntityTransaction transaction = null;
		try {
			transaction = entityManager.getTransaction();
			transaction.begin();

			entityManager.persist(user);

			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean addRecord(Recorddd record) {
		EntityTransaction transaction = null;
		try {
			transaction = entityManager.getTransaction();
			transaction.begin();

			entityManager.persist(record);

			transaction.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public User findUserById(Long UserId) {
		
		return entityManager.find(User.class, UserId);
	}

	@Override
	public List<Recorddd> listOfRecord() {
	    String jpql = "SELECT r FROM Recorddd r";
	    Query query = entityManager.createQuery(jpql);
	    List<Recorddd> recorddds = query.getResultList();
	    return recorddds;
	}




	@Override
	public Recorddd findRecordById(Long recordId) {
		return entityManager.find(Recorddd.class, recordId);
	}
}
