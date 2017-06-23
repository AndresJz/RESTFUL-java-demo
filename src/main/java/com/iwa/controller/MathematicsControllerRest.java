/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iwa.controller;

/**
 *
 * @author Andres
 */

import java.util.List; 
import org.springframework.web.bind.annotation.RequestMapping; 
import org.springframework.web.bind.annotation.RequestMethod; 
import org.springframework.web.bind.annotation.RestController; 
import com.iwa.model.Mathematics;
import com.iwa.service.MathematicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/mathematics")
public class MathematicsControllerRest { 
    
    @Autowired
    private MathematicsService mathematicsService;
    
    @RequestMapping(value = "/get", method = RequestMethod.GET,headers="Accept=application/json") 
    public List<Mathematics> getMathematics() { 
        List<Mathematics> listMathematics = mathematicsService.getAllMathematics();        
        return listMathematics;
    }

    @RequestMapping(value = "/get/{id}", method = RequestMethod.GET,headers="Accept=application/json") 
    public Mathematics getMathematic(@PathVariable int id) { 
        Mathematics mathematic = mathematicsService.getMathematic(id);
        return mathematic;
    } 
    
    @RequestMapping(value = "/insert", method = RequestMethod.GET,headers="Accept=application/json") 
    public Mathematics insertMathematic(@RequestBody Mathematics mathematic) { 
        mathematicsService.addMathematic(mathematic);
      
        return mathematic;
    } 
    
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET,headers="Accept=application/json") 
    public int deleteMathematic(@PathVariable int id) { 
        mathematicsService.deleteMathematic(id);
        return id;
    } 
    
    @RequestMapping(value = "/update/{id}", method = RequestMethod.GET,headers="Accept=application/json") 
    public Mathematics updateMathematic(@RequestBody Mathematics mathematic) { 
        mathematicsService.updateMathematic(mathematic); 
        return mathematic;
    }
    
}
