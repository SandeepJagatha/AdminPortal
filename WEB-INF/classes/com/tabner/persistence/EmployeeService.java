package com.tabner.persistence;

import java.util.List;

import com.tabner.model.Employee;

public interface EmployeeService {
	public void saveEmp(Employee employee);
	public List<Employee> getAllEmp();
	public void deleteEmp(String eid);
	public void updateEmp(Employee employee);
	public Employee getEmpById(String empid);

}
