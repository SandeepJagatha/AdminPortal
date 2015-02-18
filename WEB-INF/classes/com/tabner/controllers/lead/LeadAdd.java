package com.tabner.controllers.lead;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tabner.model.Activity;
import com.tabner.model.Lead;
import com.tabner.model.ListOfValues;
import com.tabner.persistence.ActivityService;
import com.tabner.persistence.LeadService;
import com.tabner.persistence.ListOfValuesService;

@Controller
@RequestMapping(value="lead")
public class LeadAdd {
	private LeadService leadService=null;
	private ActivityService activityService=null;
	private ListOfValuesService listofvaluesService=null;
	@Autowired
	public void setLeadService(LeadService leadService) {
		this.leadService = leadService;
	}
	@Autowired
	public void setActivityService(ActivityService activityService){
		this.activityService = activityService;
	}
	@Autowired
	public void setListOfValuesService(ListOfValuesService listofvaluesService) {
		this.listofvaluesService = listofvaluesService;
	}
	
	
	@RequestMapping(value="add", method=RequestMethod.POST)
	@ResponseBody
	public String add(Lead lead, HttpServletRequest request){
		String email = (String) request.getSession().getAttribute("email");
		if(email == null){
			return "login";
		}
		else{
			int num_of_record_inserted = leadService.saveLead(lead);
			//leadService.lastInsertedId();
			
			
			System.out.println(num_of_record_inserted);
			String lid = lead.getLid();			
			System.out.println(lid);
			
			List<ListOfValues> listvalues = listofvaluesService.getListOfValuesByListType("ACTIVITY_TYPE");
			System.out.println(listvalues.get(0).getList_value());
			
			Activity activity = new Activity();
			activity.setCreated_by(email);
			activity.setLast_updated_by(email);
			activity.setActivity_type(listvalues.get(0).getList_value());
			activity.setActivity_subtype("1");
			activity.setLead_id(lid);		
			activityService.saveActivity(activity);
			
//			Lead lead1 =(Lead)command;
//			MultipartFile multipartFile = lead1.getResume();
//			MultipartFile resume = lead.getResume();
//			String fName="";
//			 
//			if(multipartFile!=null){
//				fName = multipartFile.getOriginalFilename();
//				//do whatever you want
//			}
			
			
//			String filename = resume.getOriginalFilename();
//			System.out.println(filename);
			return "Added Lead successfully";
			
/*			//try {
				System.out.println(lead);
				MultipartFile uploadFile = lead.getResume();
				String filename = uploadFile.getOriginalFilename();
				System.out.println(filename);
				InputStream is = uploadFile.getInputStream ();
				File tempFile = new File (uploadFilePath + filename);
				if (tempFile.exists ()) {
					boolean delResult = tempFile.delete ();
					System.out.println("delete the existing file:" + delResult);
				}
				if (! filename.equals ("")) {
					FileOutputStream fos = new FileOutputStream (uploadFilePath + filename);
					byte [] buffer = new byte [8192]; 
					int count = 0;
					while ((count = is.read (buffer))> 0) {
						fos.write (buffer, 0, count); 
						fos.close (); 
						is.close (); 
					}
				}
//			}catch(FileNotFoundException e){
//				e.printStackTrace ();
//			}catch (IOException e) {
//				e.printStackTrace ();
//			}
			
			
			InputStream iss = lead.getResume().getInputStream();
			byte [] file = new byte [(int) lead.getResume().getSize()];
			is.read (file);
			String fileName = lead.getResume().getOriginalFilename();
			//Lead lead = new PhotoEntity ();
//			lead.setResume(file);
//			photoEntity.setFileName (filename);
//			this. photoMapper.createPhoto (photoEntity);
			
			leadService.saveLead(lead);
			return "Added Lead successfully";*/
			
			
		}
		
	}
	

}
