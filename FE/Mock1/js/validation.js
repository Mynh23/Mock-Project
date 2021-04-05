$.validator.addMethod("regex", function (value, element, regexp) {
	var re = new RegExp(regexp);
	return this.optional(element) || re.test(value);
  });

$(document).ready(function() {
	$('#validate').validate({
		rules: {
			inputID: {
				required: true,
				regex: "^[E]{1}[M]{1}[P]{1}[0-9]{3}$"
			},
			inputName: {
				required: true,
				regex: "^([a-zA-Z ]+[a-zA-Z])*$"
			},
			inputDate: {
				required: true
			},
			inputPhone: {
				required: true,
				regex: "^[0]{1}[0-9]{9}$"
			},
			inputEmail: {
				required: true,
				regex: "^[a-zA-Z0-9_]+@[a-zA-Z0-9]+[.]+[a-zA-Z0-9.]+[a-zA-Z0-9]$"
			},
			inputAddress: {
				required: true,
				regex:"^([a-zA-Z0-9-/ ]+[a-zA-Z0-9])*$"
			},
			password: {
				required: true,
			},
			
		},
		messages: {
			inputID: {
				required: "Required!",
				regex: "Must begin with EMP followed by 3 digits, eg: EMP123"
			},
			inputName: {
				required: "Required!",
				regex: "Contain only alphabet characters"
			},
			inputDate: {
				required: "Required!"
			},
			inputPhone: {
				required: "Required!",
				regex: "Must be 10 digits and begin with 0"
			},
			inputEmail: {
				required: "Required!",
				regex: "Follow the format abc@abc.abc"
			},
			inputAddress: {
				required: "Required!",
				regex:"No special characters except \"/\" and \"-\" "
			},
			password: {
				required: "Click the button to generate random password!"
			},
			
		},
		errorPlacement: function(error, element) {
			if(element.attr("name") == "password") {
				error.insertAfter("#password-div");
			} else {
				error.insertAfter(element);
			}
		}
	})

	$('#validate-sell-ticket').validate({
		rules: {
			inputCarID: {
				required: true,
				regex: "^[0-9]{2}[a-zA-Z]{1}[a-zA-Z0-9]{1}-[0-9]{3}[.][0-9]{2}$"
			}
		},
		messages: {
			inputCarID: {
				required: "Required!",
				regex: "Follow this format 11aa-111.11 or 11a1-111.11"
			}
		}
	})

	$('#validate-extend-ticket').validate({
		rules: {
			inputDate: {
				required: true
			},
			inputCarID: {
				required: true,
				regex: "^[0-9]{2}[a-zA-Z]{1}[a-zA-Z0-9]{1}-[0-9]{3}[.][0-9]{2}$"
			},
			inputType:{
				required: true,
			}
		},
		messages: {
			inputDate: {
				required: "Required!"
			},
			inputCarID: {
				required: "Required!",
				regex: "Follow this format 11aa-111.11 or 11a1-111.11"
			}
		}
	})
})