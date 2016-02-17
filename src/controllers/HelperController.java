package controllers;


import java.util.ArrayList;
import java.text.ParseException;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import data.Account;
import data.Attendance;
import data.Grade;
import data.HelperDAO;
import data.Student;
import data.User;

@Controller
@SessionAttributes({"sessionUser","accessLevel"})
public class HelperController {

	@Autowired
	private HelperDAO helperDAO;

	@ModelAttribute("sessionUser")
	public User initUser() {
		return null;
	}
	@ModelAttribute("accessLevel")
	public String initAccessLevel()
	{
		return "";
	}

	@RequestMapping(path = "attendance.do")
	public ModelAndView showAttendance(@ModelAttribute("sessionUser") User sessionUser, @ModelAttribute("accessLevel") String accessLevel) {
		System.out.println("TEST: in MVC showAttendance");
		System.out.println("TEST: User access level is "+accessLevel);
		System.out.println("TEST: User's first name"+sessionUser.getFirstname());
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("jspString","attendance.jsp");
		
		if(accessLevel.equals("1"))
		{		
			System.out.println("TEST: inside the attendance.do access 'if' block");
			
//			Student currentStudent = (Student) sessionUser;
			
//			System.out.println(currentStudent.getFirstname());
//			System.out.println(((List)currentStudent.getAttendances()).get(0).toString());
			List<Attendance> userAttendance = helperDAO.getUserAttendanceByID((Student)sessionUser);
			
			mv.addObject("userAttendance", userAttendance);
			for (Attendance attendance : userAttendance) {
				System.out.println(attendance.getDate());
				
			}
			System.out.println("in student");
			return mv;
		}
		else if(accessLevel.equals("2") || accessLevel.equals("3"))
		{
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			System.out.println("in admin/ta");
		}
		return mv;
//		else if (al != "2" && al != "3")
//		{
//			//mv.setViewName("index.jsp");
//			
//			return mv;
//			
//		}
//		else{
//			return mv;
//		}
//		
	}
	@RequestMapping(path = "attendanceStudent.do", method = RequestMethod.GET)
	public ModelAndView showAttendance(@ModelAttribute("sessionUser") User sessionUser,@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate ) throws ParseException {
		
		List<Attendance> studentAttendanceByDate = helperDAO.getStudentAttendanceWithDates(startDate, endDate, sessionUser.getId());
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", studentAttendanceByDate);
		mv.addObject("jspString","attendance.jsp");
		
		return mv;
	}
	@RequestMapping(path="attendanceAdminAndTA", method=RequestMethod.GET)
	public ModelAndView adminShowAttendance(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, @RequestParam("lastname") String lastname ) throws ParseException
	{
		List<Attendance> adminStudentAttendance = helperDAO.getStudentAttendanceWithDatesByLastName(startDate, endDate, lastname);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", adminStudentAttendance);
		mv.addObject("jspString","attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}
	@RequestMapping(path="createClassAttendances", method=RequestMethod.POST)
	public ModelAndView adminCreateClassAttendances (@RequestParam("cohort") String cohort)
	{
		List<Attendance> todaysAttendancelist = helperDAO.createDailyAttendance(cohort);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", todaysAttendancelist);
		mv.addObject("jspString","attendance.jsp");
		return null;
	}
	
	@RequestMapping(path = "grades.do", method = RequestMethod.GET)
	public ModelAndView showGrades(@ModelAttribute("sessionUser") User sessionUser)
	{
		Student currentStudent = (Student)sessionUser;
		List<Grade> usergrades = (List)currentStudent.getGrades();
		return new ModelAndView("UserDesktop.jsp", "userGrades", usergrades);
	}
	@RequestMapping(path = "SetUser.do", method = RequestMethod.GET)
	public ModelAndView setUser() {

		User user = helperDAO.setUser();

		System.out.println(user);

		return new ModelAndView("index.jsp", "user", user);
	}
	
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView loginUser(@RequestParam("username") String username,
			@RequestParam("password") String password) {

		ModelAndView mv = new ModelAndView();
		User currentUser = helperDAO.loginUser(username, password);
		String accessLevel = currentUser.getAccount().getAccessLevel();
		// User currentUser = helperDAO.loginUser("inst", "54321");
		if (currentUser == null) {
			mv.setViewName("index.jsp");
			return mv;
		}
		mv.setViewName("UserDesktop.jsp");
		mv.addObject("jspString", null);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("sessionUser", currentUser);
		return mv;
	}
	
}
