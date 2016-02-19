package data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

@Transactional

public class HelperDAO {

	@PersistenceContext

	private EntityManager em;

	/*---------------------- USER METHODS -----------------------*/
	public boolean userLoginCheck(User sessionUser, String accessLevel) {
		if (sessionUser == null || accessLevel == "") {
			return false;
		} else if (sessionUser != null || accessLevel != "") {
			return true;
		} else {
			return false;
		}
	}

	public String createUser(String firstname, String lastname, String email, String usertype) {

		User user = null;

		if (usertype.equalsIgnoreCase("student")) {

			Student newUser = new Student();

			newUser.setFirstname(firstname);

			newUser.setLastname(lastname);

			newUser.setEmail(email);

			newUser.setCohort(new Cohort());

			newUser.setUsertype(usertype);

			user = newUser;

			Account newAccount = new Account();

			newAccount.setUser(user);

			newAccount.setAccessLevel("1");

			newAccount.setUsername("user");

			newAccount.setPassword("user");

			newUser.setAccount(newAccount);

			newUser.setCohort(em.find(Cohort.class, 1));

			em.merge(newUser);
			em.persist(newUser);

			String confirmation = "New Student " + newUser.getFirstname() + " has been created";
			return confirmation;

		}

		else if (usertype.equalsIgnoreCase("instructor")) {

			Instructor newUser = new Instructor();

			newUser.setFirstname(firstname);

			newUser.setLastname(lastname);

			newUser.setEmail(email);

			newUser.setLevel("TA");

			newUser.setUsertype(usertype);

			newUser.setSubjects(new ArrayList<Subject>());

			user = newUser;

			Account newAccount = new Account();

			newAccount.setUser(user);

			newAccount.setAccessLevel("2");

			newAccount.setUsername("user");

			newAccount.setPassword("user");

			newUser.setAccount(newAccount);

			em.merge(newUser);
			em.persist(newUser);

			String confirmation = "New Instructor " + newUser.getFirstname() + " has been created";
			return confirmation;

		}

		else if (usertype.equalsIgnoreCase("admin")) {

			Admin newUser = new Admin();

			newUser.setFirstname(firstname);

			newUser.setLastname(lastname);

			newUser.setEmail(email);

			newUser.setDepartment(" ");

			user = newUser;

			Account newAccount = new Account();

			newAccount.setUser(user);

			newAccount.setAccessLevel("3");

			newAccount.setUsername("user");

			newAccount.setPassword("user");

			newUser.setAccount(newAccount);

			em.merge(newUser);
			em.persist(newUser);

			String confirmation = "New Admin " + newUser.getFirstname() + " has been created";
			return confirmation;

		}
		return "User was created";

	}

	public User loginUser(String username, String password) {
		Account account;
		try {

			account = em.createNamedQuery("Account.getAccountbyUserAndPass", Account.class)
					.setParameter("username", username).setParameter("password", password).getSingleResult();
		} catch (NoResultException | NullPointerException nre) {

			return null;
		}

		User user = account.getUser();
		return user;
	}

	public List<String> getStudentsLastNames() {

		List<String> studentsLastNames = em.createNamedQuery("Attendance.getStudentsLastNames").getResultList();

		return studentsLastNames;

	}

	public List<Student> getStudentsByCohort(String cohortId) {

		int id = Integer.parseInt(cohortId);

		Cohort cohort = em.find(Cohort.class, id);

		List<Student> studentsByCohort = em.createNamedQuery("Student.getStudentsByCohort")
				.setParameter("cohort", cohort).getResultList();

		return studentsByCohort;

	}

	/*---------------------- ATTENDANCE METHODS -----------------------*/

	public List<Attendance> getUserAttendanceById(int id) {

		List<Attendance> attendanceByID = em.createNamedQuery("Attendance.getAttendancebyId").setParameter("id", id)
				.getResultList();

		return attendanceByID;

	}

	public List<String> getAttendanceByCohort(String cohort) {

		List<String> attendanceByCohort = em.createNamedQuery("Attendance.getStudentsLastNames")
				.setParameter("cohort", cohort).getResultList();

		return attendanceByCohort;

	}

	public List<Attendance> getUserAttendanceByStudent(Student sessionUserId) {

		List<Attendance> attendanceByID = em.createNamedQuery("Attendance.getAttendancebyStudent")
				.setParameter("sessionUser", sessionUserId).getResultList();

		return attendanceByID;

	}

	public List<Attendance> getStudentAttendanceWithDates(String startdate, String enddate, int id)
			throws ParseException {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = formatter.parse(startdate);

		Date endDate = formatter.parse(enddate);

		List<Attendance> attendanceByDate = em.createNamedQuery("Attendance.getAttendancebyDates")
				.setParameter(1, startDate).setParameter(2, endDate).setParameter(3, id).getResultList();

		return attendanceByDate;

	}

	public List<Attendance> getStudentAttendanceWithDatesByLastName(String startdate, String enddate, String lastname)
			throws ParseException {

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = formatter.parse(startdate);

		Date endDate = formatter.parse(enddate);
		List<Attendance> attendanceByDateLastName = em.createNamedQuery("Attendance.getAttendancebyDatesAndLastName")
				.setParameter(1, startDate).setParameter(2, endDate).setParameter(3, lastname).getResultList();

		return attendanceByDateLastName;

	}

	public List<Attendance> createDailyAttendance(String cohort) throws ParseException {

		List<Student> currentStudents = getStudentsByCohort(cohort);

		List<Attendance> dailyAttendance = new ArrayList<>();

		for (Student student : currentStudents) {

			Attendance attendance = new Attendance();

			attendance.setStudent(student);
			attendance.setDate(new Date());
			attendance.setPresent("Y");
			attendance.setLate("N");
			attendance.setExcused("N");

			attendance.setCheckin("08:00");

			attendance.setCheckout("18:00");

			dailyAttendance.add(attendance);

			System.out.println(attendance);
		}
		for (Attendance attendance : dailyAttendance) {

			em.merge(attendance);
			em.persist(attendance);

		}

		return dailyAttendance;
	}

	public String updateDailyAttendance(String userId, String date, String present, String late, String excused,
			String checkin, String checkout) throws ParseException {

		String presentChar = present.trim();
		String lateChar = late.trim();
		String excusedChar = excused.trim();

		SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM d HH:mm:ss zzz yyyy");

		Date dailyDate = formatter.parse(date);

		int id = Integer.parseInt(userId);

		Student tempUser = em.find(Student.class, id);

		AttendanceId compositeKeyId = new AttendanceId(dailyDate, id);

		Attendance tempAttendance = em.find(Attendance.class, compositeKeyId);

		tempAttendance.setPresent(presentChar);
		tempAttendance.setLate(lateChar);
		tempAttendance.setExcused(excusedChar);
		tempAttendance.setCheckin(checkin);
		tempAttendance.setCheckout(checkout);

		em.persist(tempAttendance);

		String confirmation = "Attendance record: " + tempAttendance + " was updated";

		return confirmation;

	}

	public String deleteDailyStudentAttendanceRecord(String userId, String date) throws ParseException {

		SimpleDateFormat formatter = new SimpleDateFormat("EEE MMM d HH:mm:ss zzz yyyy");

		Date dailyDate = formatter.parse(date);

		int id = Integer.parseInt(userId);

		AttendanceId compositeKeyId = new AttendanceId(dailyDate, id);

		Attendance tempAttendance = em.find(Attendance.class, compositeKeyId);

		em.remove(tempAttendance);

		String confirmation = "Attendance record for " + tempAttendance.getStudent().getFirstname() + " " + "on the "
				+ tempAttendance.getDate() + " was deleted";

		return confirmation;
	}

	public String addDailyAttendance(Student student, Date date, String present, String late, String excused,
			String checkin, String checkout) {

		Attendance attendance = new Attendance();

		attendance.setStudent(student);
		attendance.setDate(date);
		attendance.setPresent(present);
		attendance.setLate(late);
		attendance.setExcused(excused);
		attendance.setCheckin(checkin);
		attendance.setCheckout(checkout);

		em.persist(attendance);

		String confirmation = "Attendance record for " + attendance.getStudent().getFirstname() + " " + "on the "
				+ attendance.getDate() + " was created";

		return confirmation;

	}

	/*---------------------- GRADES METHODS -----------------------*/

	public List<Subject> getAllSubjects() {

		List<Subject> allSubjects = em.createNamedQuery("Subject.getAllSubjects").getResultList();

		return allSubjects;

	}

	public List<Project> getAllProjects() {

		List<Project> allProjects = em.createNamedQuery("Project.getAllProjects").getResultList();

		return allProjects;

	}

	public String getAverageGrade(Student sessionUserId) {

		Student student = em.find(Student.class, sessionUserId.getId());

		List<Grade> grades = (List<Grade>) student.getGrades();

		double total = 0;
		double size = (double)grades.size();

		for (Grade grade : grades) {

			total+=grade.getGrade();

		}

		double averageGrade = total / size;

		String average = averageGrade + "";

		return average;

	}

	public String createGrade(String lastname, String projectId, String grade, String comments) {

		Grade gradeObject = new Grade();

		String lastName = lastname.trim();
		String project = projectId.trim();
		String gradeString = grade.trim();

		Student tempStudent = (Student) em.createNamedQuery("Student.getOneStudentByLastName")
				.setParameter("lastname", lastName).getSingleResult();

		int projectInt = Integer.parseInt(project);
		int gradeInt = Integer.parseInt(gradeString);

		Project tempProject = em.find(Project.class, projectInt);

		gradeObject.setStudent(tempStudent);
		gradeObject.setProject(tempProject);
		gradeObject.setGrade(gradeInt);
		gradeObject.setComments(comments);

		em.merge(gradeObject);

		em.persist(gradeObject);

		String confirmation = "Grade record for " + gradeObject.getStudent().getFirstname() + " was created";

		return confirmation;

	}

	public List<Grade> getGradeByUserId(Student sessionUserId) {

		Student student = em.find(Student.class, sessionUserId.getId());

		List<Grade> gradesByStudent = em.createNamedQuery("Grade.getGradesByStudent").setParameter("student", student)
				.getResultList();

		return gradesByStudent;
	}

	public List<Grade> getGradeByLastName(String lastname) {

		String studentLastname = lastname.trim();

		Student stu = (Student) em.createNamedQuery("Student.getStudentsByLastName")
				.setParameter("lastname", studentLastname).getSingleResult();

		Student student = em.find(Student.class, stu.getId());

		List<Grade> gradesByStudent = em.createNamedQuery("Grade.getGradesByStudent").setParameter("student", student)
				.getResultList();

		return gradesByStudent;
	}

	public String updateGrade(String userId, String projectId, String grade, String comments) throws ParseException {

		String user = userId.trim();
		String project = projectId.trim();
		String gradeString = grade.trim();

		int userInt = Integer.parseInt(user);
		int projectInt = Integer.parseInt(project);
		int gradeInt = Integer.parseInt(gradeString);

		GradeId compositeKeyId = new GradeId(userInt, projectInt);

		Grade tempGrade = em.find(Grade.class, compositeKeyId);

		tempGrade.setGrade(gradeInt);
		tempGrade.setComments(comments);

		em.persist(tempGrade);

		String confirmation = "Grade record for " + tempGrade.getStudent().getFirstname() + " was updated";

		return confirmation;

	}

	public String deleteStudentGradeRecord(String userId, String projectId) throws ParseException {

		String user = userId.trim();
		String project = projectId.trim();

		int userInt = Integer.parseInt(user);
		int projectInt = Integer.parseInt(project);

		GradeId compositeKeyId = new GradeId(userInt, projectInt);

		Grade tempGrade = em.find(Grade.class, compositeKeyId);

		em.remove(tempGrade);

		String confirmation = "Grade record for " + tempGrade.getStudent().getFirstname() + " was deleted";

		return confirmation;
	}

	/*---------------------- TICKET METHODS -----------------------*/

	public List<Ticket> getAllTickets() {
		List<Ticket> allTickets = new ArrayList<>();
		allTickets = em.createNamedQuery("Ticket.getAllTickets").getResultList();

		return allTickets;

	}

	public List<Ticket> getTicketByUserId(Student sessionUserId) {

		Student student = em.find(Student.class, sessionUserId.getId());

		List<Ticket> ticketsByStudent = em.createNamedQuery("Ticket.getTicketsByStudent")
				.setParameter("student", student).getResultList();

		return ticketsByStudent;
	}

	// create new ticket method
	public String createNewTicket(User user, String subject, String description) {
		Ticket t = new Ticket();
		t.setStudent((Student) (user));
		t.setDate(new Date());
		t.setDescription(description);

		// convert string subject into a subject object

		Subject tempSubject = (Subject) em.createNamedQuery("Subject.getSubjectByName").setParameter("name", subject)
				.getSingleResult();

		// assign values to new ticket object
		t.setSubject(tempSubject);
		t.setAvailable("Available");
		em.merge(t);
		em.persist(t);

		String confirmation = "Ticket record for " + t.getStudent().getFirstname() + " was created";

		return confirmation;
	}

	// update ticket method
	public String updateTicket(User sessionUser, String ticketId, String statusOpen) {

		int tId = Integer.parseInt(ticketId);
		Ticket tempTicket = em.find(Ticket.class, tId);
		tempTicket.setStatusOpen(statusOpen);

		em.persist(tempTicket);

		String confirmation = "Ticket number " + tempTicket.getId() + " has been updated";
		return confirmation;
	}

	public String deleteTicket(User sessionUser, String ticketId) {
		int tId = Integer.parseInt(ticketId);
		Ticket tempTicket = em.find(Ticket.class, tId);

		em.remove(tempTicket);

		String confirmation = "Ticket number " + tempTicket.getId() + " has been deleted";
		return confirmation;

	}

}