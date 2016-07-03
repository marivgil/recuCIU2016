//controlGastos.controller("GastosController", function ($state, $scope, gastosService) {
controlGastos.controller("GastosController", ['$scope', function ($scope, gastosService,$state) {
	
  var self = this;

    $scope.gastos = []

    var self = this;
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
}]);