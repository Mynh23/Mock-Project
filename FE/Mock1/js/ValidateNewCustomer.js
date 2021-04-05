$.validator.addMethod("regex", function (value, element, regexp) {
	var re = new RegExp(regexp);
	return this.optional(element) || re.test(value);
});
var i;
$(document).on('mouseover', '.btnSlot', function () {
	var now = $(this);
	i = now;
});
function chooseType() {
	document.getElementById("inputPrice").value = document.getElementById("ChooseType").options[document.getElementById("ChooseType").selectedIndex].value;
}
$().ready(function () {
	$(".btnSlot").on("click", function (e) {
		document.getElementById("inputSlot").value = i.val();
		i.style = "background-color: lightgreen; margin-bottom: 3px;width: 42px;";
	});
});
$(document).ready(function () {
	$("#dailyPassForm").validate({
		rules: {
			"inputName": {
				required: true,
				maxlength: 50,
				regex: "^([a-zA-Z ]+[a-zA-Z])*$"

			},
			"inputPhone": {
				required: true,
				regex: "^[0]{1}[0-9]{9}$",
				maxlength: 11
			},
			"ChooseType": {
				required: true,
			},
			"inputVehicleID": {
				required: true,
				regex: "^[0-9]{2}[a-zA-Z]{1}[a-zA-Z0-9]{1}-[0-9]{3}[.][0-9]{2}$",
				maxlength: 11
			},
			"inputSlot": {
				required: true,
			},
		},
		messages: {
			"inputName": {
				required: "Required!",
				maxlength: "Max 50 characters!",
				regex: "Character only"
			},
			"inputPhone": {
				required: "Required!",
				maxlength: "Max 11 characters!",
				regex: "Must be 10 digits and begin with 0"
			},
			"ChooseType": {
				required: "Required!",
			},
			"inputVehicleID": {
				required: "Required!",
				regex: "Follow this format 11aa-111.11 or 11a1-111.11",
				
			},
			"inputSlot": {
				required: "Required!",
			},
		}
	});
});
$().ready(function () {
	$("#monthlyPassForm").validate({
		
		rules: {
			"inputName": {
				required: true,
				maxlength: 50,
				regex: "^([a-zA-Z ]+[a-zA-Z])*$"
			},
			"inputBirthday": {
				required: true,
				
			},
			"inputPhone": {
				required: true,
				regex: "^[0]{1}[0-9]{9}$"
			},
			"inputEmail": {
				required: true,
				maxlength: 50,
				regex: "^[a-zA-Z0-9_]+@[a-zA-Z0-9]+[.]+[a-zA-Z0-9.]+[a-zA-Z0-9]$"
			},
			"inputAddress": {
				required: true,
				maxlength: 50,
				regex:"^([a-zA-Z0-9-/ ]+[a-zA-Z0-9])*$"
			},
			"ChooseType": {
				required: true,
			},
			"inputVehicleID": {
				required: true,
				
				regex:"^[0-9]{2}[a-zA-Z]{1}[a-zA-Z0-9]{1}-[0-9]{3}[.][0-9]{2}$",
			},
			"inputManufacturer": {
				required: true,
				maxlength: 50,
				regex:"^([a-zA-Z0-9 ]+[a-zA-Z0-9])*$",
			},
			"inputColor": {
				required: true,
				maxlength: 20
			},
			"inputSlot": {
				required: true,
			},
		},
		messages: {
			"inputName": {
				required: "Required!",
				maxlength: "Max 50 characters!",
				regex: "Contain only alphabet characters"
			},
			"inputBirthday": {
				required: "Required!",
				
			},
			"inputPhone": {
				required: "Required!",
				regex: "Must be 10 digits and begin with 0",
			},
			"inputEmail": {
				required: "Required!",
				maxlength: "Max 50 characters!",
				regex: "Follow the format abc@abc.abc"
			},
			"inputAddress": {
				required: "Required!",
				maxlength: "Max 50 characters!",
				regex:"No special characters except \"/\" and \"-\" "
			},
			"ChooseType": {
				required: "Required!",
			},
			"inputVehicleID": {
				required: "Required!",
				regex: "Follow this format 11aa-111.11 or 11a1-111.11"
			},
			"inputManufacturer": {
				required: "Required!",
				maxlength: "Max 50 characters!",
				regex: "No special characters"
			},
			"inputColor": {
				required: "Required!",
				maxlength: "Max 20 characters!"
			},
			"inputSlot": {
				required: "Required!",
			},
		}
	});
});
