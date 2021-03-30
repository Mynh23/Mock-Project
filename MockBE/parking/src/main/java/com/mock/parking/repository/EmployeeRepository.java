package com.mock.parking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mock.parking.entity.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, String> {
	
	Optional<Employee> findTopByOrderByEmpIdDesc();
}
