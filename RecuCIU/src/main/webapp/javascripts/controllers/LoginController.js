controlGastos.controller("LoginController", function ($state, $scope, gastosService) {

// $scope.usuario
// $scope.pass

  var self = this;
  self.errors = [];

    $scope.ingresar = function(usuario, pass) {

    	gastosService.validarUsuario(usuario, pass)
        .success(
        		function(){
					$state.go("gastos");
        })
        .error(function(error) {
            console.log(error);
            self.errors.push(error)
            while (self.errors.length > 0)
        		self.errors.pop();
        });

}


});

