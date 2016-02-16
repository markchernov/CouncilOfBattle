package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.Attendance;
import data.HelperDAO;
import data.Student;
import data.User;



@Controller
@SessionAttributes("sessionUser")
public class HelperController {

	@Autowired 
	private HelperDAO helperDAO;
	
	@ModelAttribute("sessionUser")
	public User initUser()
	{
		return null;
	}
	@RequestMapping(path="GetUser.do", method=RequestMethod.GET)
	
	public ModelAndView getStudentAttendance(@RequestParam("sessionUser") User sessionUser) {
		
		Student currentStudent = (Student)sessionUser;
				
		List<Attendance> userAttendance = (List)currentStudent.getAttendances();
		
		
		return new ModelAndView("index.jsp", "userattendance", userAttendance);
	}

@RequestMapping(path="SetUser.do", method=RequestMethod.GET)
	
	public ModelAndView setUser() {
		
		
		User user = helperDAO.setUser();
		
		System.out.println(user);
		
		return new ModelAndView("index.jsp", "user", user);
	}
	
@RequestMapping(path="Login.do", method=RequestMethod.POST)
public ModelAndView loginUser(@RequestParam("username") String username, @RequestParam("password") String password)
{
	
	ModelAndView mv = new ModelAndView("index.jsp");
	/*User currentUser = helperDAO.loginUser(username, password);*/
	User currentUser = helperDAO.loginUser("inst", "54321");
	if(currentUser == null)
	{
		//do X
	}
	
	mv.addObject("sessionUser" , currentUser);
	return mv;
}

	
	
	
	
}
