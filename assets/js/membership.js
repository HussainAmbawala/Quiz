function validateForm() {
	// This function deals with validation of the form fields
	var x,
		y,
		i,
		valid = true;
	x = document.getElementsByClassName("tab");
	y = x[currentTab].getElementsByTagName("textarea1");
	// A loop that checks every input field in the current tab:
	for (i = 0; i < y.length; i++) {
		// If a field is empty...
		if (y[i].value == "") {
			// add an "invalid" class to the field:
			y[i].className += " invalid";
			// and set the current valid status to false
			valid = false;
		}
	}
	// If the valid status is true, mark the step as finished and valid:
	if (valid) {
		document.getElementsByClassName("step")[currentTab].className += " finish";
	}
	return valid; // return the valid status
}


// initialize box-scope
var boxes = document.querySelectorAll(".box");

for (let i = 0; i < boxes.length; i++) {
	let box = boxes[i];
	initDropEffect(box);
	initImageUpload(box);
}

/// drop-effect
function initDropEffect(box) {
	let area,
		drop,
		areaWidth,
		areaHeight,
		maxDistance,
		dropWidth,
		dropHeight,
		x,
		y;

	// get clickable area for drop effect
	area = box.querySelector(".js--image-preview");
	area.addEventListener("click", fireRipple);

	function fireRipple(e) {
		area = e.currentTarget;
		// create drop
		if (!drop) {
			drop = document.createElement("span");
			drop.className = "drop";
			this.appendChild(drop);
		}
		// reset animate class
		drop.className = "drop";

		// calculate dimensions of area (longest side)
		areaWidth = getComputedStyle(this, null).getPropertyValue("width");
		areaHeight = getComputedStyle(this, null).getPropertyValue("height");
		maxDistance = Math.max(parseInt(areaWidth, 10), parseInt(areaHeight, 10));

		// set drop dimensions to fill area
		drop.style.width = maxDistance + "px";
		drop.style.height = maxDistance + "px";

		// calculate dimensions of drop
		dropWidth = getComputedStyle(this, null).getPropertyValue("width");
		dropHeight = getComputedStyle(this, null).getPropertyValue("height");

		// calculate relative coordinates of click
		// logic: click coordinates relative to page - parent's position relative to page - half of self height/width to make it controllable from the center
		x = e.pageX - this.offsetLeft - parseInt(dropWidth, 10) / 2;
		y = e.pageY - this.offsetTop - parseInt(dropHeight, 10) / 2 - 30;

		// position drop and animate
		drop.style.top = y + "px";
		drop.style.left = x + "px";
		drop.className += " animate";
		e.stopPropagation();
	}
}

// **********************************

// $("select[multiple]").multiselect({  //change
// 	columns: 1,
// 	placeholder: "Select options",
// });
// **********************

const check_sport_selected = [];

function formatRows(Title, Type, Category, Amount, startMonth, endMonth, no) {
	
	const array = [];

	var typeText = Type.split(",");
	var typeCategory = Category.split(",");

	array[no] =
		'<tr><td class="col-xs-3"><input type="text" name="Title' +
		no +
		'" value="' +
		Title +
		'" class="form-control editable" readonly/></td>' +
		'<td class="col-xs-3"><input type="text" name="Type' +
		no +
		'" value="' +
		typeText[0] +
		'" class="form-control editable" hidden/><input type="text"  value="' +
		typeText[1] +
		'" class="form-control editable" readonly/></td>' +
		'<td class="col-xs-3"><input type="text" name="Category' +
		no +
		'" value="' +
		typeCategory[0] +
		'" class="form-control editable" hidden/><input type="text"  value="' +
		typeCategory[1] +
		'" class="form-control editable" readonly/></td>' +
		'<td class="col-xs-3"><input type="text" name="Amount' +
		no +
		'" value="' +
		Amount +
		'" class="form-control editable" readonly/></td>' +
		'<td class="col-xs-3"><input type="month" name="startMonth' +
		no +
		'" value="' +
		startMonth +
		'" class="form-control editable" readonly/></td>' +
		'<td class="col-xs-3"><input type="month" name="endMonth' +
		no +
		'" value="' +
		endMonth +
		'" class="form-control editable" readonly/></td>' +
		'<td class="col-xs-1 text-center"><a href="#" onClick="deleteRow(this);">' +
		'<i class="fa fa-trash" aria-hidden="true"></a></td></tr>';

		$("#Title").val('');
		$("#Type").val('');
		$("#Category").val('');
		$("#Amount").val('');
		$("#startMonth").val('');
		$("#endMonth").val('');

	return array[no];
}

function deleteRow(trash) {

	var number = document.getElementById("countNumber").value;
	// console.log(number);
	var no = number - 1;
	// console.log(no);
	document.getElementById("countNumber").value = no;

	$(trash).closest("tr").remove();
}

function addRow(no) {
	var Title = $("#Title").val();
	var Type = $("#Type").val();
	var Category = $("#Category").val();
	var Amount = $("#Amount").val();
	var startMonth = $("#startMonth").val();
	var endMonth = $("#endMonth").val();

	$(
		formatRows(Title, Type, Category, Amount, startMonth, endMonth, no)
	).insertAfter("#addRow");

}

$(".addBtn").click(function () {

	var one = 1;
	var i = document.getElementById("countNumber").value;

	var Title = document.getElementById("Title").value.length;
	var Type = document.getElementById("Type").value.length;
	var Category = document.getElementById("Category").value.length;
	var Amount = document.getElementById("Amount").value.length;
	var startMonth = document.getElementById("startMonth").value.length;
	var endMonth = document.getElementById("endMonth").value.length;

	if (Title != 0 && Type != 0 && Category != 0 && Amount != 0 && startMonth != 0 && endMonth != 0) {
		if (Title >= 0) {
			document.getElementById("Title").style.borderColor = "#ced4da";
		}
		if (Type >= 0) {
			document.getElementById("Type").style.borderColor = "#ced4da";
		}
		if (Category >= 0) {
			document.getElementById("Category").style.borderColor = "#ced4da";
		}
		if (Amount >= 0) {
			document.getElementById("Amount").style.borderColor = "#ced4da";
		}
		if (startMonth >= 0) {
			document.getElementById("startMonth").style.borderColor = "#ced4da";
		}
		if (endMonth >= 0) {
			document.getElementById("endMonth").style.borderColor = "#ced4da";
		}

		var no = parseInt(i) + parseInt(one);
		addRow(no);
		document.getElementById("countNumber").value = no;
	} else {
		if (Title <= 0) {
			document.getElementById("Title").style.borderColor = "red";
		}
		if (Type <= 0) {
			document.getElementById("Type").style.borderColor = "red";
		}
		if (Category <= 0) {
			document.getElementById("Category").style.borderColor = "red";
		}
		if (Amount <= 0) {
			document.getElementById("Amount").style.borderColor = "red";
		}
		if (startMonth <= 0) {
			document.getElementById("startMonth").style.borderColor = "red";
		}
		if (endMonth <= 0) {
			document.getElementById("endMonth").style.borderColor = "red";
		}

		swal("Failed", "Please Fill the Details", "error");
	}
});
