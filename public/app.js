function something() {
	alert("Hello!");
}

function add_to_cart(id) {
	var key = "product_" + id
	var x = window.localStorage.getItem(key)
	x = x * 1 + 1
	window.localStorage.setItem(key, x)

	alert(('Item in your cart: ') + cart_get_number_of_item());
}

function cart_get_number_of_item() {
	var cnt = 0
	for (var i = 0; i < window.localStorage.length; i++) {
    var key = localStorage.key(i);
    var value = window.localStorage.getItem(key);

    if (key.indexOf('product_') == 0)
    {
    	cnt = cnt + value * 1;
    }
}
	return cnt;
}