package data;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


	
	@Entity
	@Table(name = "cohorts")
	
		
	
	public class Cohort {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name = "cohort_id")
		private int id;
		
	    String name;
	    
	    @Temporal(TemporalType.DATE)
	    private Date startdate;
	    
	    @Temporal(TemporalType.DATE)
	    private Date enddate;
	    
	    @OneToMany(mappedBy = "cohort")
	    private Collection<Student> students;
	    
	
	    public Cohort() {}


		public int getId() {
			return id;
		}


		public String getName() {
			return name;
		}


		public Date getStartdate() {
			return startdate;
		}


		public Date getEnddate() {
			return enddate;
		}


		public Collection<Student> getStudents() {
			return students;
		}


		

		public void setName(String name) {
			this.name = name;
		}


		public void setStartdate(Date startdate) {
			this.startdate = startdate;
		}


		public void setEnddate(Date enddate) {
			this.enddate = enddate;
		}


		public void setStudents(Collection<Student> students) {
			this.students = students;
		}


		@Override
		public String toString() {
			return "Cohort [id=" + id + ", name=" + name + ", startdate=" + startdate + ", enddate=" + enddate
					+ ", students=" + students + "]";
		}


		


		
	    
	    
}
