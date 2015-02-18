package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Activity;

public interface ActivityService {	
	public void saveActivity(Activity activity);
	public List<Activity> getAllActivities();
	public void deleteActivity(String aid);
	public void updateActivity(Activity activity);
	public Activity getActivityById(String id);
	public List<Activity> getActivityByLeadId(String lid);

}
