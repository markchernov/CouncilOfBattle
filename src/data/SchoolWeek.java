package data;

import java.util.ArrayList;
import java.util.List;

public class SchoolWeek {

	
		private int cohortID;
		private int weekNumber = 0;
		private List<HelpTicket> monday = new ArrayList<>();
		private List<HelpTicket> tuesday = new ArrayList<>();
		private List<HelpTicket> wednesday = new ArrayList<>();
		private List<HelpTicket> thursday = new ArrayList<>();
		private List<HelpTicket> friday = new ArrayList<>();
		
		public void setSchoolWeek(SchoolWeek week){
			
			this.monday = populateDay();
			this.tuesday = populateDay();
			this.wednesday = populateDay();
			this.thursday = populateDay();
			this.friday = populateDay();
		}
		
		
		
		private List<HelpTicket> populateDay(){
			List<HelpTicket> day = new ArrayList<>();
			for(int i = 0; i < 11; i++){
				HelpTicket helpABrotha = new HelpTicket();
				day.add(helpABrotha);
			}
			return day;
		}
		
		public List<HelpTicket> getMonday()
		{
			return monday;
		}
		public List<HelpTicket> getTuesday()
		{
			return tuesday;
		}
		public List<HelpTicket> getWednesday()
		{
			return wednesday;
		}
		public List<HelpTicket> getThursday()
		{
			return thursday;
		}
		public List<HelpTicket> getFriday()
		{
			return friday;
		}
		public void setMonday(List<HelpTicket> monday)
		{
			this.monday = monday;
		}
		public void setTuesday(List<HelpTicket> tuesday)
		{
			this.tuesday = tuesday;
		}
		public void setWednesday(List<HelpTicket> wednesday)
		{
			this.wednesday = wednesday;
		}
		public void setThursday(List<HelpTicket> thursday)
		{
			this.thursday = thursday;
		}
		public void setFriday(List<HelpTicket> friday)
		{
			this.friday = friday;
		}
		
		public SchoolWeek()
		{
			super();
			
		}
		
		
		
		
	}	
	
	
