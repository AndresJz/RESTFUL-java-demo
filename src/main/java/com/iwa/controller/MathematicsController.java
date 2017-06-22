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

import java.io.IOException;
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
 
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.iwa.model.Mathematics;
import com.iwa.service.MathematicsService;

 
@Controller
public class MathematicsController {
 
    private static final Logger logger = Logger
            .getLogger(MathematicsController.class);
 
    public MathematicsController() {
        System.out.println("EmployeeController()");
    }
 
    @Autowired
    private MathematicsService mathematicsService;
 
    @RequestMapping(value = "/")
    public ModelAndView listMathematic(ModelAndView model) throws IOException {
        List<Mathematics> listMathematics = mathematicsService.getAllMathematics();
        model.addObject("listMathematic", listMathematics);
        model.setViewName("home.jsp");
        return model;
    }
    
    @RequestMapping(value = "/bubble")
    public ModelAndView viewBubble(ModelAndView model) throws IOException {
        List<Mathematics> listMathematics = mathematicsService.getAllMathematics();
        model.addObject("listMathematic", listMathematics);
        model.setViewName("bubble.jsp");
        return model;
    }
    
    @RequestMapping(value = "/line")
    public ModelAndView viewLine(ModelAndView model) throws IOException {
        List<Mathematics> listMathematics = mathematicsService.getAllMathematics();
        model.addObject("listMathematic", listMathematics);
        model.setViewName("line.jsp");
        return model;
    }
    
 
    @RequestMapping(value = "/newMathematic", method = RequestMethod.GET)
    public ModelAndView newContact(ModelAndView model) {
        Mathematics mathematic = new Mathematics();
        model.addObject("mathematic", mathematic);
        model.setViewName("form.jsp");
        return model;
    }
 
    
    @RequestMapping(value = "/saveMathematic", method = RequestMethod.POST)
    public ModelAndView saveEmployee(@ModelAttribute Mathematics mathematic) {
        if (mathematic.getId() == 0) { // if employee id is 0 then creating the
            // employee other updating the employee
            mathematicsService.addMathematic(mathematic);
        } else {
            mathematicsService.updateMathematic(mathematic);
        }
        return new ModelAndView("redirect:/");
    }
 
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
    
}