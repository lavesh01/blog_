$(document).ready(function() {
			console.log( "HTML ready!" );
			$('[data-toggle="tooltip"]').tooltip();
			initPhone();
			login('shashikumarnaikar1402406353925124', 'Safe@54321');
});

var input = document.querySelector("#toNumber");
var iti = window.intlTelInput(input,({
}));
setIti(iti);

