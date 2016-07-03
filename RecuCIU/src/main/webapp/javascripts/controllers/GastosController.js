//controlGastos.controller("GastosController", function ($state, $scope, gastosService) {
controlGastos.controller('GastosController', function ($scope, gastosService,$state) {

	var self = this;
	this.gastos = []
	
    $scope.ingresar = function() {
        $state.go("gastos");
    }
/*
    self.gastos = [
       {
            mes: "Alfreds Futterkiste",
            descripcion : "Germany",
            monto : "Germany"
        }, 

        {
            mes: "Alfreds Futterkiste",
            descripcion : "Germany",
            monto : "Germany"
        }
    ]
*/
});