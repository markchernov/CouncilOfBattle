package controllers;

import java.text.ParseException;
import java.util.ArrayList;
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
import data.Grade;
import data.HelperDAO;
import data.Student;
import data.Ticket;
import data.User;

@Controller
@SessionAttributes({ "sessionUser", "accessLevel" })
public class HelperController {

	@Autowired
	private HelperDAO helperDAO;

	@ModelAttribute("sessionUser")
	public User initUser() {
		return null;
	}

	@ModelAttribute("accessLevel")
	public String initAccessLevel() {
		return "";
	}

	@RequestMapping(path = "attendance.do")
	public ModelAndView showAttendance(@ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) {

		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("jspString", "attendance.jsp");

		if (accessLevel.equals("1")) {

			// Student currentStudent = (Student) sessionUser;

			// System.out.println(currentStudent.getFirstname());
			// System.out.println(((List)currentStudent.getAttendances()).get(0).toString());
			List<Attendance> userAttendance = helperDAO.getUserAttendanceByStudent((Student) sessionUser);

			mv.addObject("userAttendance", userAttendance);
			return mv;
		} else if (accessLevel.equals("2") || accessLevel.equals("3")) {
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		}
		return mv;
		// else if (al != "2" && al != "3")
		// {
		// //mv.setViewName("index.jsp");
		//
		// return mv;
		//
		// }
		// else{
		// return mv;
		// }
		//
	}

	@RequestMapping(path = "attendanceStudent.do", method = RequestMethod.GET)
	public ModelAndView showAttendance(@ModelAttribute("sessionUser") User sessionUser,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate)
					throws ParseException {

		List<Attendance> studentAttendanceByDate = helperDAO.getStudentAttendanceWithDates(startDate, endDate,
				sessionUser.getId());
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", studentAttendanceByDate);
		mv.addObject("jspString", "attendance.jsp");

		return mv;
	}

	@RequestMapping(path = "attendanceAdminAndTA.do", method = RequestMethod.GET)
	public ModelAndView adminShowAttendance(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("lastname") String lastname) throws ParseException {
		List<Attendance> adminStudentAttendance = helperDAO.getStudentAttendanceWithDatesByLastName(startDate, endDate,
				lastname);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userAttendance", adminStudentAttendance);
		mv.addObject("jspString", "attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "modifyAttendanceRecord.do", method = RequestMethod.POST)
	public ModelAndView modifyAttendanceRecord(@RequestParam("studentId") String id, @RequestParam("date") String date,
			@RequestParam("present") String present, @RequestParam("late") String late,
			@RequestParam("excused") String excused, @RequestParam("startHour") String startHour,
			@RequestParam("startMinute") String startMinute, @RequestParam("endHour") String endHour,
			@RequestParam("endMinute") String endMinute) throws ParseException {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		String checkin = startHour + ":" + startMinute;
		String checkout = endHour + ":" + endMinute;

		helperDAO.updateDailyAttendance(id, date, present, late, excused, checkin, checkout);
		mv.addObject("jspString", "attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "deleteAttendanceRecord.do", method = RequestMethod.POST)
	public ModelAndView deleteAttendanceRecord(@RequestParam("studentId") String id, @RequestParam("date") String date)
			throws ParseException {

		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		helperDAO.deleteDailyStudentAttendanceRecord(id, date);
		System.out.println("in the delete");
		mv.addObject("jspString", "attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "createClassAttendances.do", method = RequestMethod.POST)
	public ModelAndView adminCreateClassAttendances(@RequestParam("cohort") String cohort) {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		try {
			List<Attendance> todaysAttendancelist = helperDAO.createDailyAttendance(cohort);
			mv.addObject("userAttendance", todaysAttendancelist);
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			return mv;
		} catch (Exception e) {
			mv.addObject("errorString", "Today's record might have already been entered.");
			mv.addObject("jspString", "attendance.jsp");
			return mv;
		}
	}

	@RequestMapping(path = "grades.do", method = RequestMethod.GET)
	public ModelAndView showGrades(@ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("projectList", helperDAO.getAllProjects());
		if (accessLevel.equals("1")) {

			Student currentStudent = (Student) sessionUser;
			List<Grade> usergrades = helperDAO.getGradeByUserId((Student) sessionUser);
			mv.addObject("userGrades", usergrades);
			return mv;
		} else if (accessLevel.equals("2") || accessLevel.equals("3")) {
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		}

		return mv;
	}

	@RequestMapping(path = "gradesByLastNameAdminAndTA.do", method = RequestMethod.GET)
	public ModelAndView adminShowGradesByLastName(@RequestParam("lastname") String lastname) {
		List<Grade> studentGrades = helperDAO.getGradeByLastName(lastname);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp", "userGrades", studentGrades);
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("projectList", helperDAO.getAllProjects());
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "modifyGradesRecord.do", method = RequestMethod.POST)
	public ModelAndView modifyGradesRecord(@RequestParam("studentId") String studentId,
			@RequestParam("projectId") String projectId, @RequestParam("grade") String grade,
			@RequestParam("comment") String comment) throws ParseException {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		helperDAO.updateGrade(studentId, projectId, grade, comment);
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("projectList", helperDAO.getAllProjects());
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "createGrades.do", method = RequestMethod.GET)
	public ModelAndView createGradeForStudent(@RequestParam("lastName") String lastName,
			@RequestParam("project") String project, @RequestParam("grade") String grade,
			@RequestParam("comments") String comment) {
		String result = helperDAO.createGrade(lastName, project, grade, comment);
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("projectList", helperDAO.getAllProjects());
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		mv.addObject("result", result);
		return mv;
	}

	@RequestMapping(path = "deleteGrade.do", method = RequestMethod.POST)
	public ModelAndView deleteGradesRecord(@RequestParam("studentId") String studentId,
			@RequestParam("projectId") String projectId) throws ParseException {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		helperDAO.deleteStudentGradeRecord(studentId, projectId);
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());

		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView loginUser(@RequestParam("username") String username,
			@RequestParam("password") String password) {

		ModelAndView mv = new ModelAndView();
		User currentUser = helperDAO.loginUser(username, password);
		// User currentUser = helperDAO.loginUser("inst", "54321");
		if (currentUser == null) {
			mv.setViewName("index.jsp");
			mv.addObject("errorString", "Invalid Login, Eat more burritos");
			return mv;
		} else {
			String accessLevel = currentUser.getAccount().getAccessLevel();
			mv.setViewName("UserDesktop.jsp");
			mv.addObject("jspString", null);
			mv.addObject("accessLevel", accessLevel);
			mv.addObject("sessionUser", currentUser);
			return mv;
		}
	}

	@RequestMapping(path = "logout.do")
	public ModelAndView logoutUser() {
		ModelAndView mv = new ModelAndView("index.jsp");
		mv.addObject("accessLevel", "");
		mv.addObject("sessionUser", "");
		return mv;
	}

	
	@RequestMapping (path = "newTicket.do", method = RequestMethod.POST)
	public ModelAndView createTicket(@ModelAttribute("accessLevel") String accessLevel, @ModelAttribute("sessionUser") User sessionUser, 
			@RequestParam("subjects") String subjects) {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject(helperDAO.createNewTicket(sessionUser, subjects, accessLevel));
		mv.addObject("confirmationString", "Your ticket has been submitted. We suggest you get a burrito while you wait.");
		//TODO: add this ^^ to the TicketForm.jsp after you've merged branches
	return mv;
	}	

	@RequestMapping(path = "ticketing.do", method = RequestMethod.GET)
	public ModelAndView ticketForm(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser) {

		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("jspString", "ticketForm.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);

		if (accessLevel.equals("1")) {

			List<Ticket> allTickets = new ArrayList<>();
			allTickets = helperDAO.getAllTickets();
			mv.addObject("tickets", allTickets);
			mv.addObject("subjects", helperDAO.getAllSubjects());

			return mv;

		}

		else if (accessLevel.equals("2") || (accessLevel.equals("3"))) {

			return mv;

		} else {
			return new ModelAndView("index.jsp");
		}

	}

	@RequestMapping(path = "createTicket.do", method = RequestMethod.GET)
	public ModelAndView studentCreateTicket(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser, @RequestParam("subjects") String subject,
			@RequestParam("studentId") String studentId, @RequestParam("description") String description) {
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		try {

			mv.addObject("jspString", "ticketForm.jsp");
			mv.addObject("sessionUser", sessionUser);
			mv.addObject("accessLevel", accessLevel);
			mv.addObject("subjects", helperDAO.getAllSubjects());
			mv.addObject("reportString", helperDAO.createNewTicket(sessionUser, subject, description));

			return mv;
		} catch (Exception e) {
			mv.addObject("reportString", "An error in creating your ticket may have occured.");
		}
	}
	@RequestMapping(path="modifyTicket.do", method=RequestMethod.POST)
	
	@RequestMapping(path="showMyTickets.do", method=RequestMethod.POST)
}
