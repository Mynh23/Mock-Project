package com.mock.parking.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "employee", uniqueConstraints = {
		@UniqueConstraint(columnNames = {
				"email"
		})
})
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Employee {
	private static final long serialVersionUID = 1L;
	
	@Id
	private String empId;
	
	@NotBlank
	@Size(max = 100)
	@Column(length = 100)
	private String name;
	
	@NotBlank
	@Size(max = 40)
	@Email
	@Column(length = 40)
	private String email;
	
	@NotBlank
	@Column(length = 100)
	private String password;
	
	@NotBlank
	@Column(length = 100)
	private String gender;
	
	@NotBlank
	@Column(length = 10)
	private String phone;
	
	@NotBlank
	@Column(length = 100)
	private String address;
	
	@NotBlank
	@Column(length = 100)
	private String role;
}
