controlGastos.service('gastosService', ['$http', function ($http) {

	this.user=""

	this.validarUsuario = function(usuario, pass){
		this.user = usuario
		return $http.post('http://localhost:9000/login/' + usuario + '/' + pass);
	}

	this.registrarUsuario = function(usuario, pass){
		return $http.put('http://localhost:9000/registracion/' + usuario + '/' + pass);
	}

	this.registrarGasto = function(usuario, descripcion, monto){
		return $http.put('http://localhost:9000/nuevoGasto/' + usuario + '/' + descripcion + '/' + monto);
	}

	this.buscarDescripcion = function(usuario, descripcion){
		return $http.get('http://localhost:9000/buscarDescripcion/' + usuario + '/' + descripcion);
	}

}]);