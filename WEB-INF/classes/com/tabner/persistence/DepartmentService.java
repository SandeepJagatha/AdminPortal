package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Department;

public interface DepartmentService {
	public void saveDepartment(Department department);
	public void deleteDepartment(String id);
	public List<Department> getAllDepartments();
	public void updateDepartment(Department department);
	public List<Department> getDepartmentsBydid(String did);

}
