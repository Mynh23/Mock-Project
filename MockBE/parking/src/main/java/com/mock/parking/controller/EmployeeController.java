package com.mock.parking.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mock.parking.entity.Employee;
import com.mock.parking.payload.AddEmployeeRequest;
import com.mock.parking.payload.UpdateEmployeeRequest;
import com.mock.parking.service.EmployeeService;

@RestController
@RequestMapping("/api")
public class EmployeeController {

	@Autowired
	private EmployeeService employeeService;
	
	@PostMapping("/admin/employees")
	public int addEmployee(@RequestBody AddEmployeeRequest request) {
		Employee employee = Employee.builder()
				.name(request.getName())
				.email(request.getEmail())
				.password(request.getPassword())
				.gender(request.getGender())
				.phone(request.getPhone())
				.address(request.getAddress())
				.role(request.getRole())
				.build();
		
		employeeService.addEmployee(employee);
		return 1;
	}
	
	@GetMapping("/admin/employees")
	public Map<String, Object> listAllEmployees() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employees", employeeService.findAllEmployees());
		return map;
	}
	
	@DeleteMapping("/admin/employees/{empId}")
	public int deleteByEmployeeById(@PathVariable String empId) {
		employeeService.deleteEmployeeById(empId);
		return 1;
	}
	
	@GetMapping("/employees/{empId}")
	public Map<String, Object> findEmployeeById(@PathVariable String empId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("employee", employeeService.findEmployeeById(empId));
		return map;
	}
	
	@PutMapping("/employees/{empId}")
	public int updateEmployee(@PathVariable String empId, @RequestBody UpdateEmployeeRequest request) {
		Employee employee = Employee.builder()
				.empId(empId)
				.name(request.getName())
				.email(request.getEmail())
				.password(request.getPassword())
				.gender(request.getGender())
				.phone(request.getPhone())
				.address(request.getAddress())
				.role(employeeService.findEmployeeById(empId).getRole())
				.build();
		employeeService.updateEmployee(employee);
		return 1;
	}
	
	@PutMapping("/admin/employees")
	public int updateEmployeeByAdmin(
			@RequestParam("empId") String empId,
			@RequestParam("role") String role) {
		Employee employee = employeeService.findEmployeeById(empId);
		employee.setRole(role);
		employeeService.updateEmployee(employee);
		return 1;
	}
}
