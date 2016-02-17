package data;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

@Transactional

public class HelperDAO {

	@PersistenceContext

	private EntityManager em;

	/*---------------------- USER METHODS -----------------------*/

	public User getUser(int id) {
		User us = em.find(User.class, id);
		em.detach(us);
		System.out.println(us);
		return us;
	}

	public User setUser() {

		User user = new User();

		user.setFirstname("Ben");
		user.setLastname("K");
		user.setEmail("bk@gmail.com");

		em.persist(user);

		System.out.println(user);
		return user;
	}

	public User loginUser(String username, String password) {
		Account account = em.createNamedQuery("Account.getAccountbyUserAndPass", Account.class)
				.setParameter("username", username).setParameter("password", password).getSingleResult();
		if (account == null) {
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

		System.out.println(cohort);

		List<Student> studentsByCohort = em.createNamedQuery("Student.getStudentsByCohort").setParameter("cohort", cohort).getResultList();

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

	public List<Attendance> createDailyAttendance(String cohort) {

		List<Student> currentStudents = getStudentsByCohort(cohort);

		List<Attendance> dailyAttendance = new ArrayList<>();
		System.out.println(cohort);
		for (Student student : currentStudents) {
			System.out.println(student.getFirstname());
		}
		for (Student student : currentStudents) {
		
			Attendance attendance = new Attendance();

			attendance.setStudent(student);
			attendance.setDate(new Date());
			attendance.setPresent("Y");
			attendance.setLate("N");
			attendance.setExcused("N");
			attendance.setCheckin(new Date());
			attendance.setCheckout(new Date());

			dailyAttendance.add(attendance);
			
			System.out.println(attendance);
			
			
		}

		return dailyAttendance;
	}

	public Attendance updateDailyAttendance(Attendance attendance, Student student, Date date, String present,
			String late, String excused, Date checkin, Date checkout) {

		attendance.setStudent(student);
		attendance.setDate(date);
		attendance.setPresent(present);
		attendance.setLate(late);
		attendance.setExcused(excused);
		attendance.setCheckin(checkin);
		attendance.setCheckout(checkout);

		em.persist(attendance);

		return attendance;

	}

	public String deleteDailyAttendance(Attendance attendance) {

		em.remove(attendance);

		String confirmation = "Attendance record: " + attendance + " was deleted";

		return confirmation;
	}

	public Attendance addDailyAttendance(Student student, Date date, String present, String late, String excused,
			Date checkin, Date checkout) {

		Attendance attendance = new Attendance();

		attendance.setStudent(student);
		attendance.setDate(date);
		attendance.setPresent(present);
		attendance.setLate(late);
		attendance.setExcused(excused);
		attendance.setCheckin(checkin);
		attendance.setCheckout(checkout);

		em.persist(attendance);

		return attendance;

	}

	/*---------------------- GRADES METHODS -----------------------*/

	public Grade createGrade(Student student, Project project, int grade) {

		Grade gradeObject = new Grade();

		gradeObject.setStudent(student);
		gradeObject.setProject(project);
		gradeObject.setGrade(grade);

		em.persist(gradeObject);

		return gradeObject;

	}

	public Grade updateGrade(Grade gradeObject, Student student, Project project, int grade) {

		gradeObject.setStudent(student);
		gradeObject.setProject(project);
		gradeObject.setGrade(grade);

		em.persist(gradeObject);

		return gradeObject;

	}

	public Grade getGradeByUserId(int id) {

		Grade grade = em.find(Grade.class, id);

		return grade;
	}

}