package com.mock.parking.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mock.parking.entity.Employee;
import com.mock.parking.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeRepository employeeRepository;

	@Override
	public void addEmployee(Employee employee) {
		// TODO Auto-generated method stub
		employee.setEmpId(generateEmployeeId());
		employeeRepository.save(employee);
	}

	private String generateEmployeeId() {
		Optional<Employee> optional = employeeRepository.findTopByOrderByEmpIdDesc();
		int empId;
		
		if (optional.isPresent()) {
			Employee employee = optional.get();
			empId = Integer.parseInt(employee.getEmpId().substring(3)) + 1;
		} else
			empId = 1;
		
		return String.format("EMP%03d", empId);
	}

	@Override
	public List<Employee> findAllEmployees() {
		// TODO Auto-generated method stub
		return employeeRepository.findAll();
	}

	@Override
	public void deleteEmployeeById(String empId) {
		// TODO Auto-generated method stub
		employeeRepository.deleteById(empId);
	}

	@Override
	public Employee findEmployeeById(String empId) {
		// TODO Auto-generated method stub
		Optional<Employee> optional = employeeRepository.findById(empId);
		
		return optional.isPresent() ? optional.get() : null;
	}

	@Override
	public void updateEmployee(Employee employee) {
		// TODO Auto-generated method stub
		employeeRepository.save(employee);
	}
}
