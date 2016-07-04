controlGastos.service('gastosService', ['$http', function ($http) {

	this.user=""

	this.validarUsuario = function(usuario, pass){
		this.user = usuario
		console.log("usuario de login: "+this.user);
		return $http.post('http://localhost:9000/login/' + usuario + '/' + pass);
	}

	this.registrarUsuario = function(usuario, pass){
		console.log("usuario de registracion: "+usuario);
		return $http.put('http://localhost:9000/registracion/' + usuario + '/' + pass);
	}

	this.registrarGasto = function(descripcion, monto){
		console.log(this.user);
		console.log(descripcion);
		console.log(monto);
		return $http.put('http://localhost:9000/nuevoGasto/' + this.user + '/' + descripcion + '/' + monto);
	}

	this.buscarDescripcion = function(descripcion){
		console.log(this.user)
		console.log(descripcion)
		return $http.get('http://localhost:9000/buscarDescripcion/' + this.user + '/' + descripcion);
	}

}]);