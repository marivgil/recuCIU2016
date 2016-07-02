controlGastos.controller("GastosController", function ($state, $scope) {

    $scope.ingresar = function() {
        $state.go("gastos");
    }

});

