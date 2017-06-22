/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iwa.dao;

/**
 *
 * @author Andres
 */

 
import java.util.List;
 
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository; 
import com.iwa.model.Mathematics;
 
@Repository
public class MathematicsDAOlmpl implements MathematicsDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public void addMathematic(Mathematics mathematic) {
        sessionFactory.getCurrentSession().saveOrUpdate(mathematic);
 
    }
 
    @SuppressWarnings("unchecked")
    public List<Mathematics> getAllMathematics() {
 
        return sessionFactory.getCurrentSession().createQuery("from Mathematics").list();
    }
 
    @Override
    public void deleteMathematic(Integer mathematicId) {
        Mathematics mathematic = (Mathematics) sessionFactory.getCurrentSession().load(
                Mathematics.class, mathematicId);
        if (null != mathematic) {
            this.sessionFactory.getCurrentSession().delete(mathematic);
        }
 
    }
 
    public Mathematics getMathematic(int Mathematicid) {
        return (Mathematics) sessionFactory.getCurrentSession().get(
                Mathematics.class, Mathematicid);
    }
 
    @Override
    public Mathematics updateMathematic(Mathematics mathematic) {
        sessionFactory.getCurrentSession().update(mathematic);
        return mathematic;
    }
 
}
