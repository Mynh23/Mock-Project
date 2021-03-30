package com.mock.parking.service;

import java.util.List;

import com.mock.parking.entity.Employee;

public interface EmployeeService {
	
	void addEmployee(Employee employee);
	List<Employee> findAllEmployees();
	void deleteEmployeeById(String empId);
	Employee findEmployeeById(String empId);
	void updateEmployee(Employee employee);
}
