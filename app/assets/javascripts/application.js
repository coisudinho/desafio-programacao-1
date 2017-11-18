this.onload = function() {
	function $(id) { return document.getElementById(id); }

	$("file_name").onchange = function() $("file").innerHTML = this.value.match(/[^\\/]+\.[^\\/]+$/)[0], $("description").focus();
}