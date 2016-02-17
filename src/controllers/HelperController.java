package controllers;

import java.text.ParseException;
import java.util.List;

import org.eclipse.persistence.internal.codegen.AccessLevel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
@SessionAttributes({"sessionUser",""})
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

	@RequestMapping(path = "attendance.do", method = RequestMethod.GET)
	public ModelAndView showAttendance(@ModelAttribute("sessionUser") User sessionUser, @ModelAttribute("accessLevel") String al) {
		
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", al);
		mv.addObject("jspString","attendance.jsp");
		if(al == "1")
		{		
			Student currentStudent = (Student) sessionUser;
			List<Attendance> userAttendance = (List) currentStudent.getAttendances();
			mv.addObject("userAttendance", userAttendance);
			return mv;
		}
		if(al == "2" || al == "3")
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
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "studentAttendanceByDate", studentAttendanceByDate);
		mv.addObject("jspString","attendance.jsp");
		return mv;
	}
	@RequestMapping(path="attendanceAdminAndTA", method=RequestMethod.GET)
	public ModelAndView adminShowAttendance(@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate ){
		return null;}
	
	@RequestMapping(path = "grades.do", method = RequestMethod.GET)
	public ModelAndView showGrades(@ModelAttribute("sessionUser") User sessionUser)
	{
		Student currentStudent = (Student)sessionUser;
		List<Grade> usergrades = (List)currentStudent.getGrades();
		for (Grade grade : usergrades) {
			System.out.println(grade.getGrade());
		}
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
		String accessLevel = ((Account) (((List) currentUser.getAccounts()).get(0))).getAccessLevel();
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
