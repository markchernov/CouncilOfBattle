package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import data.HelperDAO;

@Controller

public class HelperController {

	@Autowired HelperDAO helperDAO;
	
}
