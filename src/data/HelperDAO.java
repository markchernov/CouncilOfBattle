package data;


import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
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
	
	public User loginUser(String username, String password)
	{
		Account account = em.createNamedQuery("Account.getAccountbyUserAndPass", Account.class).setParameter("username", username).setParameter("password", password).getSingleResult();
		if (account == null)
		{
			return null;
		}
		User user = account.getUser();
		return user;
	}
	public ArrayList<Attendance> getUserAttendance(int sessionUserId){
		
		
		return null;
		
		
	}
	public List<Attendance> getStudentAttendanceWithDates(String startdate, String enddate, int id){
		
		List<Attendance> attendanceByDate =  em.createNamedQuery("Attendance.getAttendancebyDates").setParameter(1, startdate).setParameter(2, enddate).setParameter(3, id).getResultList();
		
		
		return attendanceByDate;
		
		
	}
	
	
}
