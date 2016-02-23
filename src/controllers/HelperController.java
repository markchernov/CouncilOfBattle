package controllers;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("jspString", "attendance.jsp");

		if (accessLevel.equals("1")) {

			List<Attendance> userAttendance = helperDAO.getUserAttendanceByStudent((Student) sessionUser);

			mv.addObject("userAttendance", userAttendance);
			return mv;
		} else if (accessLevel.equals("2") || accessLevel.equals("3")) {
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		}
		return mv;

	}

	@RequestMapping(path = "attendanceStudent.do", method = RequestMethod.GET)
	public ModelAndView showAttendance(@ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel, @RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = null;
		try {
			List<Attendance> studentAttendanceByDate = helperDAO.getStudentAttendanceWithDates(startDate, endDate,
					sessionUser.getId());
			mv = new ModelAndView("UserDesktop.jsp", "userAttendance", studentAttendanceByDate);
			mv.addObject("jspString", "attendance.jsp");

			return mv;
		} catch (ParseException e) {
			mv = new ModelAndView("UserDesktop.jsp");
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			mv.addObject("errorString", "Oh no! It looks like you encountered an error!");
			return mv;
		} catch (Exception e) {
			mv = new ModelAndView("UserDesktop.jsp");
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			mv.addObject("errorString", "Oh no! It looks like you encountered an error!");
			return mv;
		}
	}

	@RequestMapping(path = "attendanceAdminAndTA.do", method = RequestMethod.GET)
	public ModelAndView adminShowAttendance(@RequestParam("startDate") String startDate,
			@RequestParam("endDate") String endDate, @RequestParam("lastname") String lastname,
			@ModelAttribute("sessionUser") User sessionUser, @ModelAttribute("accessLevel") String accessLevel)
					throws ParseException {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = null;

		try {
			List<Attendance> adminStudentAttendance = helperDAO.getStudentAttendanceWithDatesByLastName(startDate,
					endDate, lastname);
			mv = new ModelAndView("UserDesktop.jsp", "userAttendance", adminStudentAttendance);

			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());

			return mv;
		} catch (ParseException e) {
			mv = new ModelAndView("UserDesktop.jsp");
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			mv.addObject("errorString", "Oh no! It looks like you encountered an error!");
			return mv;
		} catch (Exception e) {
			mv = new ModelAndView("UserDesktop.jsp");
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			mv.addObject("errorString", "Oh no! It looks like you encountered an error!");
			return mv;
		}
	}

	@RequestMapping(path = "modifyAttendanceRecord.do", method = RequestMethod.POST)
	public ModelAndView modifyAttendanceRecord(@RequestParam("studentId") String id, @RequestParam("date") String date,
			@RequestParam("present") String present, @RequestParam("late") String late,
			@RequestParam("excused") String excused, @RequestParam("startHour") String startHour,
			@RequestParam("startMinute") String startMinute, @RequestParam("endHour") String endHour,
			@RequestParam("endMinute") String endMinute, @ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) throws ParseException {

		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		String checkin = startHour + ":" + startMinute;
		String checkout = endHour + ":" + endMinute;

		String attendMconfirm = helperDAO.updateDailyAttendance(id, date, present, late, excused, checkin, checkout);
		mv.addObject("attendMconfirm", attendMconfirm);
		mv.addObject("jspString", "attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "deleteAttendanceRecord.do", method = RequestMethod.POST)
	public ModelAndView deleteAttendanceRecord(@RequestParam("studentId") String id, @RequestParam("date") String date,
			@ModelAttribute("sessionUser") User sessionUser, @ModelAttribute("accessLevel") String accessLevel)
					throws ParseException {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		String attendDconfirm = helperDAO.deleteDailyStudentAttendanceRecord(id, date);
		mv.addObject("attendDconfirm", attendDconfirm);
		mv.addObject("jspString", "attendance.jsp");
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "createClassAttendances.do", method = RequestMethod.POST)
	public ModelAndView adminCreateClassAttendances(@RequestParam("cohort") String cohort,
			@ModelAttribute("sessionUser") User sessionUser, @ModelAttribute("accessLevel") String accessLevel) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		try {
			List<Attendance> todaysAttendancelist = helperDAO.createDailyAttendance(cohort);
			String attendCconfirm = "You created an attendance record for today, with everyone marked present";
			mv.addObject("attendCconfirm", attendCconfirm);
			mv.addObject("userAttendance", todaysAttendancelist);
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			return mv;
		} catch (Exception e) {
			mv.addObject("errorString", "Today's record has already been entered.");
			mv.addObject("jspString", "attendance.jsp");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
			return mv;
		}
	}

	@RequestMapping(path = "grades.do", method = RequestMethod.GET)
	public ModelAndView showGrades(@ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("sessionUser", sessionUser);
		mv.addObject("accessLevel", accessLevel);
		mv.addObject("projectList", helperDAO.getAllProjects());
		if (accessLevel.equals("1")) {

			Student currentStudent = (Student) sessionUser;
			List<Grade> usergrades = helperDAO.getGradeByUserId((Student) sessionUser);
			mv.addObject("averageGrade", helperDAO.getAverageGrade((Student) sessionUser));
			mv.addObject("userGrades", usergrades);
			return mv;
		} else if (accessLevel.equals("2") || accessLevel.equals("3")) {
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		}

		return mv;

	}

	@RequestMapping(path = "gradesByLastNameAdminAndTA.do", method = RequestMethod.GET)
	public ModelAndView adminShowGradesByLastName(@RequestParam("lastname") String lastname,
			@ModelAttribute("sessionUser") User sessionUser, @ModelAttribute("accessLevel") String accessLevel) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
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
			@RequestParam("comment") String comment, @ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) throws ParseException {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		String gradeMconfirm = helperDAO.updateGrade(studentId, projectId, grade, comment);
		
		mv.addObject("gradeMconfirm", gradeMconfirm);
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("projectList", helperDAO.getAllProjects());
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());
		return mv;
	}

	@RequestMapping(path = "createGrades.do", method = RequestMethod.GET)
	public ModelAndView createGradeForStudent(@RequestParam("lastName") String lastName,
			@RequestParam("project") String project, @RequestParam("grade") String grade,
			@RequestParam("comments") String comment, @ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = null;
		try {
			String gradeCconfirm = helperDAO.createGrade(lastName, project, grade, comment);
			mv = new ModelAndView("UserDesktop.jsp");
			mv.addObject("gradeCconfirm", gradeCconfirm);
			mv.addObject("jspString", "grades.jsp");
			mv.addObject("projectList", helperDAO.getAllProjects());
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());

			return mv;
		} catch (Exception e) {
			mv = new ModelAndView("UserDesktop.jsp");
			mv.addObject("jspString", "grades.jsp");
			mv.addObject("projectList", helperDAO.getAllProjects());
			mv.addObject("errorString", "That student might already have a grade for that.");
			mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());

			return mv;
		}
	}

	@RequestMapping(path = "deleteGrade.do", method = RequestMethod.POST)
	public ModelAndView deleteGradesRecord(@RequestParam("studentId") String studentId,
			@RequestParam("projectId") String projectId, @ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) throws ParseException {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");

		String gradeDconfirm = helperDAO.deleteStudentGradeRecord(studentId, projectId);
		mv.addObject("gradeDconfirm", gradeDconfirm);
		mv.addObject("jspString", "grades.jsp");
		mv.addObject("projectList", helperDAO.getAllProjects());
		mv.addObject("studentLastnameList", helperDAO.getStudentsLastNames());

		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView loginUser(@RequestParam("username") String username,
			@RequestParam("password") String password) {

		ModelAndView mv = new ModelAndView();
		User currentUser = helperDAO.loginUser(username, password);
		if (currentUser == null) {
			mv.setViewName("index.jsp");
			mv.addObject("errorString", "Invalid Login, Eat more burritos");
			return mv;
		} else {
			String accessLevels = currentUser.getAccount().getAccessLevel();
			mv.setViewName("UserDesktop.jsp");
			mv.addObject("jspString", null);
			mv.addObject("accessLevel", accessLevels);
			mv.addObject("sessionUser", currentUser);
			return mv;
		}
	}

	@RequestMapping(path = "logout.do")
	public ModelAndView logoutUser(HttpSession session) {
		ModelAndView mv = new ModelAndView("index.jsp");
		mv.addObject("accessLevel", "");
		mv.addObject("sessionUser", "");
		session.invalidate();
		return mv;
	}

	@RequestMapping(path = "newTicket.do", method = RequestMethod.POST)
	public ModelAndView createTicket(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser, @RequestParam("subjects") String subjects) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("ticketCconfirm", helperDAO.createNewTicket(sessionUser, subjects, accessLevel));
		return mv;
	}

	@RequestMapping(path = "ticketing.do", method = RequestMethod.GET)
	public ModelAndView ticketForm(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
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

			List<Ticket> allTickets = new ArrayList<>();
			allTickets = helperDAO.getAllTickets();
			mv.addObject("tickets", allTickets);
			mv.addObject("subjects", helperDAO.getAllSubjects());

			return mv;

		} else {
			return new ModelAndView("index.jsp");
		}

	}

	@RequestMapping(path = "createTicket.do", method = RequestMethod.POST)
	public ModelAndView studentCreateTicket(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser, @RequestParam("subjects") String subject,
			@RequestParam("studentId") String studentId, @RequestParam("description") String description) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		try {

			mv.addObject("jspString", "ticketForm.jsp");
			mv.addObject("sessionUser", sessionUser);
			mv.addObject("accessLevel", accessLevel);
			mv.addObject("subjects", helperDAO.getAllSubjects());
			mv.addObject("reportString",
					helperDAO.createNewTicket(sessionUser, subject, description.concat(" for I am helpless!")));

			return mv;
		} catch (Exception e) {
			mv.addObject("reportString", "An error in creating your ticket may have occured.");
			return mv;
		}
	}

	@RequestMapping(path = "modifyTicket.do", method = RequestMethod.POST)
	public ModelAndView intsructorUpdateTicket(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser, @RequestParam("ticketId") String ticketId,
			@RequestParam("statusOpen") String statusOpen) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");

		try {

			String gradeMconfirm = helperDAO.updateTicket(sessionUser, ticketId, statusOpen);
			mv.addObject("gradeMconfirm", gradeMconfirm);
			mv.addObject("jspString", "ticketForm.jsp");

			return mv;

		} catch (Exception e) {
			System.out.println("TEST in the modifyTicket catch block: " + e);
			
			return mv;
		}
	}

	@RequestMapping(path = "deleteTicket.do", method = RequestMethod.POST)
	public ModelAndView intsructorDeleteTicket(@ModelAttribute("accessLevel") String accessLevel,
			@ModelAttribute("sessionUser") User sessionUser, @RequestParam("ticketId") String ticketId) {

		ModelAndView mv = new ModelAndView("UserDesktop.jsp");

		try {

			String confirmation = helperDAO.deleteTicket(sessionUser, ticketId);
			mv.addObject("confirmationString", confirmation);
			// TODO: ^^ remember to add string to jsp
			mv.addObject("jspString", "ticketForm.jsp");

			return mv;

		} catch (Exception e) {
			System.out.println("TEST in the modifyTicket catch block: " + e);
			// TODO: ^^ validation test needed for more precise exception
			return mv;
		}
	}

	@RequestMapping(path = "createUserView.do")
	public ModelAndView createUserView(@ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}
		System.out.println(sessionUser.getFirstname());
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		mv.addObject("jspString", "users.jsp");
		mv.addObject("sessionUser", sessionUser);
		return mv;
	}

	@RequestMapping(path = "createUser.do")
	public ModelAndView createUser(@RequestParam("firstname") String firstName,
			@RequestParam("lastname") String lastName, @RequestParam("email") String email,
			@RequestParam("usertype") String usertype, @ModelAttribute("sessionUser") User sessionUser,
			@ModelAttribute("accessLevel") String accessLevel) {
		boolean areYouLoggedIn = helperDAO.userLoginCheck(sessionUser, accessLevel);
		if (areYouLoggedIn == false) {
			return new ModelAndView("logout.do");
		}

		String confirmation = helperDAO.createUser(firstName, lastName, email, usertype);
		
		ModelAndView mv = new ModelAndView("UserDesktop.jsp");
		
		mv.addObject("confirmationString", confirmation);

		return mv;
	}
}
