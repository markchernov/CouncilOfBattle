package data;

import java.util.ArrayList;
import java.util.List;

public class SchoolWeek {

	
		private int cohortID;
		private int weekNumber = 0;
		private List<Ticket> monday = new ArrayList<>();
		private List<Ticket> tuesday = new ArrayList<>();
		private List<Ticket> wednesday = new ArrayList<>();
		private List<Ticket> thursday = new ArrayList<>();
		private List<Ticket> friday = new ArrayList<>();
		
		public void setSchoolWeek(SchoolWeek week){
			
			this.monday = populateDay();
			this.tuesday = populateDay();
			this.wednesday = populateDay();
			this.thursday = populateDay();
			this.friday = populateDay();
		}
		
		
		
		private List<Ticket> populateDay(){
			List<Ticket> day = new ArrayList<>();
			for(int i = 0; i < 11; i++){
				Ticket helpABrotha = new Ticket();
				day.add(helpABrotha);
			}
			return day;
		}
		
		public List<Ticket> getMonday()
		{
			return monday;
		}
		public List<Ticket> getTuesday()
		{
			return tuesday;
		}
		public List<Ticket> getWednesday()
		{
			return wednesday;
		}
		public List<Ticket> getThursday()
		{
			return thursday;
		}
		public List<Ticket> getFriday()
		{
			return friday;
		}
		public void setMonday(List<Ticket> monday)
		{
			this.monday = monday;
		}
		public void setTuesday(List<Ticket> tuesday)
		{
			this.tuesday = tuesday;
		}
		public void setWednesday(List<Ticket> wednesday)
		{
			this.wednesday = wednesday;
		}
		public void setThursday(List<Ticket> thursday)
		{
			this.thursday = thursday;
		}
		public void setFriday(List<Ticket> friday)
		{
			this.friday = friday;
		}
		
		public SchoolWeek()
		{
			super();
			
		}
		
		
		
		
	}	
	
	
