package com.jsp.database.configauration;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;

public class DataBaseConfiguration {

	public static EntityManager getEntityManager()
	{
		return Persistence.createEntityManagerFactory("java").createEntityManager();
	}
}
