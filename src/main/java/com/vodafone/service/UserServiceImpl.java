package com.vodafone.service;

import com.vodafone.config.HibernateConfig;
import com.vodafone.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    List<User> users = new ArrayList<>();
    private final HibernateConfig hibernateConfig;

    public UserServiceImpl(HibernateConfig hibernateConfig) {
        this.hibernateConfig = hibernateConfig;
    }

    @Override
    public User save(User user) {
        Transaction transaction;
        try (Session session = this.hibernateConfig.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.persist(user);
            transaction.commit();
            return session.get(User.class, user.getFirstName());
        } catch (HibernateException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<User> findAll() {
        try (Session session = this.hibernateConfig.getSessionFactory().openSession()) {
            return session.createQuery("from User ", User.class).list();
        } catch (HibernateException e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

}
