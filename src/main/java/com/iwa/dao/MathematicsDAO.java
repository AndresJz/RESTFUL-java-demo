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
import com.iwa.model.Mathematics;

public interface MathematicsDAO {
 
    public void addMathematic(Mathematics mathematic);
 
    public List<Mathematics> getAllMathematics();
 
    public void deleteMathematic(Integer mathematicId);
 
    public Mathematics updateMathematic(Mathematics mathematic);
 
    public Mathematics getMathematic(int mathematicId);

}
