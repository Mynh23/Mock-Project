package com.mock.parking.payload;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class UpdateEmployeeRequest {
	private String name;
	private String email;
	private String password;
	private String gender;
	private String phone;
	private String address;
}
