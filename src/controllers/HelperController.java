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

		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("jspString","attendance.jsp");
		
		if(accessLevel.equals("1"))
		{		
			
			
//			Student currentStudent = (Student) sessionUser;
			
//			System.out.println(currentStudent.getFirstname());
//			System.out.println(((List)currentStudent.getAttendances()).get(0).toString());
			List<Attendance> userAttendance = helperDAO.getUserAttendanceByStudent((Student)sessionUser);
			
			mv.addObject("userAttendance", userAttendance);
			System.out.println("in student");
			return mv;
		}
		else if(accessLevel.equals("2") || accessLevel.equals("3"))
		{
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
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
	@RequestMapping(path="attendanceAdminAndTA.do", method=RequestMethod.GET)
	public ModelAndView adminShowAttendance(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate, @RequestParam("lastname") String lastname ) throws ParseException
	{
		List<Attendance> adminStudentAttendance = helperDAO.getStudentAttendanceWithDatesByLastName(startDate, endDate, lastname);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", adminStudentAttendance);
		mv.addObject("jspString","attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}
		
		
	
	@RequestMapping(path= "modifyAttendanceRecord.do", method= RequestMethod.POST)
	public ModelAndView modifyAttendanceRecord(@RequestParam("studentId") String id, @RequestParam("date") String date,  @RequestParam("present") String present,@RequestParam("late") String late,@RequestParam("excused") String excused) throws ParseException{
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		helperDAO.updateDailyAttendance(id, date, present, late, excused);
		System.out.println("i made it through marks thing");
		mv.addObject("jspString","attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}
	@RequestMapping(path="deleteAttendanceRecord.do", method =RequestMethod.POST)
	public ModelAndView deleteAttendanceRecord(@RequestParam("studentId") String id, @RequestParam("date") String date) throws ParseException{
		
			ModelAndView mv = new ModelAndView("UserDesktop.jsp");
			helperDAO.deleteDailyStudentAttendanceRecord(id, date);
			System.out.println("in the delete");
			mv.addObject("jspString","attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			return mv;
		}
		
	@RequestMapping(path="createClassAttendances.do", method=RequestMethod.POST)
	public ModelAndView adminCreateClassAttendances (@RequestParam("cohort") String cohort) throws ParseException
	{
		List<Attendance> todaysAttendancelist = helperDAO.createDailyAttendance(cohort);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", todaysAttendancelist);
		mv.addObject("jspString","attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}
	
	@RequestMapping(path = "grades.do", method = RequestMethod.GET)
	public ModelAndView showGrades(@ModelAttribute("sessionUser") User sessionUser)
	{
		Student currentStudent = (Student)sessionUser;
		List<Grade> usergrades = helperDAO.getGradeByUserId((Student)sessionUser);
		return new ModelAndView("UserDesktop.jsp", "userGrades", usergrades);
	}
	@RequestMapping(path = "SetUser.do", method = RequestMethod.GET)
	public ModelAndView setUser() {

		User user = helperDAO.setUser();

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
