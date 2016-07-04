controlGastos.controller('GastosController', function ($scope, gastosService,$state) {

	var self = this;
	this.gastos = []
    self.errors = [];
	
    $scope.ingresar = function() {
        $state.go("gastos");
    }

    $scope.nuevoGasto = function(descripcion, monto) {
        gastosService.registrarGasto(descripcion, monto)
        .success(
            function(){
                //$state.go("login");
        })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
                self.errors.pop();
        });
    }

    $scope.buscarDescripcion = function(descrBuscada) {
        gastosService.buscarDescripcion(descrBuscada)
        .success(
            function(){
                //$state.go("gastos");
        })
        .error(function(error) {
            //console.log(error);
            self.errors.push(error)
            while (self.errors.length > 1)
                self.errors.pop();
        });


    }

});