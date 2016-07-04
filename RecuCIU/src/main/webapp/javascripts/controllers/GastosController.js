controlGastos.controller('GastosController', function ($scope, gastosService,$state) {

	var self = this;
    self.errors = [];
	
    $scope.ingresar = function() {
        $state.go("gastos");
    }

    $scope.nuevoGasto = function(descripcion, monto) {
        gastosService.registrarGasto(descripcion, monto)
        .success()
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
                self.errors.pop();
        });
    }

    $scope.buscarDescripcion = function(descrBuscada) {
        gastosService.buscarDescripcion(descrBuscada)
        .success(
            function(response){
                self.gastos = response.data;
        })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
                self.errors.pop();
        });


    }

});