package data;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.print.attribute.standard.DateTimeAtCreation;

import org.springframework.transaction.annotation.Transactional;

@Transactional

public class HelperDAO {

	@PersistenceContext

	private EntityManager em;

	public void init() {

		Student stu = new Student();

		System.out.println(stu);

	}

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

	public List<Attendance> getUserAttendanceById(int id) {

		List<Attendance> attendanceByID = em.createNamedQuery("Attendance.getAttendancebyId").setParameter("id", id)
				.getResultList();

		return attendanceByID;

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

		List<Attendance> attendanceByDateLastName = em.createNamedQuery("Attendance.getAttendancebyDatesAndLastName")
				.setParameter(1, startdate).setParameter(2, enddate).setParameter(3, lastname).getResultList();

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		Date startDate = formatter.parse(startdate);

		Date endDate = formatter.parse(enddate);

		return attendanceByDateLastName;

	}

	public List<String> getStudentsLastNames() {

		List<String> studentsLastNames = em.createNamedQuery("Attendance.getStudentsLastNames").getResultList();

		return studentsLastNames;

	}

	public List<String> getAttendanceByCohort(String cohort) {

		List<String> attendanceByCohort = em.createNamedQuery("Attendance.getStudentsLastNames")
				.setParameter("cohort", cohort).getResultList();

		return attendanceByCohort;

	}

	public List<Student> getStudentsByCohort(String cohort) {

		List<Student> studentsByCohort = em.createNamedQuery("Student.getStudentsByCohort")
				.setParameter("cohort", cohort).getResultList();

		return studentsByCohort;

	}

	public List<Attendance> createDailyAttendance(String cohort) {

		List<Student> currentStudents = getStudentsByCohort(cohort);

		List<Attendance> dailyAttendance = new ArrayList();

		for (Student student : currentStudents) {

			Attendance attendance = new Attendance();

			attendance.setStudent(student);
			attendance.setDate(new Date());
			attendance.setPresent("Y");
			attendance.setLate("N");
			attendance.setExcused("N/A");
			attendance.setCheckin(new Date());
			attendance.setCheckout(new Date());

			dailyAttendance.add(attendance);
		}

		return dailyAttendance;
	}

	public Attendance updateDailyAttendance(Attendance attendance,Student student, Date date, String present, String late, String excused,
			Date checkin, Date checkout) {
		
		
		attendance.setStudent(student);
		attendance.setDate(date);
		attendance.setPresent(present);
		attendance.setLate(late);
		attendance.setExcused(excused);
		attendance.setCheckin(checkin);
		attendance.setCheckout(checkout);
		
		
		

		return attendance;

	}

}