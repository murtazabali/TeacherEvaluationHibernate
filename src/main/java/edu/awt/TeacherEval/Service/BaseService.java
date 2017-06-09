package edu.awt.TeacherEval.Service;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class BaseService {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	protected Session getSession(){
		Session session;
		
		try{
			session = sessionFactory.getCurrentSession();
		}
		catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		return session;
	}
}
