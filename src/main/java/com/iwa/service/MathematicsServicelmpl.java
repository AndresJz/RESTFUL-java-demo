/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iwa.service;

/**
 *
 * @author Andres
 */

import java.util.List;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.iwa.dao.MathematicsDAO;
import com.iwa.model.Mathematics;
 
@Service
@Transactional
public class MathematicsServicelmpl implements MathematicsService {
 
    @Autowired
    private MathematicsDAO mathematicDAO;
 
    @Override
    @Transactional
    public void addMathematic(Mathematics mathematic) {
        mathematicDAO.addMathematic(mathematic);
    }
 
    @Override
    @Transactional
    public List<Mathematics> getAllMathematics() {
        return mathematicDAO.getAllMathematics();
    }
 
    @Override
    @Transactional
    public void deleteMathematic(Integer mathematicId) {
        mathematicDAO.deleteMathematic(mathematicId);
    }
 
    public Mathematics getMathematic(int mathematicid) {
        return mathematicDAO.getMathematic(mathematicid);
    }
 
    public Mathematics updateMathematic(Mathematics mathematic) {
        // TODO Auto-generated method stub
        return mathematicDAO.updateMathematic(mathematic);
    }
 
    public void setMathematicDAO(MathematicsDAO mathematicDAO) {
        this.mathematicDAO = mathematicDAO;
    }

 
}