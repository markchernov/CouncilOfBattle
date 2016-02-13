package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import data.HelperDAO;

@Controller

public class HelperController {

	@Autowired HelperDAO helperDAO;
	
	@RequestMapping(path="GetUser.do", method=RequestMethod.GET)
	public ModelAndView getUser() {
		return new ModelAndView("index.jsp");
	}

	
	
	
}
