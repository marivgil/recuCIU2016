controlGastos.controller("LoginController", function ($state, $scope, gastosService) {

  var self = this;
  self.errors = [];

    $scope.ingresar = function(usuario, pass) {

    	gastosService.validarUsuario(usuario, pass)
        .success(
        	function(){
				$state.go("gastos");
        })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
        		self.errors.pop();
        });

	}

    $scope.altaUsuario = function(usuarioAlta, passAlta) {

    	gastosService.registrarUsuario(usuarioAlta, passAlta)
        .success(
        	function(){
				$state.go("login");
        })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
        		self.errors.pop();
        });
    }

});

