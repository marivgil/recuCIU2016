controlGastos.service('gastosService', function ($http) {

	this.validarUsuario = function(usuario, pass){
		return $http.post('http://localhost:9000/login/' + usuario + '/' + pass);
	}

	this.registrarUsuario = function(usuario, pass){
		return $http.put('http://localhost:9000/registracion/' + usuario + '/' + pass);
	}

});
