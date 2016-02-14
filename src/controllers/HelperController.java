package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.HelperDAO;
import data.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;



@Controller

public class HelperController {

	@Autowired 
	private HelperDAO helperDAO;
	
	@RequestMapping(path="GetUser.do", method=RequestMethod.GET)
	
	public ModelAndView getUser() {
		
		
		User user = helperDAO.getUser(1);
		
		System.out.println(user);
		
		return new ModelAndView("index.jsp", "user", user);
	}

@RequestMapping(path="SetUser.do", method=RequestMethod.GET)
	
	public ModelAndView setUser() {
		
		
		User user = helperDAO.setUser();
		
		System.out.println(user);
		
		return new ModelAndView("index.jsp", "user", user);
	}
	
	
	
	
	
	
}
