controlGastos.controller('GastosController', function ($scope, gastosService,$state) {

	var self = this;
    self.errors = [];
    self.usuario = gastosService.user;
    self.totalGastado = 0;
	
    $scope.mostrarDetalle = false;

    $scope.ingresar = function() {
        $state.go("gastos");
    }

    $scope.nuevoGasto = function(descripcion, monto) {
        gastosService.registrarGasto(descripcion, monto)
        .success(
            function(data){
                self.totalGastado = data.totalGastado
                console.log(self.totalGastado);
            })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 0)
                self.errors.pop();
        });
    }

    $scope.buscarDescripcion = function(descrBuscada) {
        gastosService.buscarDescripcion(descrBuscada)
        .success(
            function(data){
                self.gastos = data;
                console.log(self.gastos);
        })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
                self.errors.pop();
        });
    }

    $scope.calcularIndiceInflacion = function(anio, descripcion) {
        gastosService.buscarIndiceInflacion(anio, descripcion)
        .success(
            function(data){
                self.inflacion = data;
                !$scope.mostrarDetalle;
                console.log(self.inflacion);
        })
        .error(function(error) {
            self.errors.push(error)
            while (self.errors.length > 1)
                self.errors.pop();
        });
    }
});