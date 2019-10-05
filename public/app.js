function something() {
	alert("Hello!");
}

function add_to_cart(id) {
	var key = "product" + id
	var x = localStorage.getItem (key)
	x = x * 1 + 1
	localStorage.setItem (key, x)
}