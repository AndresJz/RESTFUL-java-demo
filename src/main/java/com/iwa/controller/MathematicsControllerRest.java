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

@RestController 
public class MathematicsControllerRest { 
    
    @Autowired
    private MathematicsService mathematicsService;
    
    @RequestMapping(value = "/Mathematics", method = RequestMethod.GET,headers="Accept=application/json") 
    public List<Mathematics> getMathematics() { 
        List<Mathematics> listMathematics = mathematicsService.getAllMathematics();        
        return listMathematics;
    }
    
    @RequestMapping(value = "/Mathematics/{id}", method = RequestMethod.GET,headers="Accept=application/json") 
    public Mathematics getMathematic(@PathVariable int id) { 
        Mathematics mathematic = mathematicsService.getMathematic(id);
        return mathematic;
    } 
    
    
    /*
        @RequestMapping(value = "/deleteMathematic", method = RequestMethod.GET)
    public ModelAndView deleteMathematic(HttpServletRequest request) {
        int mathematicId = Integer.parseInt(request.getParameter("id"));
        mathematicsService.deleteMathematic(mathematicId);
        return new ModelAndView("redirect:/");
    }
 
    @RequestMapping(value = "/editMathematic", method = RequestMethod.GET)
    public ModelAndView editMathematic(HttpServletRequest request) {
        int mathematicId = Integer.parseInt(request.getParameter("id"));
        Mathematics mathematic = mathematicsService.getMathematic(mathematicId);
        ModelAndView model = new ModelAndView("form.jsp");
        model.addObject("mathematic", mathematic);
 
        return model;
    }
    */
}






